From: Leonard Crestez <leonard.crestez@nxp.com>
Date: Tue, 18 Dec 2018 08:54:36 +0000
Subject: Re: [PATCH] PCI: imx: Fix an IS_ERR() vs NULL bug
Message-Id: <9ba5927dd322732b73f1fa0852ec20fdf918ba7b.camel@nxp.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181218082329.GB440@kadam>
In-Reply-To: <20181218082329.GB440@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "dan.carpenter@oracle.com" <dan.carpenter@oracle.com>, "lorenzo.pieralisi@arm.com" <lorenzo.pieralisi@arm.com>
Cc: Richard Zhu <hongxing.zhu@nxp.com>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "bhelgaas@google.com" <bhelgaas@google.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "l.stach@pengutronix.de" <l.stach@pengutronix.de>

T24gVHVlLCAyMDE4LTEyLTE4IGF0IDExOjIzICswMzAwLCBEYW4gQ2FycGVudGVyIHdyb3RlOg0K
PiBUaGUgZGV2aWNlX2xpbmtfYWRkKCkgZnVuY3Rpb24gZG9lc24ndCByZXR1cm4gZXJyb3IgcG9p
bnRlcnMsIGl0IHJldHVybnMNCj4gTlVMTCBpZiB0aGVyZSBpcyBhbiBlcnJvci4NCj4gDQo+IEZp
eGVzOiA3YTY5OTExNTliY2QgKCJQQ0k6IGlteDogQWRkIG11bHRpLXBkIHN1cHBvcnQiKQ0KPiBT
aWduZWQtb2ZmLWJ5OiBEYW4gQ2FycGVudGVyIDxkYW4uY2FycGVudGVyQG9yYWNsZS5jb20+DQoN
ClJldmlld2VkLWJ5OiBMZW9uYXJkIENyZXN0ZXogPGxlb25hcmQuY3Jlc3RlekBueHAuY29tPg0K
DQpJIGFzc3VtZSB0aGlzIHdhcyBmb3VuZCB3aXRoIGEgc3RhdGljIGNoZWNrZXI/DQo
