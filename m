From: Aisheng Dong <aisheng.dong@nxp.com>
Date: Sat, 09 May 2020 03:51:19 +0000
Subject: RE: [PATCH -next] interconnect: imx: Fix return value check in imx_icc_node_init_qos()
Message-Id: <AM6PR04MB4966FFE3C487D217A91B070280A30@AM6PR04MB4966.eurprd04.prod.outlook.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200509030214.14435-1-weiyongjun1@huawei.com>
In-Reply-To: <20200509030214.14435-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>, Georgi Djakov <georgi.djakov@linaro.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, dl-linux-imx <linux-imx@nxp.com>, Alexandre Bailon <abailon@baylibre.com>, Leonard Crestez <leonard.crestez@nxp.com>
Cc: Hulk Robot <hulkci@huawei.com>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>

PiBGcm9tOiBXZWkgWW9uZ2p1biA8d2VpeW9uZ2p1bjFAaHVhd2VpLmNvbT4NCj4gU2VudDogU2F0
dXJkYXksIE1heSA5LCAyMDIwIDExOjAyIEFNDQo+IA0KPiBJbiBjYXNlIG9mIGVycm9yLCB0aGUg
ZnVuY3Rpb24gb2ZfcGFyc2VfcGhhbmRsZSgpIHJldHVybnMgTlVMTCBwb2ludGVyIG5vdA0KPiBF
UlJfUFRSKCkuIFRoZSBJU19FUlIoKSB0ZXN0IGluIHRoZSByZXR1cm4gdmFsdWUgY2hlY2sgc2hv
dWxkIGJlIHJlcGxhY2VkIHdpdGgNCj4gTlVMTCB0ZXN0Lg0KPiANCj4gRml4ZXM6IGYwZDgwNDg1
MjVkNyAoImludGVyY29ubmVjdDogQWRkIGlteCBjb3JlIGRyaXZlciIpDQo+IFJlcG9ydGVkLWJ5
OiBIdWxrIFJvYm90IDxodWxrY2lAaHVhd2VpLmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogV2VpIFlv
bmdqdW4gPHdlaXlvbmdqdW4xQGh1YXdlaS5jb20+DQoNClJldmlld2VkLWJ5OiBEb25nIEFpc2hl
bmcgPGFpc2hlbmcuZG9uZ0BueHAuY29tPg0KDQpSZWdhcmRzDQpBaXNoZW5nDQo
