import random
import httpx
import pyperclip

base_url = "https://api.cloudflareclient.com/v0a2405"
headers = {
    "CF-Client-Version": "a-6.15-2405",
    "Host": "api.cloudflareclient.com",
    "Connection": "Keep-Alive",
    "Accept-Encoding": "gzip",
    "User-Agent": "okhttp/3.12.1",
}
keys = (
    "Io935xs2-7z1P65Wi-93wC5Hi2",
    "d8D2tB46-1ZVB4G75-EFoy6817",
    "m9054gFd-s7r302Wm-Yd5e310W",
    "mE4370Tp-37uI5QX0-1520FzTu",
    "5Ij3k9x8-z89X03Bf-8I046Ttk",
    "7K142EYT-5h14ZJj9-7nfq46a5",
    "69R14Lgr-3217hSGw-F6y741jR",
    "23t1Zw8K-V9MR4v58-79G4oU6u",
    "9YDz3x04-970w6ptv-cC27y38t",
    "q7Wr91K4-5Mp8yT97-qtjS6109",
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
    referral_count = r.json()["referral_count"]/1000
    license = r.json()["license"]

    client.delete(f"/reg/{id}", headers=headers_get)

print(f"Data transfer: {referral_count} TB")
print(f"License key: {license}")

pyperclip.copy(f"{license}")
