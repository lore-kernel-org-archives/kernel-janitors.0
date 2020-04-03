From: "Ardelean, Alexandru" <alexandru.Ardelean@analog.com>
Date: Fri, 03 Apr 2020 13:26:00 +0000
Subject: Re: [PATCH][next] iio: dac: ad5770r: fix off-by-one check on maximum number of channels
Message-Id: <84628ce3f18d1a1ab50f76d04386dbef46f151b3.camel@analog.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200403125838.71271-1-colin.king@canonical.com>
In-Reply-To: <20200403125838.71271-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "stefan.popa@analog.com" <stefan.popa@analog.com>, "Tachici, Alexandru" <Alexandru.Tachici@analog.com>, "Caprioru, Mircea" <Mircea.Caprioru@analog.com>, "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>, "jic23@kernel.org" <jic23@kernel.org>, "colin.king@canonical.com" <colin.king@canonical.com>, "Hennerich, Michael" <Michael.Hennerich@analog.com>, "lars@metafoo.de" <lars@metafoo.de>, "knaack.h@gmx.de" <knaack.h@gmx.de>, "pmeerw@pmeerw.net" <pmeerw@pmeerw.net>
Cc: "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

T24gRnJpLCAyMDIwLTA0LTAzIGF0IDEzOjU4ICswMTAwLCBDb2xpbiBLaW5nIHdyb3RlOg0KPiBb
RXh0ZXJuYWxdDQo+IA0KPiBGcm9tOiBDb2xpbiBJYW4gS2luZyA8Y29saW4ua2luZ0BjYW5vbmlj
YWwuY29tPg0KPiANCj4gQ3VycmVudGx5IHRoZXJlIGlzIGFuIG9mZi1ieS1vbmUgY2hlY2sgb24g
dGhlIG51bWJlciBvZiBjaGFubmVscyB0aGF0DQo+IHdpbGwgY2F1c2UgYW4gYXJyeSBvdmVycnVu
IGluIGFycmF5IHN0LT5vdXRwdXRfbW9kZSB3aGVuIGNhbGxpbmcgdGhlDQo+IGZ1bmN0aW9uIGQ1
Nzcwcl9zdG9yZV9vdXRwdXRfcmFuZ2UuIEZpeCB0aGlzIGJ5IHVzaW5nID49IHJhdGhlciB0aGFu
ID4NCj4gdG8gY2hlY2sgZm9yIG1heGltdW0gbnVtYmVyIG9mIGNoYW5uZWxzLg0KPiANCg0KUmV2
aWV3ZWQtYnk6IEFsZXhhbmRydSBBcmRlbGVhbiA8YWxleGFuZHJ1LmFyZGVsZWFuQGFuYWxvZy5j
b20+DQoNCj4gQWRkcmVzc2VzLUNvdmVyaXR5OiAoIk91dC1vZi1ib3VuZHMgYWNjZXNzIikNCj4g
Rml4ZXM6IGNiYmI4MTk4MzdmNiAoImlpbzogZGFjOiBhZDU3NzByOiBBZGQgQUQ1NzcwUiBzdXBw
b3J0IikNCj4gU2lnbmVkLW9mZi1ieTogQ29saW4gSWFuIEtpbmcgPGNvbGluLmtpbmdAY2Fub25p
Y2FsLmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJzL2lpby9kYWMvYWQ1Nzcwci5jIHwgMiArLQ0KPiAg
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQo+IA0KPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9paW8vZGFjL2FkNTc3MHIuYyBiL2RyaXZlcnMvaWlvL2RhYy9hZDU3
NzByLmMNCj4gaW5kZXggYTk4ZWE3NjczMmU3Li4yZDc2MjNiOWIyYzAgMTAwNjQ0DQo+IC0tLSBh
L2RyaXZlcnMvaWlvL2RhYy9hZDU3NzByLmMNCj4gKysrIGIvZHJpdmVycy9paW8vZGFjL2FkNTc3
MHIuYw0KPiBAQCAtNTI1LDcgKzUyNSw3IEBAIHN0YXRpYyBpbnQgYWQ1Nzcwcl9jaGFubmVsX2Nv
bmZpZyhzdHJ1Y3QgYWQ1Nzcwcl9zdGF0ZQ0KPiAqc3QpDQo+ICAJCXJldCA9IGZ3bm9kZV9wcm9w
ZXJ0eV9yZWFkX3UzMihjaGlsZCwgIm51bSIsICZudW0pOw0KPiAgCQlpZiAocmV0KQ0KPiAgCQkJ
cmV0dXJuIHJldDsNCj4gLQkJaWYgKG51bSA+IEFENTc3MFJfTUFYX0NIQU5ORUxTKQ0KPiArCQlp
ZiAobnVtID49IEFENTc3MFJfTUFYX0NIQU5ORUxTKQ0KPiAgCQkJcmV0dXJuIC1FSU5WQUw7DQo+
ICANCj4gIAkJcmV0ID0gZndub2RlX3Byb3BlcnR5X3JlYWRfdTMyX2FycmF5KGNoaWxkLA0K
