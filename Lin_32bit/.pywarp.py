import random

import httpx

base_url = "https://api.cloudflareclient.com"
base_headers = {
    "CF-Client-Version": "a-6.22-2970",
    "Host": "api.cloudflareclient.com",
    "Connection": "Keep-Alive",
    "Accept-Encoding": "gzip",
    "User-Agent": "okhttp/3.12.1",
}

keys = (
    "32j4kzq0-6F2a7N3V-yr2MX547",
    "4aS5U09D-RW360U7S-462ZHX9O",
    "hyk37w54-q467elf8-4g2Sc0J6",
    "6054Qgxf-3n6l7tI1-Nw5347gH",
    "Y4F6Z75y-62kpnt79-3U1DC98v",
    "sB28o14C-98M61LDc-5kY4Zn32",
    "mpgO9582-4Q8r0tA6-Sv7K91a0",
    "684w0glT-r19qpO65-S3M2F5B8",
    "7r51R0ga-6o082dZI-Zd0GI837",
    "VCx27I48-5H870fJp-oS0b7d49",
    "JBE6143v-ru7a682Q-Z7jh0z12",
    "s5U9I2F8-G48b20gY-1qE40c2O",
)


def get_reg(client, json={}):
    url = "/v0a2970/reg"
    headers = {"Content-Type": "application/json; charset=UTF-8"}
    r = client.post(url, headers=headers, json=json)
    reg_id = r.json()["id"]
    token = r.json()["token"]
    license = r.json()["account"]["license"]
    return reg_id, token, license


def add_key(client, reg_id, token, license=random.choice(keys)):
    url = f"/v0a2970/reg/{reg_id}/account"
    headers = {
        "Content-Type": "application/json; charset=UTF-8",
        "Authorization": f"Bearer {token}",
    }
    json = {"license": f"{license}"}
    r = client.put(url, headers=headers, json=json)


def get_info(client, reg_id, token):
    url = f"/v0a2970/reg/{reg_id}/account"
    headers = {"Authorization": f"Bearer {token}"}
    r = client.get(url, headers=headers)
    account_type = r.json()["account_type"]
    referral_count = r.json()["referral_count"]
    license = r.json()["license"]
    return account_type, referral_count, license


def del_reg(client, reg_id, token):
    url = f"/v0a2970/reg/{reg_id}"
    headers = {"Authorization": f"Bearer {token}"}
    r = client.delete(url, headers=headers)


def main():
    with httpx.Client(base_url=base_url, headers=base_headers, timeout=15.0) as client:
        reg = get_reg(client)
        json = {"referrer": f"{reg[0]}"}
        get_reg(client, json)
        add_key(client, reg[0], reg[1])
        add_key(client, reg[0], reg[1], reg[2])
        info = get_info(client, reg[0], reg[1])
        del_reg(client, reg[0], reg[1])
        print(f"Тип аккаунта: {info[0]}")
        print(f"Данных выделено: {info[1]} Гбайт")
        print(f"Лицензия: {info[2]}")


main()
