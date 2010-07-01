From: Kulikov Vasiliy <segooon@gmail.com>
Date: Thu, 01 Jul 2010 13:17:03 +0000
Subject: [PATCH 24/25] staging/wlags49_h2: remove casts from void*
Message-Id: <1277990225-22889-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kernel Janitors <kernel-janitors@vger.kernel.org>
Cc: Greg Kroah-Hartman <gregkh@suse.de>, Andrew Morton <akpm@linux-foundation.org>, Tejun Heo <tj@kernel.org>, Henk de Groot <pe1dnn@amsat.org>, Huang Weiyi <weiyi.huang@gmail.com>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

Remove unnesessary casts from void*.

Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>
---
 drivers/staging/wlags49_h2/wl_pci.c |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/wlags49_h2/wl_pci.c b/drivers/staging/wlags49_h2/wl_pci.c
index 6751b4b..b736ae8 100644
--- a/drivers/staging/wlags49_h2/wl_pci.c
+++ b/drivers/staging/wlags49_h2/wl_pci.c
@@ -465,7 +465,7 @@ void __devexit wl_pci_remove(struct pci_dev *pdev)
     free_irq( dev->irq, dev );
 
 #ifdef ENABLE_DMA
-    wl_pci_dma_free( pdev, (struct wl_private *)dev->priv );
+    wl_pci_dma_free(pdev, dev->priv);
 #endif
 
     wl_device_dealloc( dev );
@@ -534,7 +534,7 @@ int wl_pci_setup( struct pci_dev *pdev )
 
 #ifdef ENABLE_DMA
     /* Allocate DMA Descriptors */
-    if( wl_pci_dma_alloc( pdev, (struct wl_private *)dev->priv ) < 0 ) {
+    if (wl_pci_dma_alloc(pdev, dev->priv) < 0) {
         DBG_ERROR( DbgInfo, "Could not allocate DMA descriptor memory!!!\n" );
         DBG_LEAVE( DbgInfo );
         return -ENOMEM;
@@ -570,7 +570,7 @@ int wl_pci_setup( struct pci_dev *pdev )
 	}
 
     /* Make sure interrupts are enabled properly for CardBus */
-    lp = (struct wl_private *)dev->priv;
+    lp = dev->priv;
 
     if( lp->hcfCtx.IFB_BusType = CFG_NIC_BUS_TYPE_CARDBUS ||
 	    lp->hcfCtx.IFB_BusType = CFG_NIC_BUS_TYPE_PCI 		) {
-- 
1.7.0.4

