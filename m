From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Fri, 07 Oct 2016 20:12:39 +0000
Subject: [PATCH] usb: dwc3: Fix size used in dma_free_coherent()
Message-Id: <1475871159-14362-1-git-send-email-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: balbi@kernel.org, gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

In commit 2abd9d5fa60f9 ("usb: dwc3: ep0: Add chained TRB support"), the
size of the memory allocated with 'dma_alloc_coherent()' has been modified
but the corresponding calls to 'dma_free_coherent()' have not been updated
accordingly.

This has been spotted with coccinelle, using the following script:
////////////////////
@r@
expression x0, x1, y0, y1, z0, z1, t0, t1, ret;
@@

*   ret = dma_alloc_coherent(x0, y0, z0, t0);
    ...
*   dma_free_coherent(x1, y1, ret, t1);


@script:python@
y0 << r.y0;
y1 << r.y1;

@@
if y1.find(y0) = -1:
 print "WARNING: sizes look different:  '%s'   vs   '%s'" % (y0, y1)
////////////////////

Fixes: 2abd9d5fa60f9 ("usb: dwc3: ep0: Add chained TRB support")

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Untested
---
 drivers/usb/dwc3/gadget.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
index 07cc8929f271..01d388ea9115 100644
--- a/drivers/usb/dwc3/gadget.c
+++ b/drivers/usb/dwc3/gadget.c
@@ -2980,7 +2980,7 @@ int dwc3_gadget_init(struct dwc3 *dwc)
 	kfree(dwc->setup_buf);
 
 err2:
-	dma_free_coherent(dwc->dev, sizeof(*dwc->ep0_trb),
+	dma_free_coherent(dwc->dev, sizeof(*dwc->ep0_trb) * 2,
 			dwc->ep0_trb, dwc->ep0_trb_addr);
 
 err1:
@@ -3005,7 +3005,7 @@ void dwc3_gadget_exit(struct dwc3 *dwc)
 	kfree(dwc->setup_buf);
 	kfree(dwc->zlp_buf);
 
-	dma_free_coherent(dwc->dev, sizeof(*dwc->ep0_trb),
+	dma_free_coherent(dwc->dev, sizeof(*dwc->ep0_trb) * 2,
 			dwc->ep0_trb, dwc->ep0_trb_addr);
 
 	dma_free_coherent(dwc->dev, sizeof(*dwc->ctrl_req),
-- 
2.7.4

