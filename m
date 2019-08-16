From: "Ardelean, Alexandru" <alexandru.Ardelean@analog.com>
Date: Fri, 16 Aug 2019 06:16:26 +0000
Subject: Re: [PATCH] iio: dac: ad5380: fix incorrect assignment to val
Message-Id: <876a4d5190828619f75365863cc6bf2cfea4ffea.camel@analog.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190815115846.21800-1-colin.king@canonical.com>
In-Reply-To: <20190815115846.21800-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Popa, Stefan Serban" <StefanSerban.Popa@analog.com>, "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>, "jic23@kernel.org" <jic23@kernel.org>, "colin.king@canonical.com" <colin.king@canonical.com>, "Hennerich, Michael" <Michael.Hennerich@analog.com>, "lars@metafoo.de" <lars@metafoo.de>, "knaack.h@gmx.de" <knaack.h@gmx.de>, "pmeerw@pmeerw.net" <pmeerw@pmeerw.net>
Cc: "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

T24gVGh1LCAyMDE5LTA4LTE1IGF0IDEyOjU4ICswMTAwLCBDb2xpbiBLaW5nIHdyb3RlOg0KPiBb
RXh0ZXJuYWxdDQo+IA0KDQpSZXZpZXdlZC1ieTogQWxleGFuZHJ1IEFyZGVsZWFuIDxhbGV4YW5k
cnUuYXJkZWxlYW5AYW5hbG9nLmNvbT4NCg0KPiBGcm9tOiBDb2xpbiBJYW4gS2luZyA8Y29saW4u
a2luZ0BjYW5vbmljYWwuY29tPg0KPiANCj4gQ3VycmVudGx5IHRoZSBwb2ludGVyIHZhbCBpcyBi
ZWluZyBpbmNvcnJlY3RseSBpbmNyZW1lbnRlZA0KPiBpbnN0ZWFkIG9mIHRoZSB2YWx1ZSBwb2lu
dGVkIHRvIGJ5IHZhbC4gRml4IHRoaXMgYnkgYWRkaW5nDQo+IGluIHRoZSBtaXNzaW5nICogaW5k
aXJlY3Rpb24gb3BlcmF0b3IuDQo+IA0KPiBBZGRyZXNzZXMtQ292ZXJpdHk6ICgiVW51c2VkIHZh
bHVlIikNCj4gRml4ZXM6IGMwM2YyYzUzNjgxOCAoInN0YWdpbmc6aWlvOmRhYzogQWRkIEFENTM4
MCBkcml2ZXIiKQ0KPiBTaWduZWQtb2ZmLWJ5OiBDb2xpbiBJYW4gS2luZyA8Y29saW4ua2luZ0Bj
YW5vbmljYWwuY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvaWlvL2RhYy9hZDUzODAuYyB8IDIgKy0N
Cj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0KPiANCj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvaWlvL2RhYy9hZDUzODAuYyBiL2RyaXZlcnMvaWlvL2RhYy9h
ZDUzODAuYw0KPiBpbmRleCA0MzM1MjE0ODAwZDIuLjJlYmUwODMyNjA0OCAxMDA2NDQNCj4gLS0t
IGEvZHJpdmVycy9paW8vZGFjL2FkNTM4MC5jDQo+ICsrKyBiL2RyaXZlcnMvaWlvL2RhYy9hZDUz
ODAuYw0KPiBAQCAtMjIwLDcgKzIyMCw3IEBAIHN0YXRpYyBpbnQgYWQ1MzgwX3JlYWRfcmF3KHN0
cnVjdCBpaW9fZGV2ICppbmRpb19kZXYsDQo+ICAJCWlmIChyZXQpDQo+ICAJCQlyZXR1cm4gcmV0
Ow0KPiAgCQkqdmFsID4+PSBjaGFuLT5zY2FuX3R5cGUuc2hpZnQ7DQo+IC0JCXZhbCAtPSAoMSA8
PCBjaGFuLT5zY2FuX3R5cGUucmVhbGJpdHMpIC8gMjsNCj4gKwkJKnZhbCAtPSAoMSA8PCBjaGFu
LT5zY2FuX3R5cGUucmVhbGJpdHMpIC8gMjsNCj4gIAkJcmV0dXJuIElJT19WQUxfSU5UOw0KPiAg
CWNhc2UgSUlPX0NIQU5fSU5GT19TQ0FMRToNCj4gIAkJKnZhbCA9IDIgKiBzdC0+dnJlZjsNCg=
