import random
import httpx

base_url = "https://api.cloudflareclient.com/v0a2405"
headers = {
    "CF-Client-Version": "a-6.15-2405",
    "Host": "api.cloudflareclient.com",
    "Connection": "Keep-Alive",
    "Accept-Encoding": "gzip",
    "User-Agent": "okhttp/3.12.1",
}
keys = (
    "38l74GZW-34gpSX87-52E71iCA",
    "092n1Mks-8GPK70n5-sE72w95F",
    "63M5mGn4-05Z2V8uX-Y153Lb0q",
    "4v92D8QZ-R352fI0n-231Y9FEV",
    "D2t4es89-93O86mhZ-WB548U9w",
    "9s64jxd3-74Qc9I3f-5f9UQ12I",
    "7B9pc28y-S1t9em34-XkN40u78",
    "S8rm524u-04ug17dy-43UTKX01",
    "z8Q0f19r-41jzmT70-Bf375yb2",
    "GcO7623m-9k7IR0U3-1YkU350g",
)
key = random.choice(keys)

with httpx.Client(base_url=base_url, headers=headers, timeout=10.0) as client:
    r = client.post("/reg")
    id = r.json()["id"]
    license = r.json()["account"]["license"]
    token = r.json()["token"]

    headers_get = {"Authorization": f"Bearer {token}"}
    headers_post = {
        "Content-Type": "application/json; charset=UTF-8",
        "Authorization": f"Bearer {token}",
    }

    r = client.post("/reg")
    id2 = r.json()["id"]
    token2 = r.json()["token"]

    headers_get2 = {"Authorization": f"Bearer {token2}"}

    json = {"referrer": f"{id2}"}
    client.patch(f"/reg/{id}", headers=headers_post, json=json)

    client.delete(f"/reg/{id2}", headers=headers_get2)

    json = {"license": f"{key}"}
    client.put(f"/reg/{id}/account", headers=headers_post, json=json)

    json = {"license": f"{license}"}
    client.put(f"/reg/{id}/account", headers=headers_post, json=json)

    r = client.get(f"/reg/{id}/account", headers=headers_get)
    account_type = r.json()["account_type"]
    referral_count = r.json()["referral_count"]
    license = r.json()["license"]

    client.delete(f"/reg/{id}", headers=headers_get)

print(f"Тип аккаунта: {account_type}")
print(f"Данных выделено: {referral_count} Гбайт")
print(f"Лицензия: {license}")
