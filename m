From: Aisheng Dong <aisheng.dong@nxp.com>
Date: Wed, 06 May 2020 11:02:57 +0000
Subject: RE: [PATCH -next] firmware: imx: scu: Fix possible memory leak in imx_scu_probe()
Message-Id: <AM6PR04MB4966951644D380842EA80D9180A40@AM6PR04MB4966.eurprd04.prod.outlook.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200506051410.27219-1-weiyongjun1@huawei.com>
In-Reply-To: <20200506051410.27219-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, dl-linux-imx <linux-imx@nxp.com>
Cc: "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

PiBGcm9tOiBXZWkgWW9uZ2p1biA8d2VpeW9uZ2p1bjFAaHVhd2VpLmNvbT4NCj4gU2VudDogV2Vk
bmVzZGF5LCBNYXkgNiwgMjAyMCAxOjE0IFBNDQo+IA0KPiAnY2hhbl9uYW1lJyBpcyBtYWxsb2Nl
ZCBpbiBpbXhfc2N1X3Byb2JlKCkgYW5kIHNob3VsZCBiZSBmcmVlZCBiZWZvcmUgbGVhdmluZw0K
PiBmcm9tIHRoZSBlcnJvciBoYW5kbGluZyBjYXNlcywgb3RoZXJ3aXNlIGl0IHdpbGwgY2F1c2Ug
bWVtb3J5IGxlYWsuDQo+IA0KPiBGaXhlczogZWRiZWUwOTVmYWZiICgiZmlybXdhcmU6IGlteDog
YWRkIFNDVSBmaXJtd2FyZSBkcml2ZXIgc3VwcG9ydCIpDQo+IFNpZ25lZC1vZmYtYnk6IFdlaSBZ
b25nanVuIDx3ZWl5b25nanVuMUBodWF3ZWkuY29tPg0KDQpUaGFua3MgZm9yIHRoZSBmaXguDQpS
ZXZpZXdlZC1ieTogRG9uZyBBaXNoZW5nIDxhaXNoZW5nLmRvbmdAbnhwLmNvbT4NCg0KUmVnYXJk
cw0KQWlzaGVuZw0K
