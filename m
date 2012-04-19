From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Thu, 19 Apr 2012 11:03:58 +0000
Subject: [PATCH] drivers/staging/wlags49_h2/wl_pci.c: add missing wl_device_dealloc and wl_remove
Message-Id: <1334833438-23016-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Henk de Groot <pe1dnn@amsat.org>
Cc: kernel-janitors@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>

The need for wl_device_dealloc is motivated by the error-handling code for
the failure of wl_adapter_insert.  The need for wl_remove in the third case
is motivated by the code in the definition of wl_pci_remove.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
Not tested.

 drivers/staging/wlags49_h2/wl_pci.c |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/staging/wlags49_h2/wl_pci.c b/drivers/staging/wlags49_h2/wl_pci.c
index 3df990c..0b31b01 100644
--- a/drivers/staging/wlags49_h2/wl_pci.c
+++ b/drivers/staging/wlags49_h2/wl_pci.c
@@ -524,6 +524,7 @@ int wl_pci_setup( struct pci_dev *pdev )
     /* Make sure that space was allocated for our private adapter struct */
     if( dev->priv = NULL ) {
         DBG_ERROR( DbgInfo, "Private adapter struct was not allocated!!!\n" );
+	wl_device_dealloc(dev);
         DBG_LEAVE( DbgInfo );
         return -ENOMEM;
     }
@@ -532,6 +533,7 @@ int wl_pci_setup( struct pci_dev *pdev )
     /* Allocate DMA Descriptors */
     if( wl_pci_dma_alloc( pdev, dev->priv ) < 0 ) {
         DBG_ERROR( DbgInfo, "Could not allocate DMA descriptor memory!!!\n" );
+	wl_device_dealloc(dev);
         DBG_LEAVE( DbgInfo );
         return -ENOMEM;
     }
@@ -561,6 +563,8 @@ int wl_pci_setup( struct pci_dev *pdev )
     result = request_irq(dev->irq, wl_isr, SA_SHIRQ, dev->name, dev);
     if( result ) {
         DBG_WARNING( DbgInfo, "Could not register ISR!!!\n" );
+	wl_remove(dev);
+	wl_device_dealloc(dev);
         DBG_LEAVE( DbgInfo );
         return result;
 	}

