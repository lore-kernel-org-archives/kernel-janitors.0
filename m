From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Date: Mon, 06 Nov 2017 09:34:21 +0000
Subject: RE: [PATCH] usb: gadget: udc: renesas_usb3: make const array max_packet_array static
Message-Id: <TY1PR06MB09927D0D89543188738EC6DFD8500@TY1PR06MB0992.apcprd06.prod.outlook.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171102155325.24137-1-colin.king@canonical.com>
In-Reply-To: <20171102155325.24137-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Felipe Balbi <balbi@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Geert Uytterhoeven <geert+renesas@glider.be>, KAZUYA MIZUGUCHI <kazuya.mizuguchi.ks@renesas.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Cc: "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

SGkgQ29saW4sDQoNCj4gRnJvbTogQ29saW4gS2luZywgU2VudDogRnJpZGF5LCBOb3ZlbWJlciAz
LCAyMDE3IDEyOjUzIEFNDQo+IA0KPiBGcm9tOiBDb2xpbiBJYW4gS2luZyA8Y29saW4ua2luZ0Bj
YW5vbmljYWwuY29tPg0KPiANCj4gRG9uJ3QgcG9wdWxhdGUgdGhlIGNvbnN0IGFycmF5IG1heF9w
YWNrZXRfYXJyYXkgb24gdGhlIHN0YWNrLCBpbnN0ZWFkIG1ha2UNCj4gaXQgc3RhdGljLiBNYWtl
cyB0aGUgb2JqZWN0IGNvZGUgc21hbGxlciBieSBvdmVyIDkwIGJ5dGVzOg0KPiANCj4gQmVmb3Jl
Og0KPiAgICB0ZXh0CSAgIGRhdGEJICAgIGJzcwkgICAgZGVjCSAgICBoZXgJZmlsZW5hbWUNCj4g
ICAzNDMzNwkgICA1NjEyCSAgICAxMjgJICA0MDA3NwkgICA5YzhkCXJlbmVzYXNfdXNiMy5vDQo+
IA0KPiBBZnRlcjoNCj4gICAgdGV4dAkgICBkYXRhCSAgICBic3MJICAgIGRlYwkgICAgaGV4CWZp
bGVuYW1lDQo+ICAgMzQxNDkJICAgNTcwOAkgICAgMTI4CSAgMzk5ODUJICAgOWMzMQlyZW5lc2Fz
X3VzYjMubw0KPiANCj4gKGdjYyB2ZXJzaW9uIDcuMi4wIHg4Nl82NCkNCj4gDQo+IFNpZ25lZC1v
ZmYtYnk6IENvbGluIElhbiBLaW5nIDxjb2xpbi5raW5nQGNhbm9uaWNhbC5jb20+DQoNClRoYW5r
IHlvdSBmb3IgdGhlIHBhdGNoIQ0KDQpBY2tlZC1ieTogWW9zaGloaXJvIFNoaW1vZGEgPHlvc2hp
aGlyby5zaGltb2RhLnVoQHJlbmVzYXMuY29tPg0KDQpCZXN0IHJlZ2FyZHMsDQpZb3NoaWhpcm8g
U2hpbW9kYQ0KDQo