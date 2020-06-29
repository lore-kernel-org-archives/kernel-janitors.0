From: Chunfeng Yun <chunfeng.yun@mediatek.com>
Date: Mon, 29 Jun 2020 01:48:13 +0000
Subject: Re: usb: mtu3: Checking initialisation of the variable =?UTF-8?Q?=E2=80=9Cmep=E2=80=9D?= in two func
Message-Id: <1593395293.3798.3.camel@mhfsdcap03>
List-Id: <kernel-janitors.vger.kernel.org>
References: <8efdb7aa-1188-e94a-3075-ab1dd30768bb@web.de>
In-Reply-To: <8efdb7aa-1188-e94a-3075-ab1dd30768bb@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, Colin Ian King <colin.king@canonical.com>, linux-arm-kernel@lists.infradead.org

SGksDQpPbiBTYXQsIDIwMjAtMDYtMjcgYXQgMTQ6MjggKzAyMDAsIE1hcmt1cyBFbGZyaW5nIHdy
b3RlOg0KPiBIZWxsbywNCj4gDQo+IEEgc291cmNlIGNvZGUgYW5hbHlzaXMgYXBwcm9hY2ggYnkg
dGhlIG1lYW5zIG9mIHRoZSBzZW1hbnRpYyBwYXRjaCBsYW5ndWFnZQ0KPiAoQ29jY2luZWxsZSBz
b2Z0d2FyZSkgcG9pbnRlZCBhbiBpbXBsZW1lbnRhdGlvbiBkZXRhaWwgb3V0IGZvciBmdXJ0aGVy
DQo+IGRldmVsb3BtZW50IGNvbnNpZGVyYXRpb25zLg0KPiANCj4gVGhlIGZ1bmN0aW9ucyDigJxt
dHUzX2dhZGdldF9lcF9zZXRfaGFsdOKAnSBhbmQg4oCcbXR1M19nYWRnZXRfZXBfc2V0X3dlZGdl
4oCdIGNoZWNrDQo+IGF0IHRoZSBiZWdpbm5pbmcgaWYgdGhlIGlucHV0IHBhcmFtZXRlciDigJxl
cOKAnSBpcyBhIG51bGwgcG9pbnRlci4NCj4gVGhlIGVycm9yIGNvZGUg4oCcLUVJTlZBTOKAnSB3
aWxsIGJlIHJldHVybmVkIHRoZW4uDQo+IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9s
aW51eC9rZXJuZWwvZ2l0L3RvcnZhbGRzL2xpbnV4LmdpdC90cmVlL2RyaXZlcnMvdXNiL210dTMv
bXR1M19nYWRnZXQuYz9pZD0xNTkwYTJlMWM2ODFiMDk5MWJkNDJjOTkyY2FiZmQzODBlMDMzOGYy
I24zNzENCj4gaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvdjUuNy4yL3NvdXJjZS9k
cml2ZXJzL3VzYi9tdHUzL210dTNfZ2FkZ2V0LmMjTDM3MQ0KPiANCj4gQ2FuIGl0IGJlIG5pY2Vy
IHRvIGFzc2lnbiB0aGUgdmFyaWFibGUg4oCcbWVw4oCdIG9ubHkgYWZ0ZXIgYSBzdWNjZXNzZnVs
IGNoZWNrDQo+IGluc3RlYWQgb2YgYW4gaW5pdGlhbGlzYXRpb24gYmVmb3JlPw0KWWVzLCBJJ2xs
IGZpeCBpdCwgdGhhbmtzIGEgbG90DQoNCj4gDQo+IFJlZ2FyZHMsDQo+IE1hcmt1cw0KDQo
