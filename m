From: linmiaohe <linmiaohe@huawei.com>
Date: Sat, 11 Jan 2020 09:50:12 +0000
Subject: Re: [PATCH][next] ath11k: avoid null pointer dereference when pointer band is null
Message-Id: <05d5d54e035e4d69ad4ffb4a835a495a@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200111090824.9999-1-colin.king@canonical.com>
In-Reply-To: <20200111090824.9999-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, John Crispin <john@phrozen.org>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "David S . Miller" <davem@davemloft.net>, Shashidhar Lakkavalli <slakkavalli@datto.com>, "ath11k@lists.infradead.org" <ath11k@lists.infradead.org>, Kalle Valo <kvalo@codeaurora.org>

DQpDb2xpbiBJYW4gS2luZyA8Y29saW4ua2luZ0BjYW5vbmljYWwuY29tPiB3cm90Ze+8mg0KPkZy
b206IENvbGluIElhbiBLaW5nIDxjb2xpbi5raW5nQGNhbm9uaWNhbC5jb20+DQo+DQo+SW4gdGhl
IHVubGlrZWx5IGV2ZW50IHRoYXQgY2FwLT5zdXBwb3J0ZWRfYmFuZHMgaGFzIG5laXRoZXIgV01J
X0hPU1RfV0xBTl8yR19DQVAgc2V0IG9yIFdNSV9IT1NUX1dMQU5fNUdfQ0FQIHNldCB0aGVuIHBv
aW50ZXIgYmFuZCBpcyBudWxsIGFuZCBhIG51bGwgZGVyZWZlcmVuY2Ugb2NjdXJzIHdoZW4gYXNz
aWduaW5nDQo+YmFuZC0+bl9pZnR5cGVfZGF0YS4gIE1vdmUgdGhlIGFzc2lnbm1lbnQgdG8gdGhl
IGlmIGJsb2NrcyB0bw0KPmF2b2lkIHRoaXMuICBDbGVhbnMgdXAgc3RhdGljIGFuYWx5c2lzIHdh
cm5pbmdzLg0KPg0KPkFkZHJlc3Nlcy1Db3Zlcml0eTogKCJFeHBsaWNpdCBudWxsIGRlcmVmZXJl
bmNlIikNCj5GaXhlczogOWYwNTZlZDhlZTAxICgiYXRoMTFrOiBhZGQgSEUgc3VwcG9ydCIpDQo+
U2lnbmVkLW9mZi1ieTogQ29saW4gSWFuIEtpbmcgPGNvbGluLmtpbmdAY2Fub25pY2FsLmNvbT4N
Cj4tLS0NCj4gZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0aDExay9tYWMuYyB8IDggKysrKy0t
LS0NCj4gMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkNCg0K
SXQgbG9va3MgZmluZSBmb3IgbWUuIFRoYW5rcy4NClJldmlld2VkLWJ5OiBNaWFvaGUgTGluIDxs
aW5taWFvaGVAaHVhd2VpLmNvbT4NCg=
