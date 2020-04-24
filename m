From: "Ardelean, Alexandru" <alexandru.Ardelean@analog.com>
Date: Fri, 24 Apr 2020 15:01:26 +0000
Subject: Re: [PATCH][next] iio: adc: ad7476: remove redundant null check on an array
Message-Id: <f2c6d3f3f8f884e87f1c9895fe99b77e8f4c1e3e.camel@analog.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200424130419.22940-1-colin.king@canonical.com>
In-Reply-To: <20200424130419.22940-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "lars@metafoo.de" <lars@metafoo.de>, "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>, "Bogdan, Dragos" <Dragos.Bogdan@analog.com>, "pmeerw@pmeerw.net" <pmeerw@pmeerw.net>, "knaack.h@gmx.de" <knaack.h@gmx.de>, "colin.king@canonical.com" <colin.king@canonical.com>, "Hennerich, Michael" <Michael.Hennerich@analog.com>, "jic23@kernel.org" <jic23@kernel.org>
Cc: "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

T24gRnJpLCAyMDIwLTA0LTI0IGF0IDE0OjA0ICswMTAwLCBDb2xpbiBLaW5nIHdyb3RlOg0KPiBG
cm9tOiBDb2xpbiBJYW4gS2luZyA8Y29saW4ua2luZ0BjYW5vbmljYWwuY29tPg0KPiANCj4gVGhl
IG51bGwgY2hlY2sgb24gc3QtPmNoaXBfaW5mby0+Y29udnN0X2NoYW5uZWwgaXMgcmVkdW5kYW50
IGJlY2F1c2UNCj4gY29udnN0X2NoYW5uZWwgaXMgYSAyIGVsZW1lbnQgYXJyYXkgb2Ygc3RydWN0
IGlpb19jaGFuX3NwZWMgb2JqZWN0cw0KPiBhbmQgdGhpcyBjYW4gbmV2ZXIgYmUgbnVsbC4gRml4
IHRoaXMgYnkgcmVtb3ZpbmcgdGhlIG51bGwgY2hlY2suDQo+IA0KDQpSZXZpZXdlZC1ieTogQWxl
eGFuZHJ1IEFyZGVsZWFuIDxhbGV4YW5kcnUuYXJkZWxlYW5AYW5hbG9nLmNvbT4NCg0KPiBBZGRy
ZXNzZXMtQ292ZXJpdHk6ICgiQXJyYXkgY29tcGFyZWQgYWdhaW5zdCAwIikNCj4gU2lnbmVkLW9m
Zi1ieTogQ29saW4gSWFuIEtpbmcgPGNvbGluLmtpbmdAY2Fub25pY2FsLmNvbT4NCj4gLS0tDQo+
ICBkcml2ZXJzL2lpby9hZGMvYWQ3NDc2LmMgfCAyICstDQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2lp
by9hZGMvYWQ3NDc2LmMgYi9kcml2ZXJzL2lpby9hZGMvYWQ3NDc2LmMNCj4gaW5kZXggZTk5ODRh
MzhmYzRjLi40ZTgxNmQ3MTRhZDIgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvaWlvL2FkYy9hZDc0
NzYuYw0KPiArKysgYi9kcml2ZXJzL2lpby9hZGMvYWQ3NDc2LmMNCj4gQEAgLTMwOSw3ICszMDks
NyBAQCBzdGF0aWMgaW50IGFkNzQ3Nl9wcm9iZShzdHJ1Y3Qgc3BpX2RldmljZSAqc3BpKQ0KPiAg
CWluZGlvX2Rldi0+bnVtX2NoYW5uZWxzID0gMjsNCj4gIAlpbmRpb19kZXYtPmluZm8gPSAmYWQ3
NDc2X2luZm87DQo+ICANCj4gLQlpZiAoc3QtPmNvbnZzdF9ncGlvICYmIHN0LT5jaGlwX2luZm8t
PmNvbnZzdF9jaGFubmVsKQ0KPiArCWlmIChzdC0+Y29udnN0X2dwaW8pDQo+ICAJCWluZGlvX2Rl
di0+Y2hhbm5lbHMgPSBzdC0+Y2hpcF9pbmZvLT5jb252c3RfY2hhbm5lbDsNCj4gIAkvKiBTZXR1
cCBkZWZhdWx0IG1lc3NhZ2UgKi8NCj4gIA0K
