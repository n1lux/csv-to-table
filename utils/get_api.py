import requests
import json


def fetch_data(url):
    resp = requests.get(url)
    try:
        json_data = resp.json()
    except json.decoder.JSONDecodeError:
        print(f"Error ao buscar: {url}")
        return {}
    return json_data


def get_from_via_cep_api(cep: str):
    CEP_URL = f"https://viacep.com.br/ws/{cep}/json/unicode/"
    print(f"############## Buscando: {cep}")
    return fetch_data(CEP_URL)
