From: Avri Altman <Avri.Altman@wdc.com>
Date: Wed, 11 Sep 2019 12:55:09 +0000
Subject: RE: [PATCH] scsi: ufs-hisi: Use PTR_ERR_OR_ZERO() in ufs_hisi_get_resource()
Message-Id: <MN2PR04MB6991E9732236A682DB8E9A2DFCB10@MN2PR04MB6991.namprd04.prod.outlook.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <9e667f19-434e-ed30-78cb-9ddc6323c51e@web.de>
In-Reply-To: <9e667f19-434e-ed30-78cb-9ddc6323c51e@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Markus Elfring <Markus.Elfring@web.de>, "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, Allison Randal <allison@lohutok.net>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "James E. J. Bottomley" <jejb@linux.ibm.com>, Kangjie Lu <kjlu@umn.edu>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, "Martin K. Petersen" <martin.petersen@oracle.com>, Pedro Sousa <pedrom.sousa@synopsys.com>, Stanley Chu <stanley.chu@mediatek.com>, Thomas Gleixner <tglx@linutronix.de>, Wei Li <liwei213@huawei.com>
Cc: LKML <linux-kernel@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

PiANCj4gRnJvbTogTWFya3VzIEVsZnJpbmcgPGVsZnJpbmdAdXNlcnMuc291cmNlZm9yZ2UubmV0
Pg0KPiBEYXRlOiBTYXQsIDcgU2VwIDIwMTkgMTQ6MjU6MzEgKzAyMDANCj4gDQo+IFNpbXBsaWZ5
IHRoaXMgZnVuY3Rpb24gaW1wbGVtZW50YXRpb24gYnkgdXNpbmcgYSBrbm93biBmdW5jdGlvbi4N
Cj4gDQo+IEdlbmVyYXRlZCBieTogc2NyaXB0cy9jb2NjaW5lbGxlL2FwaS9wdHJfcmV0LmNvY2Np
DQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBNYXJrdXMgRWxmcmluZyA8ZWxmcmluZ0B1c2Vycy5zb3Vy
Y2Vmb3JnZS5uZXQ+DQpSZXZpZXdlZC1ieTogQXZyaSBBbHRtYW4gPGF2cmkuYWx0bWFuQHdkYy5j
b20+DQoNCj4gLS0tDQo+ICBkcml2ZXJzL3Njc2kvdWZzL3Vmcy1oaXNpLmMgfCA1ICstLS0tDQo+
ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDQgZGVsZXRpb25zKC0pDQo+IA0KPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9zY3NpL3Vmcy91ZnMtaGlzaS5jIGIvZHJpdmVycy9zY3NpL3Vm
cy91ZnMtaGlzaS5jIGluZGV4DQo+IGY0ZDFkY2E5NjJjNC4uYTBlYTU3YzE5ZGJjIDEwMDY0NA0K
PiAtLS0gYS9kcml2ZXJzL3Njc2kvdWZzL3Vmcy1oaXNpLmMNCj4gKysrIGIvZHJpdmVycy9zY3Np
L3Vmcy91ZnMtaGlzaS5jDQo+IEBAIC00NTQsMTAgKzQ1NCw3IEBAIHN0YXRpYyBpbnQgdWZzX2hp
c2lfZ2V0X3Jlc291cmNlKHN0cnVjdCB1ZnNfaGlzaV9ob3N0DQo+ICpob3N0KQ0KPiAgICAgICAg
IC8qIGdldCByZXNvdXJjZSBvZiB1ZnMgc3lzIGN0cmwgKi8NCj4gICAgICAgICBtZW1fcmVzID0g
cGxhdGZvcm1fZ2V0X3Jlc291cmNlKHBkZXYsIElPUkVTT1VSQ0VfTUVNLCAxKTsNCj4gICAgICAg
ICBob3N0LT51ZnNfc3lzX2N0cmwgPSBkZXZtX2lvcmVtYXBfcmVzb3VyY2UoZGV2LCBtZW1fcmVz
KTsNCj4gLSAgICAgICBpZiAoSVNfRVJSKGhvc3QtPnVmc19zeXNfY3RybCkpDQo+IC0gICAgICAg
ICAgICAgICByZXR1cm4gUFRSX0VSUihob3N0LT51ZnNfc3lzX2N0cmwpOw0KPiAtDQo+IC0gICAg
ICAgcmV0dXJuIDA7DQo+ICsgICAgICAgcmV0dXJuIFBUUl9FUlJfT1JfWkVSTyhob3N0LT51ZnNf
c3lzX2N0cmwpOw0KPiAgfQ0KPiANCj4gIHN0YXRpYyB2b2lkIHVmc19oaXNpX3NldF9wbV9sdmwo
c3RydWN0IHVmc19oYmEgKmhiYSkNCj4gLS0NCj4gMi4yMy4wDQoNCg=
