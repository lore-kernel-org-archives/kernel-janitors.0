From: Kulikov Vasiliy <segooon@gmail.com>
Date: Tue, 29 Jun 2010 10:16:16 +0000
Subject: [PATCH 21/25] vme_ca91cx42: remove casts from void*
Message-Id: <1277806577-31418-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kernel Janitors <kernel-janitors@vger.kernel.org>
Cc: Greg Kroah-Hartman <gregkh@suse.de>, Martyn Welch <martyn.welch@ge.com>, Julia Lawall <julia@diku.dk>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

Remove unnesessary casts from void*.

Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>
---
 drivers/staging/vme/bridges/vme_ca91cx42.c |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/vme/bridges/vme_ca91cx42.c b/drivers/staging/vme/bridges/vme_ca91cx42.c
index 0c82eb4..ce05ffa 100644
--- a/drivers/staging/vme/bridges/vme_ca91cx42.c
+++ b/drivers/staging/vme/bridges/vme_ca91cx42.c
@@ -961,11 +961,11 @@ int ca91cx42_dma_list_add(struct vme_dma_list *list, struct vme_dma_attr *src,
 
 	if (dest->type = VME_DMA_VME) {
 		entry->descriptor.dctl |= CA91CX42_DCTL_L2V;
-		vme_attr = (struct vme_dma_vme *)dest->private;
-		pci_attr = (struct vme_dma_pci *)src->private;
+		vme_attr = dest->private;
+		pci_attr = src->private;
 	} else {
-		vme_attr = (struct vme_dma_vme *)src->private;
-		pci_attr = (struct vme_dma_pci *)dest->private;
+		vme_attr = src->private;
+		pci_attr = dest->private;
 	}
 
 	/* Check we can do fullfill required attributes */
-- 
1.7.0.4

