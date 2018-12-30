From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sun, 30 Dec 2018 15:53:08 +0000
Subject: [PATCH 1/8] usb: gadget: udc: reduce indentation
Message-Id: <1546185195-25676-2-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Felipe Balbi <balbi@kernel.org>
Cc: kernel-janitors@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org

Delete tab aligning a statement with the right hand side of a
preceding assignment rather than the left hand side.

Found with the help of Coccinelle.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/usb/gadget/udc/snps_udc_core.c |   17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/usb/gadget/udc/snps_udc_core.c b/drivers/usb/gadget/udc/snps_udc_core.c
index d4da47f4f6f4..3fcded31405a 100644
--- a/drivers/usb/gadget/udc/snps_udc_core.c
+++ b/drivers/usb/gadget/udc/snps_udc_core.c
@@ -947,15 +947,14 @@ static int prep_dma(struct udc_ep *ep, struct udc_request *req, gfp_t gfp)
 				UDC_DMA_STP_STS_BS_HOST_READY,
 				UDC_DMA_STP_STS_BS);
 
-
-			/* clear NAK by writing CNAK */
-			if (ep->naking) {
-				tmp = readl(&ep->regs->ctl);
-				tmp |= AMD_BIT(UDC_EPCTL_CNAK);
-				writel(tmp, &ep->regs->ctl);
-				ep->naking = 0;
-				UDC_QUEUE_CNAK(ep, ep->num);
-			}
+		/* clear NAK by writing CNAK */
+		if (ep->naking) {
+			tmp = readl(&ep->regs->ctl);
+			tmp |= AMD_BIT(UDC_EPCTL_CNAK);
+			writel(tmp, &ep->regs->ctl);
+			ep->naking = 0;
+			UDC_QUEUE_CNAK(ep, ep->num);
+		}
 
 	}
 
