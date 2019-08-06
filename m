From: Saeed Mahameed <saeedm@mellanox.com>
Date: Tue, 06 Aug 2019 21:01:48 +0000
Subject: Re: [PATCH][net-next][V2] net/mlx5: remove self-assignment on esw->dev
Message-Id: <c6ae2c6a0d0b15e49737169db50a0a78f2e37caf.camel@mellanox.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190802151316.16011-1-colin.king@canonical.com>
In-Reply-To: <20190802151316.16011-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>, "colin.king@canonical.com" <colin.king@canonical.com>, "davem@davemloft.net" <davem@davemloft.net>, "leon@kernel.org" <leon@kernel.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>
Cc: "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

T24gRnJpLCAyMDE5LTA4LTAyIGF0IDE2OjEzICswMTAwLCBDb2xpbiBLaW5nIHdyb3RlOg0KPiBG
cm9tOiBDb2xpbiBJYW4gS2luZyA8Y29saW4ua2luZ0BjYW5vbmljYWwuY29tPg0KPiANCj4gVGhl
cmUgaXMgYSBzZWxmIGFzc2lnbm1lbnQgb2YgZXN3LT5kZXYgdG8gaXRzZWxmLCBjbGVhbiB0aGlz
IHVwIGJ5DQo+IHJlbW92aW5nIGl0LiBBbHNvIG1ha2UgZGV2IGEgY29uc3QgcG9pbnRlci4NCj4g
DQo+IEFkZHJlc3Nlcy1Db3Zlcml0eTogKCJTZWxmIGFzc2lnbm1lbnQiKQ0KPiBGaXhlczogNmNl
ZGRlNDUxMzk5ICgibmV0L21seDU6IEUtU3dpdGNoLCBWZXJpZnkgc3VwcG9ydCBRb1MgZWxlbWVu
dA0KPiB0eXBlIikNCj4gU2lnbmVkLW9mZi1ieTogQ29saW4gSWFuIEtpbmcgPGNvbGluLmtpbmdA
Y2Fub25pY2FsLmNvbT4NCj4gLS0tDQo+IA0KPiBWMjogbWFrZSBkZXYgY29uc3QNCj4gDQoNCkFw
cGxpZWQgdG8gbWx4NS1uZXh0Lg0KDQpUaGFua3MsDQpTYWVlZC4NCg=
