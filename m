From: Madalin-cristian Bucur <madalin.bucur@nxp.com>
Date: Thu, 07 Sep 2017 07:14:12 +0000
Subject: RE: [PATCH] fsl/fman: make arrays port_ids static, reduces object code size
Message-Id: <AM5PR0402MB269115B69D04CEF3EC125855EC940@AM5PR0402MB2691.eurprd04.prod.outlook.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170831132449.27600-1-colin.king@canonical.com>
In-Reply-To: <20170831132449.27600-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>
Cc: "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBDb2xpbiBLaW5nIFttYWlsdG86
Y29saW4ua2luZ0BjYW5vbmljYWwuY29tXQ0KPiBTZW50OiBUaHVyc2RheSwgQXVndXN0IDMxLCAy
MDE3IDQ6MjUgUE0NCj4gU3ViamVjdDogW1BBVENIXSBmc2wvZm1hbjogbWFrZSBhcnJheXMgcG9y
dF9pZHMgc3RhdGljLCByZWR1Y2VzIG9iamVjdA0KPiBjb2RlIHNpemUNCj4gDQo+IEZyb206IENv
bGluIElhbiBLaW5nIDxjb2xpbi5raW5nQGNhbm9uaWNhbC5jb20+DQo+IA0KPiBEb24ndCBwb3B1
bGF0ZSB0aGUgYXJyYXlzIHBvcnRfaWRzIG9uIHRoZSBzdGFjaywgaW5zdGVhZCBtYWtlIHRoZW0g
c3RhdGljLg0KPiBNYWtlcyB0aGUgb2JqZWN0IGNvZGUgc21hbGxlciBieSBvdmVyIDcwMCBieXRl
czoNCj4gDQo+IEJlZm9yZToNCj4gICAgdGV4dAkgICBkYXRhCSAgICBic3MJICAgIGRlYwkgICAg
aGV4CWZpbGVuYW1lDQo+ICAgMjg3ODUJICAgNTgzMgkgICAgMTkyCSAgMzQ4MDkJICAgODdmOQlm
bWFuLm8NCj4gDQo+IEFmdGVyOg0KPiAgICB0ZXh0CSAgIGRhdGEJICAgIGJzcwkgICAgZGVjCSAg
ICBoZXgJZmlsZW5hbWUNCj4gICAyNzkyMQkgICA1OTkyCSAgICAxOTIJICAzNDEwNQkgICA4NTM5
CWZtYW4ubw0KPiANCj4gU2lnbmVkLW9mZi1ieTogQ29saW4gSWFuIEtpbmcgPGNvbGluLmtpbmdA
Y2Fub25pY2FsLmNvbT4NCg0KVGhhbmtzLA0KTWFkYWxpbg0K
