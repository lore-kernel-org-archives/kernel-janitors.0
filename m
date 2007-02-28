From: Tobias Klauser <tklauser@distanz.ch>
Date: Wed, 28 Feb 2007 09:31:45 +0000
Subject: [KJ] [PATCH] aacraid: Use DMA_31BIT_MASK
Message-Id: <20070228093145.GA15159@distanz.ch>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@lists.osdl.org
Cc: linux-scsi@vger.kernel.org

Use constants from linux/dma-mapping.h for pci_set_dma_mask() and
pci_set_consistent_dma_mask()

Signed-off-by: Tobias Klauser <tklauser@distanz.ch>

---
 drivers/scsi/aacraid/commsup.c |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/scsi/aacraid/commsup.c b/drivers/scsi/aacraid/commsup.c
index 1b97f60..bb4fe48 100644
--- a/drivers/scsi/aacraid/commsup.c
+++ b/drivers/scsi/aacraid/commsup.c
@@ -34,6 +34,7 @@
 #include <linux/types.h>
 #include <linux/sched.h>
 #include <linux/pci.h>
+#include <linux/dma-mapping.h>
 #include <linux/spinlock.h>
 #include <linux/slab.h>
 #include <linux/completion.h>
@@ -1113,8 +1114,8 @@ static int _aac_reset_adapter(struct aac_dev *aac)
 		  ((retval = pci_set_consistent_dma_mask(aac->pdev, DMA_32BIT_MASK))))
 			goto out;
 	} else {
-		if (((retval = pci_set_dma_mask(aac->pdev, 0x7FFFFFFFULL))) ||
-		  ((retval = pci_set_consistent_dma_mask(aac->pdev, 0x7FFFFFFFULL))))
+		if (((retval = pci_set_dma_mask(aac->pdev, DMA_31BIT_MASK))) ||
+		  ((retval = pci_set_consistent_dma_mask(aac->pdev, DMA_31BIT_MASK))))
 			goto out;
 	}
 	if ((retval = (*(aac_get_driver_ident(index)->init))(aac)))
-- 
1.5.0.2

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
