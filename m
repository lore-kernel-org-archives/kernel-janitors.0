From: David Laight <David.Laight@ACULAB.COM>
Date: Fri, 16 Feb 2018 15:14:51 +0000
Subject: RE: [PATCH] rtc: tx4939: avoid unintended sign extension on a 24 bit shift
Message-Id: <d943a549d051472c98e3c163dc4245ac@AcuMS.aculab.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180215185941.27547-1-colin.king@canonical.com>
 <CAHp75Vf+ky3Ma1b20x57i9z+ykS1j8k1LTuOT3f=Jbu5kCeeAQ@mail.gmail.com>
In-Reply-To: <CAHp75Vf+ky3Ma1b20x57i9z+ykS1j8k1LTuOT3f=Jbu5kCeeAQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: 'Andy Shevchenko' <andy.shevchenko@gmail.com>, Colin King <colin.king@canonical.com>
Cc: Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

RnJvbTogQW5keSBTaGV2Y2hlbmtvDQo+IFNlbnQ6IDE2IEZlYnJ1YXJ5IDIwMTggMTQ6MjMNCi4u
Lg0KPiBXb3VsZG4ndCBiZSBiZXR0ZXIgdG8gdXNlIGxlMzJfdG9fY3B1KCkgb3IgZ2V0X3VuYWxp
Z25lZCgpPw0KDQpPciBzaG9vdCB0aGUgbWVtYmVycyBvZiB0aGUgQU5TSSBDIGNvbW1pdHRlZSB3
aG8gaW5zaXN0ZWQgb24NCnByb21vdGlvbiBvZiB1bnNpZ25lZCBjaGFyL3Nob3J0IHRvIGludCBh
bmQgc2lnbiBwcmVzZXJ2aW5nDQpwcm9tb3Rpb24gb2YgaW50IHRvIHVuc2lnbmVkIGxvbmcgOi0p
DQoNCglEYXZpZA0KDQo