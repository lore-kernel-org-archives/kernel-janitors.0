From: Saeed Mahameed <saeedm@mellanox.com>
Date: Thu, 28 May 2020 20:56:06 +0000
Subject: Re: [PATCH net-next] net/mlx5e: Uninitialized variable in mlx5e_attach_decap()
Message-Id: <49b098dad758ba232c1e41a00421daafedc1fda0.camel@mellanox.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200528124803.GC1219412@mwanda>
In-Reply-To: <20200528124803.GC1219412@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "dan.carpenter@oracle.com" <dan.carpenter@oracle.com>
Cc: "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "davem@davemloft.net" <davem@davemloft.net>, Vlad Buslov <vladbu@mellanox.com>, Paul Blakey <paulb@mellanox.com>, Eli Cohen <eli@mellanox.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "kuba@kernel.org" <kuba@kernel.org>, "leon@kernel.org" <leon@kernel.org>, Roi Dayan <roid@mellanox.com>

T24gVGh1LCAyMDIwLTA1LTI4IGF0IDE1OjQ4ICswMzAwLCBEYW4gQ2FycGVudGVyIHdyb3RlOg0K
PiBUaGUgInJldCIgdmFyaWFibGUgaXNuJ3QgaW5pdGlhbGl6ZWQgb24gdGhlIHN1Y2Nlc3MgcGF0
aC4NCj4gDQo+IFRoZXJlIGlzIGFuIHVuaW5pdGVudGlvbmFsIGJlaGF2aW9yIGluIGN1cnJlbnQg
cmVsZWFzZXMgb2YgR0NDIHdoZXJlDQo+IGluc3RlYWQgb2Ygd2FybmluZyBhYm91dCB0aGUgdW5p
bml0aWFsaXplZCB2YXJpYWJsZSwgaXQgaW5zdGVhZA0KPiBpbml0aWFsaXplcyBpdCB0byB6ZXJv
LiAgU28gdGhhdCBtZWFucyB0aGF0IHRoaXMgYnVnIGxpa2VseSBkb2Vzbid0DQo+IGFmZmVjdCB0
ZXN0aW5nLg0KPiANCj4gRml4ZXM6IDE0ZTZiMDM4YWZhMCAoIm5ldC9tbHg1ZTogQWRkIHN1cHBv
cnQgZm9yIGh3IGRlY2Fwc3VsYXRpb24gb2YNCj4gTVBMUyBvdmVyIFVEUCIpDQo+IFNpZ25lZC1v
ZmYtYnk6IERhbiBDYXJwZW50ZXIgPGRhbi5jYXJwZW50ZXJAb3JhY2xlLmNvbT4NCg0KSGkgRGFu
LA0KDQp0aGFua3MgZm9yIHRoZSBmaXgsICBhIHNpbWlsYXIgZml4IHdhcyBhbHJlYWR5IHN1Ym1p
dHRlZCB5ZXN0ZXJkYXkgYW5kDQppIGFscmVhZHkgcHVsbGVkIGl0IGludG8gbXkgdHJlZSwgSSB3
aWxsIHNlbmQgYSBwdWxsIHJlcXVlc3QgdG8gbmV0LQ0KbmV4dCBzb29uLg0KDQpUaGFua3MsDQpT
YWVlZC4NCg0K
