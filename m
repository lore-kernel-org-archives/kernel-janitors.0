From: Igor Russkikh <irusskikh@marvell.com>
Date: Mon, 28 Oct 2019 09:45:32 +0000
Subject: Re: [EXT] [PATCH][next] net: aquantia: fix unintention integer overflow on left shift
Message-Id: <1fe5fdc0-ea7a-6a4a-6453-4115adf6e2ba@marvell.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191025115811.20433-1-colin.king@canonical.com>
In-Reply-To: <20191025115811.20433-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Egor Pomozov <epomozov@marvell.com>, Igor Russkikh <Igor.Russkikh@aquantia.com>, "David S . Miller" <davem@davemloft.net>, Dmitry Bezrukov <Dmitry.Bezrukov@aquantia.com>, Sergey Samoilenko <Sergey.Samoilenko@aquantia.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>
Cc: "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

DQo+IEZyb206IENvbGluIElhbiBLaW5nIDxjb2xpbi5raW5nQGNhbm9uaWNhbC5jb20+DQo+IA0K
PiBTaGlmdGluZyB0aGUgaW50ZWdlciB2YWx1ZSAxIGlzIGV2YWx1YXRlZCB1c2luZyAzMi1iaXQN
Cj4gYXJpdGhtZXRpYyBhbmQgdGhlbiB1c2VkIGluIGFuIGV4cHJlc3Npb24gdGhhdCBleHBlY3Rz
IGEgNjQtYml0DQo+IHZhbHVlLCBzbyB0aGVyZSBpcyBwb3RlbnRpYWxseSBhbiBpbnRlZ2VyIG92
ZXJmbG93LiBGaXggdGhpcw0KPiBieSB1c2luZyB0aGUgQklUX1VMTCBtYWNybyB0byBwZXJmb3Jt
IHRoZSBzaGlmdCBhbmQgYXZvaWQgdGhlDQo+IG92ZXJmbG93Lg0KPiANCj4gQWRkcmVzc2VzLUNv
dmVyaXR5OiAoIlVuaW50ZW50aW9uYWwgaW50ZWdlciBvdmVyZmxvdyIpDQo+IEZpeGVzOiAwNGEx
ODM5OTUwZDkgKCJuZXQ6IGFxdWFudGlhOiBpbXBsZW1lbnQgZGF0YSBQVFAgZGF0YXBhdGgiKQ0K
PiBTaWduZWQtb2ZmLWJ5OiBDb2xpbiBJYW4gS2luZyA8Y29saW4ua2luZ0BjYW5vbmljYWwuY29t
Pg0KDQpSZXZpZXdlZC1ieTogSWdvciBSdXNza2lraCA8aXJ1c3NraWtoQG1hcnZlbGwuY29tPg0K
DQo
