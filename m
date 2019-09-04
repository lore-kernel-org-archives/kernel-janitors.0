From: Saeed Mahameed <saeedm@mellanox.com>
Date: Wed, 04 Sep 2019 23:30:48 +0000
Subject: Re: [PATCH][next] net/mlx5: fix missing assignment of variable err
Message-Id: <16073125f6bbc617a9ddc77441b9d3b840d50e28.camel@mellanox.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190904192914.19684-1-colin.king@canonical.com>
In-Reply-To: <20190904192914.19684-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>, Maor Gottlieb <maorg@mellanox.com>, "colin.king@canonical.com" <colin.king@canonical.com>, "davem@davemloft.net" <davem@davemloft.net>, "leon@kernel.org" <leon@kernel.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>
Cc: "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

T24gV2VkLCAyMDE5LTA5LTA0IGF0IDIwOjI5ICswMTAwLCBDb2xpbiBLaW5nIHdyb3RlOg0KPiBG
cm9tOiBDb2xpbiBJYW4gS2luZyA8Y29saW4ua2luZ0BjYW5vbmljYWwuY29tPg0KPiANCj4gVGhl
IGVycm9yIHJldHVybiBmcm9tIGEgY2FsbCB0byBtbHg1X2Zsb3dfbmFtZXNwYWNlX3NldF9wZWVy
IGlzIG5vdA0KPiBiZWluZyBhc3NpZ25lZCB0byB2YXJpYWJsZSBlcnIgYW5kIGhlbmNlIHRoZSBl
cnJvciBjaGVjayBmb2xsb3dpbmcNCj4gdGhlIGNhbGwgaXMgY3VycmVudGx5IG5vdCB3b3JraW5n
LiAgRml4IHRoaXMgYnkgYXNzaWduaW5nIHJldCBhcw0KPiBpbnRlbmRlZC4NCj4gDQo+IEFkZHJl
c3Nlcy1Db3Zlcml0eTogKCJMb2dpY2FsbHkgZGVhZCBjb2RlIikNCj4gRml4ZXM6IDg0NjNkYWYx
N2U4MCAoIm5ldC9tbHg1OiBBZGQgc3VwcG9ydCB0byB1c2UgU01GUyBpbiBzd2l0Y2hkZXYNCj4g
bW9kZSIpDQo+IFNpZ25lZC1vZmYtYnk6IENvbGluIElhbiBLaW5nIDxjb2xpbi5raW5nQGNhbm9u
aWNhbC5jb20+DQo+IC0tLQ0KDQpBcHBsaWVkIHRvIG5ldC1uZXh0LW1seDUuDQoNCkkgaGF2ZSBh
IGNsZWFudXAgc2VyaWVzIGNvbWluZyB1cCwgd2lsbCBzZW5kIGl0IGFsbCB0b2dldGhlciB0byAN
Cm5ldC1uZXh0IHNvb24uIA0KDQpUaGFua3MsDQpTYWVlZC4NCg=
