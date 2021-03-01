from utils.csv_operations import read_csv, save_to_csv
from utils.get_api import get_from_via_cep_api
import time
import json
from datetime import datetime


def get_data(csv_file_name):
    print(f"####### lendo dados do arquivo {csv_file_name}")
    _, data = read_csv(csv_file_name)
    return data


def save_json(data: dict):
    filename = f"{str(datetime.now()).replace(' ', '_')}.json"
    with open(filename, "w", encoding="utf8") as json_output:
        json.dump(data, json_output, ensure_ascii=False)
    return filename


def get_cidade_from_csv_data_cep(data):
    print("####### buscando informacoes do cep via api")
    KEY_NAME = "Informe o CEP  referente ao endereço onde vai estudar de forma remota. (ex. 37701000)"
    ceps_to_search = {item[KEY_NAME] for item in data if item[KEY_NAME]}
    print(ceps_to_search)
    cep_cidade = {}
    for cep in ceps_to_search:
        cep_cidade[cep] = get_from_via_cep_api(cep)
        time.sleep(1)

    return save_json(cep_cidade)


def update_dict(data_dict, value):
    data_dict.update(
        {
            "cidade": value["localidade"],
            "UF": value["uf"],
            "cep_formatado": value["cep"],
        }
    )
    return data_dict


def get_cep_data_from_file(cep_detail_filename):
    print("####### lendo dados de cep detalhado no arquivo json")
    with open(cep_detail_filename, "r") as fd:
        return json.load(fd)


def update_with_extra(data: list, cep_detail: dict):
    print("####### atualizando dados com informacoes adicionais do cep")
    lookup_key = "Informe o CEP  referente ao endereço onde vai estudar de forma remota. (ex. 37701000)"
    updated_data = []
    for key, value in cep_detail.items():
        if value and value.get("localidade"):
            for d in data:
                if d[lookup_key] == key:
                    updated_data.append(update_dict(d, value))

    print(f"####### Total atualizado: {len(updated_data)}")
    return updated_data


def sanitize_cep(data):
    print("####### corrigindo ceps")
    lookup_key = "Informe o CEP  referente ao endereço onde vai estudar de forma remota. (ex. 37701000)"

    for d in data:
        cep = d[lookup_key]
        if len(cep) < 8:
            cep_fill_pattern = "{:<08}"
            cep_filled = cep_fill_pattern.format(cep)
            d.update({lookup_key: cep_filled})
        if len(cep) > 8:
            d.update({lookup_key: cep[:8]})
    return data


if __name__ == "__main__":
    data = get_data("selecionados_consolidado_20210225.csv")
    data_sanitized = sanitize_cep(data)
    cidade_json_filename = get_cidade_from_csv_data_cep(data)
    cep_detail_data = get_cep_data_from_file(cidade_json_filename)
    updated_data = update_with_extra(data_sanitized, cep_detail_data)
    output_filename = "output.csv"
    print(f"####### salvando arquivo final csv: {output_filename}")
    save_to_csv(output_filename, updated_data)
