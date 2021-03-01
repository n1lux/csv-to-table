from database import DB
from utils.csv_operations import read_csv
from config import DB_NAME


def import_csv_to_db(db: DB, table_name: str, csv_file_name: str):
    db.drop_table(table_name)

    field_names, data = read_csv(csv_file_name)
    if not db.check_table_exists(table_name):
        db.create_table(
            table_name=table_name, field_names=field_names, primary_key="cpf"
        )
    data = [tuple(item.values()) for item in data]
    db.insert(table_name=table_name, rows=data)


if __name__ == "__main__":
    db = DB(DB_NAME)
    # define (table_name, csv file name)
    items = (
        ("atualizaram_endereco_formulario_2", "atualizaram_endereco_formulario_2.csv"),
    )

    for (table_name, csv_file_name) in items:
        import_csv_to_db(db, table_name, csv_file_name)

    db.close()
