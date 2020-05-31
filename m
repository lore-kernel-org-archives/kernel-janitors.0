From: dinghao.liu@zju.edu.cn
Date: Sun, 31 May 2020 07:19:51 +0000
Subject: Re: Re: [PATCH v2] i2c: imx-lpi2c: Fix runtime PM imbalance on error in lpi2c_imx_master_enable()
Message-Id: <1f6c3bbb.db553.1726999de41.Coremail.dinghao.liu@zju.edu.cn>
List-Id: <kernel-janitors.vger.kernel.org>
References: <845a11a9-51ed-cc7c-350f-b319111f32ee@web.de>
In-Reply-To: <845a11a9-51ed-cc7c-350f-b319111f32ee@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Dong Aisheng <aisheng.dong@nxp.com>, Kangjie Lu <kjlu@umn.edu>, Sascha Hauer <s.hauer@pengutronix.de>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, linux-imx@nxp.com, kernel@pengutronix.de, Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>, linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org

CkhpLCBNYXJrdXMsIAoKPiAqIEhvdyBkbyB5b3UgdGhpbmsgYWJvdXQgdG8gcmVwbGFjZSB0aGUg
d29yZCDigJxwYWlyaW5n4oCdIGJ5IOKAnGNvcnJlc3BvbmRpbmfigJ0/Cj4gCj4gKiBXaWxsIGl0
IGJlIGhlbHBmdWwgdG8gYWRkIGFuIGltcGVyYXRpdmUgd29yZGluZz8KPiAgIGh0dHBzOi8vZ2l0
Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3RvcnZhbGRzL2xpbnV4LmdpdC90
cmVlL0RvY3VtZW50YXRpb24vcHJvY2Vzcy9zdWJtaXR0aW5nLXBhdGNoZXMucnN0P2lkPWZmZWI1
OTVkODQ4MTFkZGUxNmEyOGIzM2Q4YTdjZjI2ZDUxZDUxYjMjbjE1MQo+IAo+ICogV291bGQgeW91
IGxpa2UgdG8gYWRkIHRoZSB0YWcg4oCcRml4ZXPigJ0gdG8gdGhlIGNvbW1pdCBtZXNzYWdlPwo+
IAo+ICogQXJlIHlvdSBnb2luZyB0byB0YWtlIHN1Y2ggcG9zc2liaWxpdGllcyBpbnRvIGFjY291
bnQgZm9yIGFueSBtb3JlIHBhdGNoZXM/Cj4gCgpUaGFuayB5b3UgZm9yIHlvdXIgYWR2aWNlISBJ
IHdpbGwgZml4IHRoZW0gc29vbiBpbiB0aGUgbmV4dCB2ZXJzaW9uIG9mIHBhdGNoLgoKUmVnYXJk
cywKRGluZ2hhbw=
