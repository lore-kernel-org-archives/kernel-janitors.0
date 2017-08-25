From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 25 Aug 2017 15:51:52 +0000
Subject: [PATCH 01/14] vme: Delete 11 error messages for a failed memory allocation
Message-Id: <e2383a24-fbff-ea98-ee64-9177715c0616@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <7ab4be89-4aa6-5537-9839-da090635f249@users.sourceforge.net>
In-Reply-To: <7ab4be89-4aa6-5537-9839-da090635f249@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: devel@driverdev.osuosl.org, Aaron Sierra <asierra@xes-inc.com>, Alessio Igor Bogani <alessio.bogani@elettra.eu>, Arnd Bergmann <arnd@arndb.de>, Augusto Mecking Caringi <augustocaringi@gmail.com>, Baoyou Xie <baoyou.xie@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Manohar Vanga <manohar.vanga@gmail.com>, Martyn Welch <martyn@welchs.me.uk>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 24 Aug 2017 21:38:20 +0200

Omit extra messages for a memory allocation failure in these functions.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/vme/vme.c | 51 ++++++++++++++++-----------------------------------
 1 file changed, 16 insertions(+), 35 deletions(-)

diff --git a/drivers/vme/vme.c b/drivers/vme/vme.c
index 6a3ead42aba8..53e87af8e0b8 100644
--- a/drivers/vme/vme.c
+++ b/drivers/vme/vme.c
@@ -340,7 +340,6 @@ struct vme_resource *vme_slave_request(struct vme_dev *vdev, u32 address,
-	if (resource = NULL) {
-		printk(KERN_WARNING "Unable to allocate resource structure\n");
+	if (!resource)
 		goto err_alloc;
-	}
+
 	resource->type = VME_SLAVE;
 	resource->entry = &allocated_image->list;
 
@@ -545,7 +544,6 @@ struct vme_resource *vme_master_request(struct vme_dev *vdev, u32 address,
-	if (resource = NULL) {
-		printk(KERN_ERR "Unable to allocate resource structure\n");
+	if (!resource)
 		goto err_alloc;
-	}
+
 	resource->type = VME_MASTER;
 	resource->entry = &allocated_image->list;
 
@@ -922,7 +920,6 @@ struct vme_resource *vme_dma_request(struct vme_dev *vdev, u32 route)
-	if (resource = NULL) {
-		printk(KERN_WARNING "Unable to allocate resource structure\n");
+	if (!resource)
 		goto err_alloc;
-	}
+
 	resource->type = VME_DMA;
 	resource->entry = &allocated_ctrlr->list;
 
@@ -965,7 +962,6 @@ struct vme_dma_list *vme_new_dma_list(struct vme_resource *resource)
-	if (dma_list = NULL) {
-		printk(KERN_ERR "Unable to allocate memory for new DMA list\n");
+	if (!dma_list)
 		return NULL;
-	}
+
 	INIT_LIST_HEAD(&dma_list->entries);
 	dma_list->parent = ctrlr;
 	mutex_init(&dma_list->mtx);
@@ -994,13 +990,9 @@ struct vme_dma_attr *vme_dma_pattern_attribute(u32 pattern, u32 type)
-	if (attributes = NULL) {
-		printk(KERN_ERR "Unable to allocate memory for attributes structure\n");
+	if (!attributes)
 		goto err_attr;
-	}
 
 	pattern_attr = kmalloc(sizeof(struct vme_dma_pattern), GFP_KERNEL);
-	if (pattern_attr = NULL) {
-		printk(KERN_ERR "Unable to allocate memory for pattern attributes\n");
+	if (!pattern_attr)
 		goto err_pat;
-	}
 
 	attributes->type = VME_DMA_PATTERN;
 	attributes->private = (void *)pattern_attr;
@@ -1038,15 +1030,9 @@ struct vme_dma_attr *vme_dma_pci_attribute(dma_addr_t address)
-	if (attributes = NULL) {
-		printk(KERN_ERR "Unable to allocate memory for attributes structure\n");
+	if (!attributes)
 		goto err_attr;
-	}
 
 	pci_attr = kmalloc(sizeof(struct vme_dma_pci), GFP_KERNEL);
-	if (pci_attr = NULL) {
-		printk(KERN_ERR "Unable to allocate memory for PCI attributes\n");
+	if (!pci_attr)
 		goto err_pci;
-	}
-
-
 
 	attributes->type = VME_DMA_PCI;
 	attributes->private = (void *)pci_attr;
@@ -1086,13 +1072,9 @@ struct vme_dma_attr *vme_dma_vme_attribute(unsigned long long address,
-	if (attributes = NULL) {
-		printk(KERN_ERR "Unable to allocate memory for attributes structure\n");
+	if (!attributes)
 		goto err_attr;
-	}
 
 	vme_attr = kmalloc(sizeof(struct vme_dma_vme), GFP_KERNEL);
-	if (vme_attr = NULL) {
-		printk(KERN_ERR "Unable to allocate memory for VME attributes\n");
+	if (!vme_attr)
 		goto err_vme;
-	}
 
 	attributes->type = VME_DMA_VME;
 	attributes->private = (void *)vme_attr;
@@ -1542,7 +1524,6 @@ struct vme_resource *vme_lm_request(struct vme_dev *vdev)
-	if (resource = NULL) {
-		printk(KERN_ERR "Unable to allocate resource structure\n");
+	if (!resource)
 		goto err_alloc;
-	}
+
 	resource->type = VME_LM;
 	resource->entry = &allocated_lm->list;
 
-- 
2.14.0

