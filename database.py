import sqlite3


class DB:
    def __init__(self, db_name: str):
        self._db_name = db_name
        self._conn = None
        self._cur = None
        self.get_connection()
        self.get_cursor()

    def get_connection(self):
        print("Connectando na base de dados")
        try:
            conn = sqlite3.connect(self._db_name)
            print("Connectado")
            self._conn = conn
        except Exception as e:
            print(f"Falha na conexao com a base de dados {e}")

    def get_cursor(self):
        try:
            cursor = self._conn.cursor()
            self._cur = cursor
        except:
            cursor.close()

    def insert(self, table_name: str, rows: list[tuple]):
        total_fields = len(rows[0])
        mask_fields = ','.join('?' * total_fields)
        sql_stetment = f'insert into {table_name} values ({mask_fields})'

        try:
            self._cur.executemany(sql_stetment, rows)
        except Exception as ex:
            print(f'erro na insercao {ex}')

        self._conn.commit()
        print(f'Inserted data into {table_name}')

    def check_table_exists(self, table_name: str):
        self._cur.execute(
            f'''SELECT count(name) FROM sqlite_master WHERE type='table' AND name='{table_name}' ''')

        if self._cur.fetchone()[0] == 1:
            return True

    def create_table(self, table_name: str, field_names: list, primary_key: str = None):
        TABLE_NAME = table_name

        SQL_STR = f'''CREATE TABLE {TABLE_NAME} {tuple(field_names)}'''
        self._cur.execute(SQL_STR)
        print(f'{table_name} created...')

    def drop_table(self, table_name: str):
        sql_query = f'DROP TABLE {table_name}'
        try:
            self._cur.execute(sql_query)
            print(f'{table_name} droped...')
        except sqlite3.OperationalError:
            print(f'Table {table_name} does not exists')

    def close(self):
        self._cur.close()
        self._conn.close()
