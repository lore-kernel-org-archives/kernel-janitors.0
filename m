From: Peter Rosin <peda@axentia.se>
Date: Thu, 17 Jan 2019 11:03:20 +0000
Subject: Re: [PATCH -next] i2c: imx: Fix inconsistent IS_ERR and PTR_ERR in i2c_imx_dma_request()
Message-Id: <e8c15a2a-6b59-42bb-0a1f-2ab53c01b0d6@axentia.se>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1547694894-69589-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1547694894-69589-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: YueHaibing <yuehaibing@huawei.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "fabio.estevam@nxp.com" <fabio.estevam@nxp.com>, "linux-imx@nxp.com" <linux-imx@nxp.com>, "wsa+renesas@sang-engineering.com" <wsa+renesas@sang-engineering.com>, "u.kleine-koenig@pengutronix.de" <u.kleine-koenig@pengutronix.de>, "l.stach@pengutronix.de" <l.stach@pengutronix.de>, "eha@deif.com" <eha@deif.com>, "linux@rempel-privat.de" <linux@rempel-privat.de>
Cc: "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

T24gMjAxOS0wMS0xNyAwNDoxNCwgWXVlSGFpYmluZyB3cm90ZToNCj4gQ2hhbmdlIHRoZSBjYWxs
IHRvIFBUUl9FUlIgdG8gYWNjZXNzIHRoZSB2YWx1ZSBqdXN0IHRlc3RlZCBieSBJU19FUlIuDQo+
IA0KPiBGaXhlczogNWIzYTIzYTNjYzk0ICgiaTJjOiBpbXg6IG5vdGlmeSBhYm91dCByZWFsIGVy
cm9ycyBvbiBkbWEgaTJjX2lteF9kbWFfcmVxdWVzdCIpDQo+IFNpZ25lZC1vZmYtYnk6IFl1ZUhh
aWJpbmcgPHl1ZWhhaWJpbmdAaHVhd2VpLmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJzL2kyYy9idXNz
ZXMvaTJjLWlteC5jIHwgMiArLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAx
IGRlbGV0aW9uKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1p
bXguYyBiL2RyaXZlcnMvaTJjL2J1c3Nlcy9pMmMtaW14LmMNCj4gaW5kZXggMDliMTI0NS4uNDJm
ZWQ0MCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1pbXguYw0KPiArKysg
Yi9kcml2ZXJzL2kyYy9idXNzZXMvaTJjLWlteC5jDQo+IEBAIC0yODcsNyArMjg3LDcgQEAgc3Rh
dGljIGludCBpMmNfaW14X2RtYV9yZXF1ZXN0KHN0cnVjdCBpbXhfaTJjX3N0cnVjdCAqaTJjX2lt
eCwNCj4gIA0KPiAgCWRtYS0+Y2hhbl90eCA9IGRtYV9yZXF1ZXN0X2NoYW4oZGV2LCAidHgiKTsN
Cj4gIAlpZiAoSVNfRVJSKGRtYS0+Y2hhbl90eCkpIHsNCj4gLQkJcmV0ID0gUFRSX0VSUihkbWEt
PmNoYW5fcngpOw0KPiArCQlyZXQgPSBQVFJfRVJSKGRtYS0+Y2hhbl90eCk7DQo+ICAJCWlmIChy
ZXQgIT0gLUVOT0RFViAmJiByZXQgIT0gLUVQUk9CRV9ERUZFUikNCj4gIAkJCWRldl9lcnIoZGV2
LCAiY2FuJ3QgcmVxdWVzdCBETUEgdHggY2hhbm5lbCAoJWQpXG4iLCByZXQpOw0KPiAgCQlnb3Rv
IGZhaWxfYWw7DQo+IA0KPiANCj4gDQoNCllvdSB3ZXJlIGJlYXRlbiB0byBpdCBieSBMYXVyZW50
aXUgVHVkb3IsIHdobyBzZW50IHRoZSBzYW1lIHBhdGNoIFsxXSBzaG9ydGx5DQpiZWZvcmUgeW91
Lg0KDQpodHRwczovL2xvcmUua2VybmVsLm9yZy9wYXRjaHdvcmsvcGF0Y2gvMTAzMjUxMS8NCg0K
Q2hlZXJzLA0KUGV0ZXINCg=
