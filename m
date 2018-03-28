From: Bart Van Assche <Bart.VanAssche@wdc.com>
Date: Wed, 28 Mar 2018 16:49:16 +0000
Subject: Re: [PATCH][scsi-next] scsi: core: remove redundant assignment to shost->use_blk_mq
Message-Id: <322332967046adbc933b27c9d5660e3527b6ad2e.camel@wdc.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180328164142.27201-1-colin.king@canonical.com>
In-Reply-To: <20180328164142.27201-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "jejb@linux.vnet.ibm.com" <jejb@linux.vnet.ibm.com>, "colin.king@canonical.com" <colin.king@canonical.com>, "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>, "martin.petersen@oracle.com" <martin.petersen@oracle.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "ming.lei@redhat.com" <ming.lei@redhat.com>

T24gV2VkLCAyMDE4LTAzLTI4IGF0IDE3OjQxICswMTAwLCBDb2xpbiBLaW5nIHdyb3RlOg0KPiBG
cm9tOiBDb2xpbiBJYW4gS2luZyA8Y29saW4ua2luZ0BjYW5vbmljYWwuY29tPg0KPiANCj4gVGhl
IGZpcnN0IGFzc2lnbm1lbnQgdG8gc2hvc3QtPnVzZV9ibGtfbXEgaXMgcmVkdW5kYW50IGFzIGl0
IGlzDQo+IG92ZXJ3cml0dGVuIGJ5IHRoZSBmb2xsb3dpbmcgc3RhdGVtZW50LiBSZW1vdmUgdGhp
cyByZWR1bmRhbnQgY29kZS4NCj4gDQo+IERldGVjdGVkIGJ5IENvdmVyaXR5U2NhbiwgQ0lEIzE0
NjY5OTMgKCJVbnVzZWQgdmFsdWUiKQ0KDQpSZXZpZXdlZC1ieTogQmFydCBWYW4gQXNzY2hlIDxi
YXJ0LnZhbmFzc2NoZUB3ZGMuY29tPg0KDQoNCg0KDQo