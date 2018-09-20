From: Leonard Crestez <leonard.crestez@nxp.com>
Date: Thu, 20 Sep 2018 12:17:18 +0000
Subject: Re: [PATCH] serial: imx: restore handshaking irq for imx1
Message-Id: <7c7d24fcfac2fe8afe7151d3afe49cb48be68dce.camel@nxp.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180920071957.xnwni4lqb5kgncfc@pengutronix.de>
         <20180920121117.19041-1-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20180920121117.19041-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "jslaby@suse.com" <jslaby@suse.com>, "u.kleine-koenig@pengutronix.de" <u.kleine-koenig@pengutronix.de>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
Cc: "yuehaibing@huawei.com" <yuehaibing@huawei.com>, "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "kernel@pengutronix.de" <kernel@pengutronix.de>, Andy Duan <fugang.duan@nxp.com>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

T24gVGh1LCAyMDE4LTA5LTIwIGF0IDE0OjExICswMjAwLCBVd2UgS2xlaW5lLUvDtm5pZyB3cm90
ZToNCj4gQmFjayBpbiAyMDE1IHdoZW4gaXJkYSB3YXMgZHJvcHBlZCBmcm9tIHRoZSBkcml2ZXIg
aW14MSB3YXMgYnJva2VuLiBUaGlzDQo+IGNoYW5nZSByZWludHJvZHVjZXMgdGhlIHN1cHBvcnQg
Zm9yIHRoZSB0aGlyZCBpbnRlcnJ1cHQgb2YgdGhlIFVBUlQuDQo+IA0KPiBGaXhlczogYWZlOWNi
YjFhNmFkICgic2VyaWFsOiBpbXg6IGRyb3Agc3VwcG9ydCBmb3IgSVJEQSIpDQo+IFNpZ25lZC1v
ZmYtYnk6IFV3ZSBLbGVpbmUtS8O2bmlnIDx1LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+
DQoNClJldmlld2VkLWJ5OiBMZW9uYXJkIENyZXN0ZXogPGxlb25hcmQuY3Jlc3RlekBueHAuY29t
Pg0KDQpJJ20gbm90IHN1cmUgaWYgYW55b25lIGhhcyBpbXgxIGhhcmR3YXJlIGhhbmR5IGNhbiBp
cyB3aWxsaW5nIHRvIHRlc3QNCnRoaXMgQ1RTL1JUUyBidXQgdGhlIGZpeCBpcyBwcmV0dHkgb2J2
aW91c2x5IGNvcnJlY3Qu
