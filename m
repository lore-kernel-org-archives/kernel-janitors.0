From: Igor Russkikh <irusskikh@marvell.com>
Date: Thu, 02 Apr 2020 11:40:06 +0000
Subject: RE: [EXT] [PATCH][next] net: atlantic: fix missing | operator when assigning rec->llc
Message-Id: <DM5PR18MB14189BD4043BE8974C9AC001B7C60@DM5PR18MB1418.namprd18.prod.outlook.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200401232736.410028-1-colin.king@canonical.com>
In-Reply-To: <20200401232736.410028-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, "David S . Miller" <davem@davemloft.net>, Mark Starovoytov <mstarovoitov@marvell.com>, Dmitry Bogdanov <dbogdanov@marvell.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>
Cc: "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

VGhhbmtzIENvbGluLA0KDQpXZSBhbHNvIGZvdW5kIHRoaXMgdHlwbyByZWNlbnRseSwgYnV0IHlv
dSB3ZXJlIGFoZWFkIG9mIHVzICkNCg0KPiBGcm9tOiBDb2xpbiBJYW4gS2luZyA8Y29saW4ua2lu
Z0BjYW5vbmljYWwuY29tPg0KPiByZWMtPmxsYyBpcyBjdXJyZW50bHkgYmVpbmcgYXNzaWduZWQg
dHdpY2UsIG9uY2Ugd2l0aCB0aGUgbG93ZXIgOCBiaXRzDQo+IGZyb20gcGFja2VkX3JlY29yZFs4
XSBhbmQgdGhlbiByZS1hc3NpZ25lZCBhZnRlcndhcmRzIHdpdGggZGF0YSBmcm9tIHBhY2tlZF9y
ZWNvcmRbOV0uICBUaGlzIGxvb2tzIGxpa2UgYSB0eXBlLA0KPiAgSSBiZWxpZXZlIHRoZSBzZWNv
bmQgYXNzaWdubWVudCBzaG91bGQgYmUgdXNpbmcgdGhlIHw9IG9wZXJhdG9yIHJhdGhlciB0aGFu
IGEgZGlyZWN0IGFzc2lnbm1lbnQuDQoNCj4gQWRkcmVzc2VzLUNvdmVyaXR5OiAoIlVudXNlZCB2
YWx1ZSIpDQo+IEZpeGVzOiBiOGY4YTBiN2I1Y2IgKCJuZXQ6IGF0bGFudGljOiBNQUNTZWMgaW5n
cmVzcyBvZmZsb2FkIEhXIGJpbmRpbmdzIikNCj4gU2lnbmVkLW9mZi1ieTogQ29saW4gSWFuIEtp
bmcgPGNvbGluLmtpbmdAY2Fub25pY2FsLmNvbT4NCg0KQWNrZWQtYnk6IElnb3IgUnVzc2tpa2gg
PGlydXNza2lraEBtYXJlbGwuY29tPg0K
