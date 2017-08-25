From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 25 Aug 2017 16:15:08 +0000
Subject: [PATCH 13/14] vme: tsi148: Improve 17 size determinations
Message-Id: <1cb8956d-2862-9f64-d19c-32b4a797a3b1@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <7ab4be89-4aa6-5537-9839-da090635f249@users.sourceforge.net>
In-Reply-To: <7ab4be89-4aa6-5537-9839-da090635f249@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: devel@driverdev.osuosl.org, Aaron Sierra <asierra@xes-inc.com>, Alessio Igor Bogani <alessio.bogani@elettra.eu>, Arnd Bergmann <arnd@arndb.de>, Augusto Mecking Caringi <augustocaringi@gmail.com>, Baoyou Xie <baoyou.xie@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Manohar Vanga <manohar.vanga@gmail.com>, Martyn Welch <martyn@welchs.me.uk>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 25 Aug 2017 11:55:03 +0200

Replace the specification of data structures by variable references
as the parameter for the operator "sizeof" to make the corresponding size
determination a bit safer according to the Linux coding style convention.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/vme/bridges/vme_tsi148.c | 36 +++++++++++++++++-------------------
 1 file changed, 17 insertions(+), 19 deletions(-)

diff --git a/drivers/vme/bridges/vme_tsi148.c b/drivers/vme/bridges/vme_tsi148.c
index fb91fddc6312..61946f5d356f 100644
--- a/drivers/vme/bridges/vme_tsi148.c
+++ b/drivers/vme/bridges/vme_tsi148.c
@@ -741,7 +741,7 @@ static int tsi148_alloc_resource(struct vme_master_resource *image,
 		image->kern_base = NULL;
 		kfree(image->bus_resource.name);
 		release_resource(&image->bus_resource);
-		memset(&image->bus_resource, 0, sizeof(struct resource));
+		memset(&image->bus_resource, 0, sizeof(image->bus_resource));
 	}
 
 	/* Exit here if size is zero */
@@ -788,7 +788,7 @@ static int tsi148_alloc_resource(struct vme_master_resource *image,
 	release_resource(&image->bus_resource);
 err_resource:
 	kfree(image->bus_resource.name);
-	memset(&image->bus_resource, 0, sizeof(struct resource));
+	memset(&image->bus_resource, 0, sizeof(image->bus_resource));
 err_name:
 	return retval;
 }
@@ -802,7 +802,7 @@ static void tsi148_free_resource(struct vme_master_resource *image)
 	image->kern_base = NULL;
 	release_resource(&image->bus_resource);
 	kfree(image->bus_resource.name);
-	memset(&image->bus_resource, 0, sizeof(struct resource));
+	memset(&image->bus_resource, 0, sizeof(image->bus_resource));
 }
 
 /*
@@ -1639,5 +1639,5 @@ static int tsi148_dma_list_add(struct vme_dma_list *list,
 	tsi148_bridge = list->parent->parent;
 
 	/* Descriptor must be aligned on 64-bit boundaries */
-	entry = kmalloc(sizeof(struct tsi148_dma_entry), GFP_KERNEL);
+	entry = kmalloc(sizeof(*entry), GFP_KERNEL);
 	if (entry = NULL) {
@@ -1657,7 +1657,7 @@ static int tsi148_dma_list_add(struct vme_dma_list *list,
 	/* Given we are going to fill out the structure, we probably don't
 	 * need to zero it, but better safe than sorry for now.
 	 */
-	memset(&entry->descriptor, 0, sizeof(struct tsi148_dma_descriptor));
+	memset(&entry->descriptor, 0, sizeof(entry->descriptor));
 
 	/* Fill out source part */
 	switch (src->type) {
@@ -1752,8 +1752,9 @@ static int tsi148_dma_list_add(struct vme_dma_list *list,
 	list_add_tail(&entry->list, &list->entries);
 
 	entry->dma_handle = dma_map_single(tsi148_bridge->parent,
-		&entry->descriptor,
-		sizeof(struct tsi148_dma_descriptor), DMA_TO_DEVICE);
+					   &entry->descriptor,
+					   sizeof(entry->descriptor),
+					   DMA_TO_DEVICE);
 	if (dma_mapping_error(tsi148_bridge->parent, entry->dma_handle)) {
 		dev_err(tsi148_bridge->parent, "DMA mapping error\n");
 		retval = -EINVAL;
@@ -2290,12 +2291,12 @@ static int tsi148_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	/* If we want to support more than one of each bridge, we need to
 	 * dynamically generate this so we get one per device
 	 */
-	tsi148_bridge = kzalloc(sizeof(struct vme_bridge), GFP_KERNEL);
+	tsi148_bridge = kzalloc(sizeof(*tsi148_bridge), GFP_KERNEL);
 	if (tsi148_bridge = NULL) {
 		retval = -ENOMEM;
 		goto err_struct;
 	}
 	vme_init_bridge(tsi148_bridge);
 
-	tsi148_device = kzalloc(sizeof(struct tsi148_driver), GFP_KERNEL);
+	tsi148_device = kzalloc(sizeof(*tsi148_device), GFP_KERNEL);
 	if (tsi148_device = NULL) {
@@ -2363,5 +2364,5 @@ static int tsi148_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 		master_num--;
 
 		tsi148_device->flush_image -			kmalloc(sizeof(struct vme_master_resource), GFP_KERNEL);
+			kmalloc(sizeof(*tsi148_device->flush_image), GFP_KERNEL);
 		if (tsi148_device->flush_image = NULL) {
@@ -2373,12 +2374,11 @@ static int tsi148_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 		tsi148_device->flush_image->locked = 1;
 		tsi148_device->flush_image->number = master_num;
 		memset(&tsi148_device->flush_image->bus_resource, 0,
-			sizeof(struct resource));
+		       sizeof(tsi148_device->flush_image->bus_resource));
 		tsi148_device->flush_image->kern_base  = NULL;
 	}
 
 	/* Add master windows to list */
 	for (i = 0; i < master_num; i++) {
-		master_image = kmalloc(sizeof(struct vme_master_resource),
-			GFP_KERNEL);
+		master_image = kmalloc(sizeof(*master_image), GFP_KERNEL);
 		if (master_image = NULL) {
@@ -2398,7 +2398,7 @@ static int tsi148_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 			VME_PROG | VME_DATA;
 		master_image->width_attr = VME_D16 | VME_D32;
 		memset(&master_image->bus_resource, 0,
-			sizeof(struct resource));
+		       sizeof(master_image->bus_resource));
 		master_image->kern_base  = NULL;
 		list_add_tail(&master_image->list,
 			&tsi148_bridge->master_resources);
@@ -2406,6 +2406,5 @@ static int tsi148_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 
 	/* Add slave windows to list */
 	for (i = 0; i < TSI148_MAX_SLAVE; i++) {
-		slave_image = kmalloc(sizeof(struct vme_slave_resource),
-			GFP_KERNEL);
+		slave_image = kmalloc(sizeof(*slave_image), GFP_KERNEL);
 		if (slave_image = NULL) {
@@ -2428,6 +2427,5 @@ static int tsi148_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 
 	/* Add dma engines to list */
 	for (i = 0; i < TSI148_MAX_DMA; i++) {
-		dma_ctrlr = kmalloc(sizeof(struct vme_dma_resource),
-			GFP_KERNEL);
+		dma_ctrlr = kmalloc(sizeof(*dma_ctrlr), GFP_KERNEL);
 		if (dma_ctrlr = NULL) {
@@ -2449,5 +2447,5 @@ static int tsi148_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	}
 
 	/* Add location monitor to list */
-	lm = kmalloc(sizeof(struct vme_lm_resource), GFP_KERNEL);
+	lm = kmalloc(sizeof(*lm), GFP_KERNEL);
 	if (lm = NULL) {
-- 
2.14.0

