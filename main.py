import os
import openai
import sqlite3


def setup_db() -> sqlite3.Connection:
    try:
        conn = sqlite3.connect('Chinook_Sqlite.sqlite')
    except sqlite3.Error as e:
        print(e)
    else:
        return conn


def ask_openai(schema: str, query: str) -> str:
    openai.api_key = os.getenv("OPENAI_API_KEY")

    messages = [
        {"role": "system", "content": "You are SQL bot."},
        {"role": "system",
         "content": "You accept requests from humans and translate them into equivalent SQL queries."},
        {"role": "system", "content": "You never speak normally. You ONLY give valid SQL queries"},
        {"role": "system", "content": "You are provided a schema, and your queries always match the schema. Your SQL "
                                      "flavor is sqlite"},
        {"role": "system", "content": f"This is your schema: ${schema}"},
        {"role": "user", "content": query}
    ]

    completion = openai.ChatCompletion.create(model="gpt-3.5-turbo",
                                              messages=messages)
    return completion.choices[0].message.content


def get_schema(conn: sqlite3.Connection) -> str:
    cur = conn.cursor()
    cur.execute("SELECT name FROM sqlite_master WHERE type='table';")
    tables = cur.fetchall()

    # Build schema string
    schema = "SQLite database schema:\n\n"

    for table_name in tables:
        schema += table_name[0] + ":\n"

        column_info = cur.execute("PRAGMA table_info({})".format(table_name[0])).fetchall()

        for column in column_info:
            schema += column[1] + " " + column[2] + "\n"

        schema += "\n"

    return schema


if __name__ == '__main__':
    conn = setup_db()
    cur = conn.cursor()
    schema = get_schema(conn)
    # print(schema)
    query = ask_openai(schema, "List all the customers who bought a track from the genre Rock. Also give me the "
                               "composer")

    print(query)
    print()

    cur.execute(query)
    print(cur.fetchall())
    conn.close()
