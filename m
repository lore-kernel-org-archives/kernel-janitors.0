From: "Saleem, Shiraz" <shiraz.saleem@intel.com>
Date: Wed, 01 Apr 2020 23:40:37 +0000
Subject: RE: [PATCH][next] i40iw: fix null pointer dereference on a null wqe pointer
Message-Id: <9DD61F30A802C4429A01CA4200E302A7C611609E@fmsmsx124.amr.corp.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200401224921.405279-1-colin.king@canonical.com>
In-Reply-To: <20200401224921.405279-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, "Latif, Faisal" <faisal.latif@intel.com>, Doug Ledford <dledford@redhat.com>, Jason Gunthorpe <jgg@ziepe.ca>, "Devale, Sindhu" <sindhu.devale@intel.com>, "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>
Cc: "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

PiBTdWJqZWN0OiBbUEFUQ0hdW25leHRdIGk0MGl3OiBmaXggbnVsbCBwb2ludGVyIGRlcmVmZXJl
bmNlIG9uIGEgbnVsbCB3cWUgcG9pbnRlcg0KPiANCj4gRnJvbTogQ29saW4gSWFuIEtpbmcgPGNv
bGluLmtpbmdAY2Fub25pY2FsLmNvbT4NCj4gDQo+IEN1cnJlbnRseSB0aGUgbnVsbCBjaGVjayBm
b3Igd3FlIGlzIGluY29ycmVjdCBhbmQgbGV0cyBhIG51bGwgd3FlIGJlIHBhc3NlZCB0bw0KPiBz
ZXRfNjRiaXRfdmFsIGFuZCB0aGlzIGluZGV4ZXMgaW50byB0aGUgbnVsbCBwb2ludGVyIGNhdXNp
bmcgYSBudWxsIHBvaW50ZXINCj4gZGVyZWZlcmVuY2UuICBGaXggdGhpcyBieSBmaXhpbmcgdGhl
IG51bGwgcG9pbnRlciBjaGVjayB0byByZXR1cm4gYW4gZXJyb3IgaWYgd3FlIGlzDQo+IG51bGwu
DQo+IA0KPiBBZGRyZXNzZXMtQ292ZXJpdHk6ICgiZGVyZWZlcmVuY2UgYWZ0ZXIgYSBudWxsIGNo
ZWNrIikNCj4gRml4ZXM6IDRiMzRlMjNmNGVhYSAoImk0MGl3OiBSZXBvcnQgY29ycmVjdCBmaXJt
d2FyZSB2ZXJzaW9uIikNCj4gU2lnbmVkLW9mZi1ieTogQ29saW4gSWFuIEtpbmcgPGNvbGluLmtp
bmdAY2Fub25pY2FsLmNvbT4NCg0KVWdoISBZZXMuIFRoYXTigJlzIGEgYmFkIG9uZS4gVGhhbmtz
IGZvciB0aGUgZml4Lg0KDQpBY2tlZC1ieTogU2hpcmF6IFNhbGVlbSA8c2hpcmF6LnNhbGVlbUBp
bnRlbC5jb20+DQo
