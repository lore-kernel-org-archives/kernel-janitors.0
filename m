From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 25 Aug 2017 16:08:51 +0000
Subject: [PATCH 10/14] vme: ca91cx42: Improve 12 size determinations
Message-Id: <1c9a63f6-c5c6-8fea-dc3a-c04db2bb095c@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <7ab4be89-4aa6-5537-9839-da090635f249@users.sourceforge.net>
In-Reply-To: <7ab4be89-4aa6-5537-9839-da090635f249@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: devel@driverdev.osuosl.org, Aaron Sierra <asierra@xes-inc.com>, Alessio Igor Bogani <alessio.bogani@elettra.eu>, Arnd Bergmann <arnd@arndb.de>, Augusto Mecking Caringi <augustocaringi@gmail.com>, Baoyou Xie <baoyou.xie@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Manohar Vanga <manohar.vanga@gmail.com>, Martyn Welch <martyn@welchs.me.uk>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 25 Aug 2017 10:56:41 +0200

Replace the specification of data structures by variable references
as the parameter for the operator "sizeof" to make the corresponding size
determination a bit safer according to the Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/vme/bridges/vme_ca91cx42.c | 29 ++++++++++++-----------------
 1 file changed, 12 insertions(+), 17 deletions(-)

diff --git a/drivers/vme/bridges/vme_ca91cx42.c b/drivers/vme/bridges/vme_ca91cx42.c
index d25f997e8aeb..61990c7f4543 100644
--- a/drivers/vme/bridges/vme_ca91cx42.c
+++ b/drivers/vme/bridges/vme_ca91cx42.c
@@ -529,7 +529,7 @@ static int ca91cx42_alloc_resource(struct vme_master_resource *image,
 		image->kern_base = NULL;
 		kfree(image->bus_resource.name);
 		release_resource(&image->bus_resource);
-		memset(&image->bus_resource, 0, sizeof(struct resource));
+		memset(&image->bus_resource, 0, sizeof(image->bus_resource));
 	}
 
 	if (image->bus_resource.name = NULL) {
@@ -572,7 +572,7 @@ static int ca91cx42_alloc_resource(struct vme_master_resource *image,
 	release_resource(&image->bus_resource);
 err_resource:
 	kfree(image->bus_resource.name);
-	memset(&image->bus_resource, 0, sizeof(struct resource));
+	memset(&image->bus_resource, 0, sizeof(image->bus_resource));
 err_name:
 	return retval;
 }
@@ -586,7 +586,7 @@ static void ca91cx42_free_resource(struct vme_master_resource *image)
 	image->kern_base = NULL;
 	release_resource(&image->bus_resource);
 	kfree(image->bus_resource.name);
-	memset(&image->bus_resource, 0, sizeof(struct resource));
+	memset(&image->bus_resource, 0, sizeof(image->bus_resource));
 }
 
 
@@ -1034,5 +1034,5 @@ static int ca91cx42_dma_list_add(struct vme_dma_list *list,
 	dev = list->parent->parent->parent;
 
 	/* XXX descriptor must be aligned on 64-bit boundaries */
-	entry = kmalloc(sizeof(struct ca91cx42_dma_entry), GFP_KERNEL);
+	entry = kmalloc(sizeof(*entry), GFP_KERNEL);
 	if (entry = NULL) {
@@ -1048,7 +1048,7 @@ static int ca91cx42_dma_list_add(struct vme_dma_list *list,
 		goto err_align;
 	}
 
-	memset(&entry->descriptor, 0, sizeof(struct ca91cx42_dma_descriptor));
+	memset(&entry->descriptor, 0, sizeof(entry->descriptor));
 
 	if (dest->type = VME_DMA_VME) {
 		entry->descriptor.dctl |= CA91CX42_DCTL_L2V;
@@ -1614,14 +1614,12 @@ static int ca91cx42_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	/* We want to support more than one of each bridge so we need to
 	 * dynamically allocate the bridge structure
 	 */
-	ca91cx42_bridge = kzalloc(sizeof(struct vme_bridge), GFP_KERNEL);
-
+	ca91cx42_bridge = kzalloc(sizeof(*ca91cx42_bridge), GFP_KERNEL);
 	if (ca91cx42_bridge = NULL) {
 		retval = -ENOMEM;
 		goto err_struct;
 	}
 	vme_init_bridge(ca91cx42_bridge);
 
-	ca91cx42_device = kzalloc(sizeof(struct ca91cx42_driver), GFP_KERNEL);
-
+	ca91cx42_device = kzalloc(sizeof(*ca91cx42_device), GFP_KERNEL);
 	if (ca91cx42_device = NULL) {
@@ -1680,6 +1678,5 @@ static int ca91cx42_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 
 	/* Add master windows to list */
 	for (i = 0; i < CA91C142_MAX_MASTER; i++) {
-		master_image = kmalloc(sizeof(struct vme_master_resource),
-			GFP_KERNEL);
+		master_image = kmalloc(sizeof(*master_image), GFP_KERNEL);
 		if (master_image = NULL) {
@@ -1696,7 +1693,7 @@ static int ca91cx42_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 			VME_SUPER | VME_USER | VME_PROG | VME_DATA;
 		master_image->width_attr = VME_D8 | VME_D16 | VME_D32 | VME_D64;
 		memset(&master_image->bus_resource, 0,
-			sizeof(struct resource));
+		       sizeof(master_image->bus_resource));
 		master_image->kern_base  = NULL;
 		list_add_tail(&master_image->list,
 			&ca91cx42_bridge->master_resources);
@@ -1704,6 +1701,5 @@ static int ca91cx42_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 
 	/* Add slave windows to list */
 	for (i = 0; i < CA91C142_MAX_SLAVE; i++) {
-		slave_image = kmalloc(sizeof(struct vme_slave_resource),
-			GFP_KERNEL);
+		slave_image = kmalloc(sizeof(*slave_image), GFP_KERNEL);
 		if (slave_image = NULL) {
@@ -1729,6 +1725,5 @@ static int ca91cx42_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 
 	/* Add dma engines to list */
 	for (i = 0; i < CA91C142_MAX_DMA; i++) {
-		dma_ctrlr = kmalloc(sizeof(struct vme_dma_resource),
-			GFP_KERNEL);
+		dma_ctrlr = kmalloc(sizeof(*dma_ctrlr), GFP_KERNEL);
 		if (dma_ctrlr = NULL) {
@@ -1748,5 +1743,5 @@ static int ca91cx42_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	}
 
 	/* Add location monitor to list */
-	lm = kmalloc(sizeof(struct vme_lm_resource), GFP_KERNEL);
+	lm = kmalloc(sizeof(*lm), GFP_KERNEL);
 	if (lm = NULL) {
-- 
2.14.0

