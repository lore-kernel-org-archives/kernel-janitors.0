From: "weiyongjun (A)" <weiyongjun1@huawei.com>
Date: Thu, 05 Jul 2018 08:48:11 +0000
Subject: RE: [PATCH -next v3] mtd: spinand: fix missing unlock on error
Message-Id: <6AADFAC011213A4C87B956458587ADB401E2726B@dggeml512-mbx.china.huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1530696061-76467-1-git-send-email-weiyongjun1@huawei.com>
 <1530696627-84879-1-git-send-email-weiyongjun1@huawei.com>
 <20180705085936.38f6c374@xps13>
In-Reply-To: <20180705085936.38f6c374@xps13>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Boris Brezillon <boris.brezillon@bootlin.com>, Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Frieder
 Schrempf <frieder.schrempf@exceet.de>, "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

PiANCj4gSGkgV2VpLA0KPiANCj4gV2VpIFlvbmdqdW4gPHdlaXlvbmdqdW4xQGh1YXdlaS5jb20+
IHdyb3RlIG9uIFdlZCwgNCBKdWwgMjAxOA0KPiAwOTozMDoyNw0KPiArMDAwMDoNCj4gDQo+ID4g
QWRkIHRoZSBtaXNzaW5nIHVubG9jayBiZWZvcmUgcmV0dXJuIGZyb20gZnVuY3Rpb24NCj4gPiBz
cGluYW5kX210ZF8ocmVhZHx3cml0ZSkgaW4gdGhlIGVycm9yIGhhbmRsaW5nIGNhc2UuDQo+ID4N
Cj4gPiBGaXhlczogYzg5OGUwNTI2ZmI2ICgibXRkOiBuYW5kOiBBZGQgY29yZSBpbmZyYXN0cnVj
dHVyZSB0byBzdXBwb3J0IFNQSQ0KPiBOQU5EcyIpDQo+ID4gU2lnbmVkLW9mZi1ieTogV2VpIFlv
bmdqdW4gPHdlaXlvbmdqdW4xQGh1YXdlaS5jb20+DQo+ID4gLS0tDQo+IA0KPiBUaGFua3MgZm9y
IHRoZSB0d28gZml4ZXMgb3ZlciB0aGUgc3BpbmFuZCB3b3JrLiBBcyB0aGlzIGNvZGUgaXMgbm90
DQo+IHlldCB1cHN0cmVhbSwgZG8geW91IG1pbmQgaWYgSSBmb2xkIHRob3NlIGZpeGVzIGRpcmVj
dGx5IHdpdGggdGhlDQo+IGluaXRpYWwgcGF0Y2g/DQoNCk5vLCBJIGRvbid0LiBGZWVsIGZyZWUg
dG8gZm9sZCB0aGVtIHRvIHRoZSBpbml0aWFsIHBhdGNoLg0KDQpSZWdhcmRzLA0KV2VpIHlvbmdq
dW4NCg=
