From: Igor Russkikh <Igor.Russkikh@aquantia.com>
Date: Wed, 25 Sep 2019 11:57:59 +0000
Subject: Re: [PATCH net] net: aquantia: Fix aq_vec_isr_legacy() return value
Message-Id: <f5be37aa-4744-3976-f899-fafb4b822e3a@aquantia.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190925105430.GA3264@mwanda>
In-Reply-To: <20190925105430.GA3264@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, David VomLehn <vomlehn@texas.net>
Cc: "David S. Miller" <davem@davemloft.net>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

DQoNCk9uIDI1LjA5LjIwMTkgMTM6NTQsIERhbiBDYXJwZW50ZXIgd3JvdGU6DQo+IFRoZSBpcnFy
ZXR1cm5fdCB0eXBlIGlzIGFuIGVudW0gb3IgYW4gdW5zaWduZWQgaW50IGluIEdDQy4gIFRoYXQN
Cj4gY3JlYXRlcyB0byBwcm9ibGVtcyBiZWNhdXNlIGl0IGNhbid0IGRldGVjdCBpZiB0aGUNCj4g
c2VsZi0+YXFfaHdfb3BzLT5od19pcnFfcmVhZCgpIGNhbGwgZmFpbHMgYW5kIGF0IHRoZSBlbmQg
dGhlIGZ1bmN0aW9uDQo+IGFsd2F5cyByZXR1cm5zIElSUV9IQU5ETEVELg0KDQpUaGFua3MgZm9y
IG5vdGljaW5nIHRoaXMsIERhbiENCg0KPiBkcml2ZXJzL25ldC9ldGhlcm5ldC9hcXVhbnRpYS9h
dGxhbnRpYy9hcV92ZWMuYzozMTYgYXFfdmVjX2lzcl9sZWdhY3koKSB3YXJuOiB1bnNpZ25lZCAn
ZXJyJyBpcyBuZXZlciBsZXNzIHRoYW4gemVyby4NCj4gZHJpdmVycy9uZXQvZXRoZXJuZXQvYXF1
YW50aWEvYXRsYW50aWMvYXFfdmVjLmM6MzI5IGFxX3ZlY19pc3JfbGVnYWN5KCkgd2FybjogYWx3
YXlzIHRydWUgY29uZGl0aW9uICcoZXJyID49IDApID0+ICgwLXUzMm1heCA+PSAwKScNCj4gDQo+
IEZpeGVzOiA5NzBhMmU5ODY0YjAgKCJuZXQ6IGV0aGVybmV0OiBhcXVhbnRpYTogVmVjdG9yIG9w
ZXJhdGlvbnMiKQ0KPiBTaWduZWQtb2ZmLWJ5OiBEYW4gQ2FycGVudGVyIDxkYW4uY2FycGVudGVy
QG9yYWNsZS5jb20+DQoNClJldmlld2VkLWJ5OiBJZ29yIFJ1c3NraWtoIDxpZ29yLnJ1c3NraWto
QGFxdWFudGlhLmNvbT4NCg0KDQpSZWdhcmRzLA0KICBJZ29yDQo
