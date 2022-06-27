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
    "th19v6X0-65IV0D9o-K0G3x89J",
	"8sN10of3-F892sD3K-MkO3g758",
	"b4ou372L-05ezuj42-t0jy21X4",
	"u12b5lz3-152v3Hfu-5Ab9ng36",
	"1K0CM4t3-Ts6D108d-Ln983x1R",
	"5037ESOz-Ye4681nK-d3QD952R",
	"0pEKL348-Q58V9d4m-asBI5961",
	"W4I6w38j-Wt8d02n3-Z31Fs7l6",
	"N925r6BZ-2eG3s0b1-p05dwi96",
	"23uzh4L5-L4EC5u80-8u2f7I4j",
	"1dXY53R4-0soXC637-203lEsi4",
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

print(f"Type account: {account_type}")
print(f"Data transfer: {referral_count} Gbyte")
print(f"License: {license}")
