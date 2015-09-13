From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sun, 13 Sep 2015 12:15:09 +0000
Subject: [PATCH 16/39] usb: gadget: drop null test before destroy functions
Message-Id: <1442146532-9100-17-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1442146532-9100-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1442146532-9100-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Felipe Balbi <balbi@ti.com>
Cc: sergey.senozhatsky@gmail.com, kernel-janitors@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org

Remove unneeded NULL test.

The semantic patch that makes this change is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@ expression x; @@
-if (x != NULL)
  \(kmem_cache_destroy\|mempool_destroy\|dma_pool_destroy\)(x);
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/usb/gadget/udc/bdc/bdc_core.c |    3 +--
 drivers/usb/gadget/udc/gr_udc.c       |    3 +--
 drivers/usb/gadget/udc/mv_u3d_core.c  |    3 +--
 drivers/usb/gadget/udc/mv_udc_core.c  |    3 +--
 4 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/gadget/udc/mv_udc_core.c b/drivers/usb/gadget/udc/mv_udc_core.c
index 339af51..81b6229 100644
--- a/drivers/usb/gadget/udc/mv_udc_core.c
+++ b/drivers/usb/gadget/udc/mv_udc_core.c
@@ -2100,8 +2100,7 @@ static int mv_udc_remove(struct platform_device *pdev)
 	}
 
 	/* free memory allocated in probe */
-	if (udc->dtd_pool)
-		dma_pool_destroy(udc->dtd_pool);
+	dma_pool_destroy(udc->dtd_pool);
 
 	if (udc->ep_dqh)
 		dma_free_coherent(&pdev->dev, udc->ep_dqh_size,
diff --git a/drivers/usb/gadget/udc/gr_udc.c b/drivers/usb/gadget/udc/gr_udc.c
index 8aa2593..b9429bc 100644
--- a/drivers/usb/gadget/udc/gr_udc.c
+++ b/drivers/usb/gadget/udc/gr_udc.c
@@ -2117,8 +2117,7 @@ static int gr_remove(struct platform_device *pdev)
 		return -EBUSY;
 
 	gr_dfs_delete(dev);
-	if (dev->desc_pool)
-		dma_pool_destroy(dev->desc_pool);
+	dma_pool_destroy(dev->desc_pool);
 	platform_set_drvdata(pdev, NULL);
 
 	gr_free_request(&dev->epi[0].ep, &dev->ep0reqi->req);
diff --git a/drivers/usb/gadget/udc/mv_u3d_core.c b/drivers/usb/gadget/udc/mv_u3d_core.c
index 4c48969..dafe74e 100644
--- a/drivers/usb/gadget/udc/mv_u3d_core.c
+++ b/drivers/usb/gadget/udc/mv_u3d_core.c
@@ -1767,8 +1767,7 @@ static int mv_u3d_remove(struct platform_device *dev)
 	usb_del_gadget_udc(&u3d->gadget);
 
 	/* free memory allocated in probe */
-	if (u3d->trb_pool)
-		dma_pool_destroy(u3d->trb_pool);
+	dma_pool_destroy(u3d->trb_pool);
 
 	if (u3d->ep_context)
 		dma_free_coherent(&dev->dev, u3d->ep_context_size,
diff --git a/drivers/usb/gadget/udc/bdc/bdc_core.c b/drivers/usb/gadget/udc/bdc/bdc_core.c
index 5c8f4ef..ccb9c21 100644
--- a/drivers/usb/gadget/udc/bdc/bdc_core.c
+++ b/drivers/usb/gadget/udc/bdc/bdc_core.c
@@ -324,8 +324,7 @@ static void bdc_mem_free(struct bdc *bdc)
 				bdc->scratchpad.buff, bdc->scratchpad.sp_dma);
 
 	/* Destroy the dma pools */
-	if (bdc->bd_table_pool)
-		dma_pool_destroy(bdc->bd_table_pool);
+	dma_pool_destroy(bdc->bd_table_pool);
 
 	/* Free the bdc_ep array */
 	kfree(bdc->bdc_ep_array);

