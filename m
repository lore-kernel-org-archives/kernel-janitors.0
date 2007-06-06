From: Kev Jackson <foamdino@gmail.com>
Date: Wed, 06 Jun 2007 08:27:49 +0000
Subject: [KJ] [patch] Use DMA_32BIT_MASK where appropriate in
Message-Id: <46667005.3070001@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <ab8e556c0706052115uf8e3e13g6a01207eb7b1166a@mail.gmail.com>
In-Reply-To: <ab8e556c0706052115uf8e3e13g6a01207eb7b1166a@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

From: Kev Jackson <foamdino@gmail.com>

-Remove TW_DMA_MASK use DMA_32BIT_MASK instead from kernel janitors TODO

Signed-off-by: Kev Jackson <foamdino@gmail.com>

---
Wrapping at 72 chars broke the previous patch, thuderbird setting modified
I've tested sending this from gmail -> yahoo and the received patch was
applied with no problems.  Please let me know if this is now ok.

 drivers/scsi/3w-xxxx.c |    2 +-
 drivers/scsi/3w-xxxx.h |    1 -
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/scsi/3w-xxxx.c b/drivers/scsi/3w-xxxx.c
index 656bdb1..15ca2a0 100644
--- a/drivers/scsi/3w-xxxx.c
+++ b/drivers/scsi/3w-xxxx.c
@@ -2338,7 +2338,7 @@ static int __devinit tw_probe(struct pci_dev *pdev, const struct pci_device_id *

 	pci_set_master(pdev);

-	retval = pci_set_dma_mask(pdev, TW_DMA_MASK);
+	retval = pci_set_dma_mask(pdev, DMA_32BIT_MASK);
 	if (retval) {
 		printk(KERN_WARNING "3w-xxxx: Failed to set dma mask.");
 		goto out_disable_device;
diff --git a/drivers/scsi/3w-xxxx.h b/drivers/scsi/3w-xxxx.h
index 0742e68..4efd6c2 100644
--- a/drivers/scsi/3w-xxxx.h
+++ b/drivers/scsi/3w-xxxx.h
@@ -234,7 +234,6 @@ static unsigned char tw_sense_table[][4]  #define TW_IOCTL_TIMEOUT                      25 /* 25 seconds */
 #define TW_IOCTL_CHRDEV_TIMEOUT               60 /* 60 seconds */
 #define TW_IOCTL_CHRDEV_FREE                  -1
-#define TW_DMA_MASK			      DMA_32BIT_MASK
 #define TW_MAX_CDB_LEN			      16

 /* Bitmask macros to eliminate bitfields */
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
