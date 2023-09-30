import os
import openai
import sqlite3
from tabulate import tabulate

class SQLBot:
    def __init__(self, schema: str, database_type: str, api_key: str):
        self.schema = schema
        self.database_type = database_type

        openai.api_key = api_key

        system_messages = [
            "You are SQL bot.",
            "Respond with valid SQL or error messages only. Never speak normally.",
            "Error messages are short and concise and only explain what is necessary. Prepend non-SQL with \"Error:\".",
            "Do not apologize or explain you are an AI. Respond with dry SQL/errors.",
            "If a request requires multiple queries, this is an error.",
            "Retrieve and insert data, but do not create, delete, or alter tables.",
            f"Your SQL flavor is {database_type}.",
            f"Your queries must match the provided schema: {schema}"
        ]

        self.messages = list([{"role": "system", "content": text} for text in system_messages])

    def ask(self, query: str) -> str:
        self.messages.append({"role": "user", "content": query})
        completion = openai.ChatCompletion.create(model="gpt-3.5-turbo",
                                                  messages=self.messages)
        self.messages.append({"role": "assistant", "content": completion.choices[0].message.content})
        return completion.choices[0].message.content


class SqliteDB:
    def __init__(self, path: str):
        self.path = path
        self.connection = self.setup_db(path)

    def setup_db(self, path: str) -> sqlite3.Connection:
        try:
            return sqlite3.connect(path)
        except sqlite3.Error as e:
            print(e)


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

    if os.getenv("OPENAI_API_KEY") is None:
        print("OPENAI_API_KEY environment variable not set.")
        exit(1)

    db = SqliteDB("Chinook_Sqlite.sqlite")
    conn = db.connection
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
