From: Boris Pismenny <borisp@mellanox.com>
Date: Mon, 27 Jan 2020 08:08:48 +0000
Subject: Re: [PATCH] net/mlx5: Remove a useless 'drain_workqueue()' call in 'mlx5e_ipsec_cleanup()'
Message-Id: <f9b066c7-e59a-9106-da57-a7c0ffc36d9b@mellanox.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200126175104.17948-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200126175104.17948-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Saeed Mahameed <saeedm@mellanox.com>, "leon@kernel.org" <leon@kernel.org>, "davem@davemloft.net" <davem@davemloft.net>
Cc: "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

DQpPbiAxLzI2LzIwMjAgNzo1MSBQTSwgQ2hyaXN0b3BoZSBKQUlMTEVUIHdyb3RlOg0KPiAnZGVz
dHJveV93b3JrcXVldWUoKScgYWxyZWFkeSBjYWxscyAnZHJhaW5fd29ya3F1ZXVlKCknLCB0aGVy
ZSBpcyBubyBuZWVkDQo+IHRvIGNhbGwgaXQgZXhwbGljaXRseS4NCj4NCj4gU2lnbmVkLW9mZi1i
eTogQ2hyaXN0b3BoZSBKQUlMTEVUIDxjaHJpc3RvcGhlLmphaWxsZXRAd2FuYWRvby5mcj4NCj4g
LS0tDQo+ICBkcml2ZXJzL25ldC9ldGhlcm5ldC9tZWxsYW5veC9tbHg1L2NvcmUvZW5fYWNjZWwv
aXBzZWMuYyB8IDEgLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgZGVsZXRpb24oLSkNCj4NCj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvbmV0L2V0aGVybmV0L21lbGxhbm94L21seDUvY29yZS9lbl9hY2Nl
bC9pcHNlYy5jIGIvZHJpdmVycy9uZXQvZXRoZXJuZXQvbWVsbGFub3gvbWx4NS9jb3JlL2VuX2Fj
Y2VsL2lwc2VjLmMNCj4gaW5kZXggY2Y1OGM5NjM3OTA0Li4yOTYyNmM2YzljMjUgMTAwNjQ0DQo+
IC0tLSBhL2RyaXZlcnMvbmV0L2V0aGVybmV0L21lbGxhbm94L21seDUvY29yZS9lbl9hY2NlbC9p
cHNlYy5jDQo+ICsrKyBiL2RyaXZlcnMvbmV0L2V0aGVybmV0L21lbGxhbm94L21seDUvY29yZS9l
bl9hY2NlbC9pcHNlYy5jDQo+IEBAIC00MzMsNyArNDMzLDYgQEAgdm9pZCBtbHg1ZV9pcHNlY19j
bGVhbnVwKHN0cnVjdCBtbHg1ZV9wcml2ICpwcml2KQ0KPiAgCWlmICghaXBzZWMpDQo+ICAJCXJl
dHVybjsNCj4gIA0KPiAtCWRyYWluX3dvcmtxdWV1ZShpcHNlYy0+d3EpOw0KPiAgCWRlc3Ryb3lf
d29ya3F1ZXVlKGlwc2VjLT53cSk7DQo+ICANCj4gIAlpZGFfZGVzdHJveSgmaXBzZWMtPmhhbGxv
Yyk7DQpMR1RNDQo
