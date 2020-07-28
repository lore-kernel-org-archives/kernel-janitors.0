From: Saeed Mahameed <saeedm@mellanox.com>
Date: Tue, 28 Jul 2020 07:53:08 +0000
Subject: Re: [PATCH 4/7] net/mlx5: drop unnecessary list_empty
Message-Id: <86e8f054d029991167a9fe0a4bdfedff94e38022.camel@mellanox.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1595761112-11003-1-git-send-email-Julia.Lawall@inria.fr>
         <1595761112-11003-5-git-send-email-Julia.Lawall@inria.fr>
         <20200727.101059.1257161436665415755.davem@davemloft.net>
In-Reply-To: <20200727.101059.1257161436665415755.davem@davemloft.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "davem@davemloft.net" <davem@davemloft.net>, "Julia.Lawall@inria.fr" <Julia.Lawall@inria.fr>
Cc: "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "kuba@kernel.org" <kuba@kernel.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "leon@kernel.org" <leon@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

T24gTW9uLCAyMDIwLTA3LTI3IGF0IDEwOjEwIC0wNzAwLCBEYXZpZCBNaWxsZXIgd3JvdGU6DQo+
IEZyb206IEp1bGlhIExhd2FsbCA8SnVsaWEuTGF3YWxsQGlucmlhLmZyPg0KPiBEYXRlOiBTdW4s
IDI2IEp1bCAyMDIwIDEyOjU4OjI5ICswMjAwDQo+IA0KPiA+IGxpc3RfZm9yX2VhY2hfZW50cnkg
aXMgYWJsZSB0byBoYW5kbGUgYW4gZW1wdHkgbGlzdC4NCj4gPiBUaGUgb25seSBlZmZlY3Qgb2Yg
YXZvaWRpbmcgdGhlIGxvb3AgaXMgbm90IGluaXRpYWxpemluZyB0aGUNCj4gPiBpbmRleCB2YXJp
YWJsZS4NCj4gPiBEcm9wIGxpc3RfZW1wdHkgdGVzdHMgaW4gY2FzZXMgd2hlcmUgdGhlc2UgdmFy
aWFibGVzIGFyZSBub3QNCj4gPiB1c2VkLg0KPiA+IA0KPiA+IE5vdGUgdGhhdCBsaXN0X2Zvcl9l
YWNoX2VudHJ5IGlzIGRlZmluZWQgaW4gdGVybXMgb2YNCj4gbGlzdF9maXJzdF9lbnRyeSwNCj4g
PiB3aGljaCBpbmRpY2F0ZXMgdGhhdCBpdCBzaG91bGQgbm90IGJlIHVzZWQgb24gYW4gZW1wdHkg
bGlzdC4gIEJ1dA0KPiBpbg0KPiA+IGxpc3RfZm9yX2VhY2hfZW50cnksIHRoZSBlbGVtZW50IG9i
dGFpbmVkIGJ5IGxpc3RfZmlyc3RfZW50cnkgaXMNCj4gbm90DQo+ID4gcmVhbGx5IGFjY2Vzc2Vk
LCBvbmx5IHRoZSBhZGRyZXNzIG9mIGl0cyBsaXN0X2hlYWQgZmllbGQgaXMNCj4gY29tcGFyZWQN
Cj4gPiB0byB0aGUgYWRkcmVzcyBvZiB0aGUgbGlzdCBoZWFkLCBzbyB0aGUgbGlzdF9maXJzdF9l
bnRyeSBpcyBzYWZlLg0KPiA+IA0KPiA+IFRoZSBzZW1hbnRpYyBwYXRjaCB0aGF0IG1ha2VzIHRo
aXMgY2hhbmdlIGlzIGFzIGZvbGxvd3MgKHdpdGgNCj4gYW5vdGhlcg0KPiA+IHZhcmlhbnQgZm9y
IHRoZSBubyBicmFjZSBjYXNlKTogKGh0dHA6Ly9jb2NjaW5lbGxlLmxpcDYuZnIvKQ0KPiAgLi4u
DQo+ID4gU2lnbmVkLW9mZi1ieTogSnVsaWEgTGF3YWxsIDxKdWxpYS5MYXdhbGxAaW5yaWEuZnI+
DQo+IA0KPiBTYWVlZCwgcGxlYXNlIHBpY2sgdGhpcyB1cC4NCj4gDQo+IFRoYW5rIHlvdS4NCg0K
QXBwbGllZCB0byBuZXQtbmV4dC1tbHg1Lg0KDQpUaGFua3MgIQ0K
