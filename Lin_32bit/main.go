package main

import (
	"crypto/tls"
	"encoding/json"
	"fmt"
	"io/ioutil"
	"math/rand"
	"net/http"
	"strconv"
	"strings"
	"time"
)

var keys = []string{
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
}

type fullAccountData struct {
	Id              string    `json:"id"`
	Type            string    `json:"type"`
	Name            string    `json:"name"`
	Account         Account   `json:"account"`
	Token           string    `json:"token"`
	WarpEnabled     bool      `json:"warp_enabled"`
	WaitlistEnabled bool      `json:"waitlist_enabled"`
	Created         time.Time `json:"created"`
	Updated         time.Time `json:"updated"`
	Place           int64     `json:"place"`
	Locale          string    `json:"locale"`
	Enabled         bool      `json:"enabled"`
	InstallId       string    `json:"install_id"`
}

type Account struct {
	Id                       string    `json:"id"`
	AccountType              string    `json:"account_type"`
	Created                  time.Time `json:"created"`
	Updated                  time.Time `json:"updated"`
	PremiumData              int64     `json:"premium_data"`
	Quota                    int64     `json:"quota"`
	Usage                    int64     `json:"usage"`
	WarpPlus                 bool      `json:"warp_plus"`
	ReferralCount            int64     `json:"referral_count"`
	ReferralRenewalCountdown int64     `json:"referral_renewal_countdown"`
	Role                     string    `json:"role"`
	License                  string    `json:"license"`
}

var (
	accountOne fullAccountData
	accountTwo fullAccountData
)

func main() {

	tr := &http.Transport{
		TLSClientConfig: &tls.Config{
			MinVersion: tls.VersionTLS12,
			MaxVersion: tls.VersionTLS12,
		},
		ForceAttemptHTTP2:     false,
		Proxy:                 http.ProxyFromEnvironment,
		MaxIdleConns:          100,
		IdleConnTimeout:       90 * time.Second,
		TLSHandshakeTimeout:   10 * time.Second,
		ExpectContinueTimeout: 1 * time.Second,
	}

	client := &http.Client{Transport: tr, Timeout: 10 * time.Second}

	rand.Seed(time.Now().UnixNano())
	key := keys[rand.Intn(len(keys))]

	requestBody := strings.NewReader("{}")
	regFirstAccount, err := http.NewRequest(http.MethodPost, "https://api.cloudflareclient.com/v0a2405/reg", requestBody)
	if err != nil {
		fmt.Println("errRegFirstAccount: ", err)
	}

	regFirstAccount.Header.Set("CF-Client-Version", "a-6.15-2405")
	regFirstAccount.Header.Set("Host", "api.cloudflareclient.com")
	regFirstAccount.Header.Set("Connection", "Keep-Alive")
	regFirstAccount.Header.Set("User-Agent", "okhttp/3.12.1")

	res, err := client.Do(regFirstAccount)
	if err != nil {
		fmt.Println(err)
	}

	resBytes, err := ioutil.ReadAll(res.Body)
	if err != nil {
		fmt.Println(err)
	}

	err = json.Unmarshal(resBytes, &accountOne)
	if err != nil {
		fmt.Println(err)
	}

	regSecAccount, err := http.NewRequest(http.MethodPost, "https://api.cloudflareclient.com/v0a2405/reg", requestBody)
	if err != nil {
		fmt.Println(err)
	}
	regSecAccount.Header.Set("CF-Client-Version", "a-6.15-2405")
	regSecAccount.Header.Set("Host", "api.cloudflareclient.com")
	regSecAccount.Header.Set("Connection", "Keep-Alive")
	regSecAccount.Header.Set("User-Agent", "okhttp/3.12.1")

	res2, err := client.Do(regSecAccount)
	if err != nil {
		fmt.Println(err)
	}

	resBytes2, err := ioutil.ReadAll(res2.Body)
	if err != nil {
		fmt.Println(err)
	}

	err = json.Unmarshal(resBytes2, &accountTwo)
	if err != nil {
		fmt.Println(err)
	}

	reqData := fmt.Sprintf(`{"referrer": "%s"}`, accountTwo.Id)
	requestBody = strings.NewReader(reqData)
	updateReferrer, err := http.NewRequest(
		http.MethodPatch,
		"https://api.cloudflareclient.com/v0a2405/reg/"+accountOne.Id,
		requestBody,
	)
	if err != nil {
		fmt.Println(err)
	}

	updateReferrer.Header.Set("Content-Type", "application/json; charset=UTF-8")
	updateReferrer.Header.Set("Authorization", "Bearer "+accountOne.Token)

	_, err = client.Do(updateReferrer)
	if err != nil {
		fmt.Println(err)
	}

	deleteSecAccount, err := http.NewRequest(
		http.MethodDelete,
		"https://api.cloudflareclient.com/v0a2405/reg/"+accountTwo.Id,
		nil,
	)
	if err != nil {
		fmt.Println(err)
	}

	deleteSecAccount.Header.Set("Authorization", "Bearer "+accountTwo.Token)

	_, err = client.Do(deleteSecAccount)
	if err != nil {
		fmt.Println(err)
	}

	keyf := fmt.Sprintf(`{"license": "%s"}`, key)
	requestBody = strings.NewReader(keyf)
	putNewLicenseKey, err := http.NewRequest(
		http.MethodPut,
		"https://api.cloudflareclient.com/v0a2405/reg/"+accountOne.Id+"/account",
		requestBody,
	)
	if err != nil {
		fmt.Println(err)
	}

	putNewLicenseKey.Header.Set("Content-Type", "application/json; charset=UTF-8")
	putNewLicenseKey.Header.Set("Authorization", "Bearer "+accountOne.Token)

	_, err = client.Do(putNewLicenseKey)
	if err != nil {
		fmt.Println(err)
	}

	licensef := fmt.Sprintf(`{"license": "%s"}`, accountOne.Account.License)
	requestBody = strings.NewReader(licensef)
	updateAccountLicense, err := http.NewRequest(
		http.MethodPut,
		"https://api.cloudflareclient.com/v0a2405/reg/"+accountOne.Id+"/account",
		requestBody,
	)
	if err != nil {
		fmt.Println(err)
	}
	updateAccountLicense.Header.Set("Content-Type", "application/json; charset=UTF-8")
	updateAccountLicense.Header.Set("Authorization", "Bearer "+accountOne.Token)

	_, err = client.Do(updateAccountLicense)
	if err != nil {
		fmt.Println(err)
	}

	getWarpAccount, err := http.NewRequest(
		http.MethodGet,
		"https://api.cloudflareclient.com/v0a2405/reg/"+accountOne.Id+"/account",
		nil,
	)
	if err != nil {
		fmt.Println(err)
	}
	getWarpAccount.Header.Set("Authorization", "Bearer "+accountOne.Token)

	accountResponse, err := client.Do(getWarpAccount)
	if err != nil {
		fmt.Println(err)
	}

	getAccountBody, err := ioutil.ReadAll(accountResponse.Body)
	if err != nil {
		fmt.Println(err)
	}

	var account *Account

	err = json.Unmarshal(getAccountBody, &account)
	if err != nil {
		fmt.Println(err)
	}

	dataTransfer := float64(account.ReferralCount) / 1000
	dtStr := strconv.FormatFloat(dataTransfer, 'f', 3, 64)

	data := map[string]string{
		"License key":   strings.Trim(account.License, "\""),
		"Data transfer": dtStr + " TB",
	}

  greenColorOut := "\033[1;32m"
  colorReset := "\033[0m"

  fmt.Println(greenColorOut, "Data transfer: "+data["Data transfer"])
  fmt.Println(greenColorOut, "License key: "+data["License key"], colorReset)

	deleteSecAccount, err = http.NewRequest(
		http.MethodDelete,
		"https://api.cloudflareclient.com/v0a2405/reg/"+accountOne.Id,
		nil,
	)
	if err != nil {
		fmt.Println(err)
	}

	deleteSecAccount.Header.Set("Authorization", "Bearer "+accountOne.Token)

	_, err = http.DefaultClient.Do(deleteSecAccount)
	if err != nil {
		fmt.Println(err)
	}

}
