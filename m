From: "Ardelean, Alexandru" <alexandru.Ardelean@analog.com>
Date: Thu, 26 Sep 2019 11:06:39 +0000
Subject: Re: [PATCH] iio: imu: adis16480: clean up a condition
Message-Id: <9e40c550310d6f30e6481329e01061beb474bc33.camel@analog.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190926081016.GA2332@mwanda>
In-Reply-To: <20190926081016.GA2332@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "dan.carpenter@oracle.com" <dan.carpenter@oracle.com>, "lars@metafoo.de" <lars@metafoo.de>
Cc: "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "Popa, Stefan Serban" <StefanSerban.Popa@analog.com>, "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>, "jic23@kernel.org" <jic23@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Hennerich, Michael" <Michael.Hennerich@analog.com>, "pmeerw@pmeerw.net" <pmeerw@pmeerw.net>, "knaack.h@gmx.de" <knaack.h@gmx.de>

T24gVGh1LCAyMDE5LTA5LTI2IGF0IDExOjEwICswMzAwLCBEYW4gQ2FycGVudGVyIHdyb3RlOg0K
PiBbRXh0ZXJuYWxdDQo+IA0KPiBUaGUgInQiIHZhcmlhYmxlIGlzIHVuc2lnbmVkIHNvIGl0IGNh
bid0IGJlIGxlc3MgdGhhbiB6ZXJvLiAgV2UgcmVhbGx5DQo+IGFyZSBqdXN0IHRyeWluZyB0byBw
cmV2ZW50IGRpdmlkZSBieSB6ZXJvIGJ1Z3Mgc28ganVzdCBjaGVja2luZyBhZ2FpbnN0DQo+IHpl
cm8gaXMgc3VmZmljaWVudC4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IERhbiBDYXJwZW50ZXIgPGRh
bi5jYXJwZW50ZXJAb3JhY2xlLmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJzL2lpby9pbXUvYWRpczE2
NDgwLmMgfCAyICstDQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRp
b24oLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2lpby9pbXUvYWRpczE2NDgwLmMgYi9k
cml2ZXJzL2lpby9pbXUvYWRpczE2NDgwLmMNCj4gaW5kZXggYjk5ZDczODg3YzlmLi5lMTQ0ZTU2
NzY3NWQgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvaWlvL2ltdS9hZGlzMTY0ODAuYw0KPiArKysg
Yi9kcml2ZXJzL2lpby9pbXUvYWRpczE2NDgwLmMNCj4gQEAgLTMxOCw3ICszMTgsNyBAQCBzdGF0
aWMgaW50IGFkaXMxNjQ4MF9zZXRfZnJlcShzdHJ1Y3QgaWlvX2Rldg0KPiAqaW5kaW9fZGV2LCBp
bnQgdmFsLCBpbnQgdmFsMikNCj4gIAl1bnNpZ25lZCBpbnQgdCwgcmVnOw0KDQpJIHdvdWxkIGp1
c3QgY2hhbmdlIHRoZSB0eXBlIG9mICJ0IiB0byAiaW50Ii4NCkVzcGVjaWFsbHksIHNpbmNlICJ2
YWwiICYgInZhbDIiIGFyZSAiaW50Ii4NCg0KVGhhbmtzIGZvciB0aGUgY2F0Y2ggOikNCkFsZXgN
Cg0KPiAgDQo+ICAJdCA9ICB2YWwgKiAxMDAwICsgdmFsMiAvIDEwMDA7DQo+IC0JaWYgKHQgPD0g
MCkNCj4gKwlpZiAodCA9PSAwKQ0KPiAgCQlyZXR1cm4gLUVJTlZBTDsNCj4gIA0KPiAgCS8qDQo
