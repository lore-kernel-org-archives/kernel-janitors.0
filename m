From: Kulikov Vasiliy <segooon@gmail.com>
Date: Tue, 29 Jun 2010 10:16:20 +0000
Subject: [PATCH 22/25] vme_tsi148: remove casts from void*
Message-Id: <1277806581-31452-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kernel Janitors <kernel-janitors@vger.kernel.org>
Cc: Greg Kroah-Hartman <gregkh@suse.de>, Martyn Welch <martyn.welch@ge.com>, Julia Lawall <julia@diku.dk>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

Remove unnesessary casts from void*.

Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>
---
 drivers/staging/vme/bridges/vme_tsi148.c |   10 +++++-----
 1 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/vme/bridges/vme_tsi148.c b/drivers/staging/vme/bridges/vme_tsi148.c
index abe88a3..4685a31 100644
--- a/drivers/staging/vme/bridges/vme_tsi148.c
+++ b/drivers/staging/vme/bridges/vme_tsi148.c
@@ -1649,7 +1649,7 @@ int tsi148_dma_list_add(struct vme_dma_list *list, struct vme_dma_attr *src,
 	/* Fill out source part */
 	switch (src->type) {
 	case VME_DMA_PATTERN:
-		pattern_attr = (struct vme_dma_pattern *)src->private;
+		pattern_attr = src->private;
 
 		entry->descriptor.dsal = pattern_attr->pattern;
 		entry->descriptor.dsat = TSI148_LCSR_DSAT_TYP_PAT;
@@ -1663,7 +1663,7 @@ int tsi148_dma_list_add(struct vme_dma_list *list, struct vme_dma_attr *src,
 
 		break;
 	case VME_DMA_PCI:
-		pci_attr = (struct vme_dma_pci *)src->private;
+		pci_attr = src->private;
 
 		reg_split((unsigned long long)pci_attr->address, &address_high,
 			&address_low);
@@ -1672,7 +1672,7 @@ int tsi148_dma_list_add(struct vme_dma_list *list, struct vme_dma_attr *src,
 		entry->descriptor.dsat = TSI148_LCSR_DSAT_TYP_PCI;
 		break;
 	case VME_DMA_VME:
-		vme_attr = (struct vme_dma_vme *)src->private;
+		vme_attr = src->private;
 
 		reg_split((unsigned long long)vme_attr->address, &address_high,
 			&address_low);
@@ -1701,7 +1701,7 @@ int tsi148_dma_list_add(struct vme_dma_list *list, struct vme_dma_attr *src,
 	/* Fill out destination part */
 	switch (dest->type) {
 	case VME_DMA_PCI:
-		pci_attr = (struct vme_dma_pci *)dest->private;
+		pci_attr = dest->private;
 
 		reg_split((unsigned long long)pci_attr->address, &address_high,
 			&address_low);
@@ -1710,7 +1710,7 @@ int tsi148_dma_list_add(struct vme_dma_list *list, struct vme_dma_attr *src,
 		entry->descriptor.ddat = TSI148_LCSR_DDAT_TYP_PCI;
 		break;
 	case VME_DMA_VME:
-		vme_attr = (struct vme_dma_vme *)dest->private;
+		vme_attr = dest->private;
 
 		reg_split((unsigned long long)vme_attr->address, &address_high,
 			&address_low);
-- 
1.7.0.4

