From: "weiyongjun (A)" <weiyongjun1@huawei.com>
Date: Tue, 28 Apr 2020 03:25:09 +0000
Subject: re: [PATCH net-next] drivers: net: davinci_mdio: fix potential NULL dereference in davinci_mdio_prob
Message-Id: <6AADFAC011213A4C87B956458587ADB419A6B43E@dggeml532-mbs.china.huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190503111859.1023-1-weiyongjun1@huawei.com>
In-Reply-To: <20190503111859.1023-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Lechner <david@lechnology.com>, Grygorii Strashko <grygorii.strashko@ti.com>, Andrew Lunn <andrew@lunn.ch>
Cc: "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

PiANCj4gT24gNC8yNy8yMCA0OjQwIEFNLCBXZWkgWW9uZ2p1biB3cm90ZToNCj4gPiBwbGF0Zm9y
bV9nZXRfcmVzb3VyY2UoKSBtYXkgZmFpbCBhbmQgcmV0dXJuIE5VTEwsIHNvIHdlIHNob3VsZCBi
ZXR0ZXINCj4gPiBjaGVjayBpdCdzIHJldHVybiB2YWx1ZSB0byBhdm9pZCBhIE5VTEwgcG9pbnRl
ciBkZXJlZmVyZW5jZSBhIGJpdA0KPiA+IGxhdGVyIGluIHRoZSBjb2RlLg0KPiA+DQo+ID4gVGhp
cyBpcyBkZXRlY3RlZCBieSBDb2NjaW5lbGxlIHNlbWFudGljIHBhdGNoLg0KPiA+DQo+ID4gQEAN
Cj4gPiBleHByZXNzaW9uIHBkZXYsIHJlcywgbiwgdCwgZSwgZTEsIGUyOyBAQA0KPiA+DQo+ID4g
cmVzID0gXChwbGF0Zm9ybV9nZXRfcmVzb3VyY2VcfHBsYXRmb3JtX2dldF9yZXNvdXJjZV9ieW5h
bWVcKShwZGV2LCB0LCBuKTsNCj4gPiArIGlmICghcmVzKQ0KPiA+ICsgICByZXR1cm4gLUVJTlZB
TDsNCj4gPiAuLi4gd2hlbiAhPSByZXMgPT0gTlVMTA0KPiA+IGUgPSBkZXZtX2lvcmVtYXAoZTEs
IHJlcy0+c3RhcnQsIGUyKTsNCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFdlaSBZb25nanVuIDx3
ZWl5b25nanVuMUBodWF3ZWkuY29tPg0KPiA+IC0tLQ0KPiANCj4gQ291bGQgd2UgdXNlIGRldm1f
cGxhdGZvcm1faW9yZW1hcF9yZXNvdXJjZSgpIGluc3RlYWQ/DQoNCldlIGNhbm5vdCB1c2UgZGV2
bV9wbGF0Zm9ybV9pb3JlbWFwX3Jlc291cmNlKCkgaGVyZSwgc2VlDQpDb21taXQgMDNmNjZmMDY3
NTYwICgibmV0OiBldGhlcm5ldDogdGk6IGRhdmluY2lfbWRpbzogdXNlIGRldm1faW9yZW1hcCgp
IikNCg0KUmVnYXJkcw0K
