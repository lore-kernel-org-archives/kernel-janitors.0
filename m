From: Kev Jackson <foamdino@gmail.com>
Date: Mon, 11 Jun 2007 10:12:31 +0000
Subject: [KJ] [PATCH][trivial] Use DMA_32BIT_MASK where appropriate in
Message-Id: <466D200F.3050103@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

From: Kev Jackson <foamdino@gmail.com>

-Replaces 0xffff... with DMA_32BIT_MASK in pci_set_dma_mask() call as per Kernel Janitors TODO list

Signed-off-by: Kev Jackson <foamdino@gmail.com>
--
 ivtv-driver.c |    2 +-
 ivtv-driver.h |    1 +
 2 files changed, 2 insertions(+), 1 deletion(-)


diff --git a/drivers/media/video/ivtv/ivtv-driver.c b/drivers/media/video/ivtv/ivtv-driver.c
index e29f949..f27f349 100644
--- a/drivers/media/video/ivtv/ivtv-driver.c
+++ b/drivers/media/video/ivtv/ivtv-driver.c
@@ -732,7 +732,7 @@ static int ivtv_setup_pci(struct ivtv *itv, struct pci_dev *dev,
 		IVTV_ERR("Can't enable device %d!\n", itv->num);
 		return -EIO;
 	}
-	if (pci_set_dma_mask(dev, 0xffffffff)) {
+	if (pci_set_dma_mask(dev, DMA_32BIT_MASK)) {
 		IVTV_ERR("No suitable DMA available on card %d.\n", itv->num);
 		return -EIO;
 	}
diff --git a/drivers/media/video/ivtv/ivtv-driver.h b/drivers/media/video/ivtv/ivtv-driver.h
index 552f045..05f508e 100644
--- a/drivers/media/video/ivtv/ivtv-driver.h
+++ b/drivers/media/video/ivtv/ivtv-driver.h
@@ -54,6 +54,7 @@
 #include <linux/pagemap.h>
 #include <linux/workqueue.h>
 #include <linux/mutex.h>
+#include <linux/dma-mapping.h>
 #include <asm/uaccess.h>
 #include <asm/system.h>
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
