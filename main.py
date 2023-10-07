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
            "The user might report back the results of the query, but only reference this if asked by the user.",
            f"Your SQL flavor is {database_type}.",
            f"Your queries must match the provided schema: {schema}"
        ]

        self.messages = list([{"role": "system", "content": text} for text in system_messages])

    def ask(self, query: str) -> str:
        """ Queries the bot with the given string and returns the response in the context of the current
        conversation."""

        self.messages.append({"role": "user", "content": query})
        completion = openai.ChatCompletion.create(model="gpt-3.5-turbo",
                                                  messages=self.messages)
        self.messages.append({"role": "assistant", "content": completion.choices[0].message.content})
        return completion.choices[0].message.content

    def append_query_results(self, message: str):
        """ Appends the given message to the conversation history with the given role. """

        self.messages.append({"role": "user", "content": f"Here were the results of the query: {message}"})


class SqliteDB:
    def __init__(self, path: str):
        self.path = path
        self.connection = self.setup_db()

    def setup_db(self) -> sqlite3.Connection:
        try:
            return sqlite3.connect(self.path)
        except sqlite3.Error as e:
            print(e)
            exit(1)

    def setup_db_schema_and_seed(self, schema_file_path: str) -> sqlite3.Connection:
        try:
            cur = self.connection.cursor()
            cur.executescript(open(schema_file_path, "r").read())
            conn.commit()
            cur.close()
            return conn
        except sqlite3.Error as e:
            print(e)
            exit(1)

    def get_schema(self) -> str:
        """ Returns a string containing the schema of the database """

        cur = self.connection.cursor()
        cur.execute("SELECT name FROM sqlite_master WHERE type='table';")
        tables = cur.fetchall()
        cur.close()

        schema_details = "SQLite database schema:\n\n"

        for table_name in tables:
            schema_details += table_name[0] + ":\n"

            cur = self.connection.cursor()
            column_info = cur.execute("PRAGMA table_info({})".format(table_name[0])).fetchall()
            cur.close()

            for column in column_info:
                schema_details += column[1] + " " + column[2] + "\n"

            schema_details += "\n"

        return schema_details


if __name__ == '__main__':

    if os.getenv("OPENAI_API_KEY") is None:
        print("OPENAI_API_KEY environment variable not set.")
        exit(1)

    db = SqliteDB("nfl.db")
    # db.setup_db_schema_and_seed("setup_db.sql")

    conn = db.connection

    schema = db.get_schema()

    sql_bot = SQLBot(schema, "sqlite", os.getenv("OPENAI_API_KEY"))

    print("Enter your query or type \"exit\" to quit.")
    while True:
        request = input(">")
        if request == "exit":
            break

        query = sql_bot.ask(request)

        if query.startswith("Error: "):
            print(query)
            continue

        cur = conn.cursor()
        cur.execute(query)

        column_names = [i[0] for i in cur.description]
        rows = cur.fetchall()
        cur.close()

        print(tabulate([["Query"], [query]], tablefmt="grid"))
        table_view = tabulate(rows, headers=column_names, tablefmt="grid")
        print(table_view)

        # TODO: should the results be fed back into the bot?
        # sql_bot.append_query_results(table_view)

    conn.close()
