From: Aisheng Dong <aisheng.dong@nxp.com>
Date: Tue, 18 Dec 2018 14:16:43 +0000
Subject: RE: [PATCH -next] clk: imx: fix potential NULL dereference in imx8qxp_lpcg_clk_probe()
Message-Id: <AM0PR04MB42111E537F8377C4DDAD56A880BD0@AM0PR04MB4211.eurprd04.prod.outlook.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1545115389-173136-1-git-send-email-weiyongjun1@huawei.com>
 <CAOMZO5C1+bxWtapaBrdzf0o3Q30BkBNHLg9=4K5ZsxBk6s2DWw@mail.gmail.com>
In-Reply-To: <CAOMZO5C1+bxWtapaBrdzf0o3Q30BkBNHLg9=4K5ZsxBk6s2DWw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Fabio Estevam <festevam@gmail.com>, Wei Yongjun <weiyongjun1@huawei.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, "moderated list:ARM/FREESCALE IMX /
 MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBGYWJpbyBFc3RldmFtIFttYWls
dG86ZmVzdGV2YW1AZ21haWwuY29tXQ0KPiBIaSBXZWksDQo+IA0KPiBPbiBUdWUsIERlYyAxOCwg
MjAxOCBhdCA0OjM2IEFNIFdlaSBZb25nanVuIDx3ZWl5b25nanVuMUBodWF3ZWkuY29tPg0KPiB3
cm90ZToNCj4gDQo+ID4gICAgICAgICByZXMgPSBwbGF0Zm9ybV9nZXRfcmVzb3VyY2UocGRldiwg
SU9SRVNPVVJDRV9NRU0sIDApOw0KPiA+ICsgICAgICAgaWYgKCFyZXMpDQo+ID4gKyAgICAgICAg
ICAgICAgIHJldHVybiAtRUlOVkFMOw0KPiA+ICAgICAgICAgYmFzZSA9IGRldm1faW9yZW1hcChk
ZXYsIHJlcy0+c3RhcnQsIHJlc291cmNlX3NpemUocmVzKSk7DQo+IA0KPiBXb3VsZG4ndCBpdCBi
ZSBiZXR0ZXIgdG8gdXNlIGRldm1faW9yZW1hcF9yZXNvdXJjZSgpLCB3aGljaCBkb2VzIHRoZSBO
VUxMDQo+IGNoZWNrPw0KDQpObywgZGV2bV9pb3JlbWFwX3Jlc291cmNlIHdpbGwgY2FsbCByZXF1
ZXN0X21lbV9yZWdpb24gd2hpY2ggd2UgZG9uJ3Qgd2FudA0KYXMgTFBDRyBtZW1vcnkgc3BhY2Ug
bWF5IG92ZXJsYXAgd2l0aCBvdGhlciBtb2R1bGVzIHdpdGhpbiB0aGUgc2FtZSBTUy4NCg0KVGhp
cyBpcyBzb21ldGhpbmcgbGlrZSB0aGUgc3lzY29uIGRldmljZSBkb2VzOg0KZHJpdmVycy9tZmQv
c3lzY29uLmMuDQoNClJlZ2FyZHMNCkRvbmcgQWlzaGVuZw0K
