From: Zack Rusin <zackr@vmware.com>
Date: Mon, 25 Jan 2021 19:13:43 +0000
Subject: Re: [PATCH] drm/vmwgfx/vmwgfx_drv: Fix an error path in vmw_setup_pci_resources()
Message-Id: <4D85574F-E711-46F8-A517-900F6D18954D@vmware.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <YA6FMboLhnE3uSvb@mwanda>
In-Reply-To: <YA6FMboLhnE3uSvb@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: David Airlie <airlied@linux.ie>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, Roland Scheidegger <sroland@vmware.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Martin Krastev <krastevm@vmware.com>, Linux-graphics-maintainer <Linux-graphics-maintainer@vmware.com>

DQoNCj4gT24gSmFuIDI1LCAyMDIxLCBhdCAwMzo0NSwgRGFuIENhcnBlbnRlciA8ZGFuLmNhcnBl
bnRlckBvcmFjbGUuY29tPiB3cm90ZToNCj4gDQo+IFRoZSBkZXZtX21lbXJlbWFwKCkgZnVuY3Rp
b24gbmV2ZXIgcmV0dXJucyBOVUxMLCBpdCByZXR1cm5zIGVycm9yDQo+IHBvaW50ZXJzIHNvIHRo
ZSB0ZXN0IG5lZWRzIHRvIGJlIGZpeGVkLiAgQWxzbyB3ZSBuZWVkIHRvIGNhbGwNCj4gcGNpX3Jl
bGVhc2VfcmVnaW9ucygpIHRvIGF2b2lkIGEgbWVtb3J5IGxlYWsuDQo+IA0KPiBGaXhlczogYmU0
Zjc3YWM2ODg0ICgiZHJtL3Ztd2dmeDogQ2xlYW51cCBmaWZvIG1taW8gaGFuZGxpbmciKQ0KPiBT
aWduZWQtb2ZmLWJ5OiBEYW4gQ2FycGVudGVyIDxkYW4uY2FycGVudGVyQG9yYWNsZS5jb20+DQoN
ClRoYW5rcywgRGFuLg0KDQpJIGhhdmUgYSBwYXRjaCBiYXNlZCBvbiB5b3VyIHJlcG9ydCB0aGF0
IGZpeGVzIHRoYXQgdG9vIGJ1dCBpdCBjb21lcyB3aXRoIGEgcmVmYWN0b3JpbmcuIEnigJlkIGJl
IGhhcHB5IHRvIHJlYmFzZSBpdCBvbiB0b3Agb2YgeW91cnMganVzdCB0byBnZXQgeW91cnMgaW4g
YmVmb3JlLiBJZiB5b3XigJlkIGxpa2UgSSBjYW4gcHVzaCB5b3VyIHBhdGNoIHRocm91Z2ggZHJt
LW1pc2MtbmV4dCwgaWYgbm90Og0KDQpSZXZpZXdlZC1ieTogWmFjayBSdXNpbiA8emFja3JAdm13
YXJlLmNvbT4NCg0Keg0KDQoNCg=
