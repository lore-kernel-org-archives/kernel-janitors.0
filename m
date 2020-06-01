From: Aisheng Dong <aisheng.dong@nxp.com>
Date: Mon, 01 Jun 2020 10:16:19 +0000
Subject: RE: [PATCH] pinctrl: freescale: imx: Fix an error handling path in 'imx_pinctrl_probe()'
Message-Id: <AM6PR04MB49667D023D9C5ACB7CABF229808A0@AM6PR04MB4966.eurprd04.prod.outlook.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200530204955.588962-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200530204955.588962-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, "festevam@gmail.com" <festevam@gmail.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "stefan@agner.ch" <stefan@agner.ch>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, dl-linux-imx <linux-imx@nxp.com>, Gary Bisson <gary.bisson@boundarydevices.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

PiBGcm9tOiBDaHJpc3RvcGhlIEpBSUxMRVQgPGNocmlzdG9waGUuamFpbGxldEB3YW5hZG9vLmZy
Pg0KPiBTZW50OiBTdW5kYXksIE1heSAzMSwgMjAyMCA0OjUwIEFNDQo+IA0KPiAncGluY3RybF91
bnJlZ2lzdGVyKCknIHNob3VsZCBub3QgYmUgY2FsbGVkIHRvIHVuZG8NCj4gJ2Rldm1fcGluY3Ry
bF9yZWdpc3Rlcl9hbmRfaW5pdCgpJywgaXQgaXMgYWxyZWFkeSBoYW5kbGVkIGJ5IHRoZSBmcmFt
ZXdvcmsuDQo+IA0KPiBUaGlzIHNpbXBsaWZpZXMgdGhlIGVycm9yIGhhbmRsaW5nIHBhdGhzIG9m
IHRoZSBwcm9iZSBmdW5jdGlvbi4NCj4gVGhlICdpbXhfZnJlZV9yZXNvdXJjZXMoKScgY2FuIGJl
IHJlbW92ZWQgYXMgd2VsbC4NCj4gDQo+IEZpeGVzOiBhNTFjMTU4YmYwZjcgKCJwaW5jdHJsOiBp
bXg6IHVzZSByYWRpeCB0cmVlcyBmb3IgZ3JvdXBzIGFuZCBmdW5jdGlvbnMiKQ0KPiBTaWduZWQt
b2ZmLWJ5OiBDaHJpc3RvcGhlIEpBSUxMRVQgPGNocmlzdG9waGUuamFpbGxldEB3YW5hZG9vLmZy
Pg0KDQpSZXZpZXdlZC1ieTogRG9uZyBBaXNoZW5nIDxhaXNoZW5nLmRvbmdAbnhwLmNvbT4NCg0K
UmVnYXJkcw0KQWlzaGVuZw0K
