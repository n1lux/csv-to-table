import csv

from pathlib import Path
def read_csv(file_name: str) -> any:
    path = Path('.').resolve()
    file_path = path.joinpath('data').joinpath(file_name)

    with open(file_path, newline='') as csvfile:
        reader = csv.DictReader(csvfile)
        return (reader.fieldnames, list(reader))