import csv

from pathlib import Path


def read_csv(file_name: str) -> None:
    path = Path(".").resolve()
    file_path = path.joinpath("data").joinpath(file_name)

    with open(file_path, newline="") as csvfile:
        reader = csv.DictReader(csvfile)
        return (reader.fieldnames, list(reader))


def save_to_csv(filename: str, data) -> None:
    headers = data[0].keys()
    with open(filename, "w", encoding="utf8") as fd:
        csv_out = csv.DictWriter(fd, fieldnames=headers)
        csv_out.writeheader()
        csv_out.writerows(data)
