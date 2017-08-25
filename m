From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 25 Aug 2017 16:10:44 +0000
Subject: [PATCH 11/14] vme: ca91cx42: Adjust 14 checks for null pointers
Message-Id: <cc24a523-312c-7ede-c000-e4dea1a7547b@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <7ab4be89-4aa6-5537-9839-da090635f249@users.sourceforge.net>
In-Reply-To: <7ab4be89-4aa6-5537-9839-da090635f249@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: devel@driverdev.osuosl.org, Aaron Sierra <asierra@xes-inc.com>, Alessio Igor Bogani <alessio.bogani@elettra.eu>, Arnd Bergmann <arnd@arndb.de>, Augusto Mecking Caringi <augustocaringi@gmail.com>, Baoyou Xie <baoyou.xie@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Manohar Vanga <manohar.vanga@gmail.com>, Martyn Welch <martyn@welchs.me.uk>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 25 Aug 2017 11:01:29 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The script “checkpatch.pl” pointed information out like the following.

Comparison to NULL could be written …

Thus fix the affected source code places.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/vme/bridges/vme_ca91cx42.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/vme/bridges/vme_ca91cx42.c b/drivers/vme/bridges/vme_ca91cx42.c
index 61990c7f4543..5dd284008630 100644
--- a/drivers/vme/bridges/vme_ca91cx42.c
+++ b/drivers/vme/bridges/vme_ca91cx42.c
@@ -511,7 +511,7 @@ static int ca91cx42_alloc_resource(struct vme_master_resource *image,
 	ca91cx42_bridge = image->parent;
 
 	/* Find pci_dev container of dev */
-	if (ca91cx42_bridge->parent = NULL) {
+	if (!ca91cx42_bridge->parent) {
 		dev_err(ca91cx42_bridge->parent, "Dev entry NULL\n");
 		return -EINVAL;
 	}
@@ -532,9 +532,9 @@ static int ca91cx42_alloc_resource(struct vme_master_resource *image,
 		memset(&image->bus_resource, 0, sizeof(image->bus_resource));
 	}
 
-	if (image->bus_resource.name = NULL) {
+	if (!image->bus_resource.name) {
 		image->bus_resource.name = kmalloc(VMENAMSIZ+3, GFP_ATOMIC);
-		if (image->bus_resource.name = NULL) {
+		if (!image->bus_resource.name) {
 			retval = -ENOMEM;
 			goto err_name;
 		}
@@ -560,7 +560,7 @@ static int ca91cx42_alloc_resource(struct vme_master_resource *image,
 
 	image->kern_base = ioremap_nocache(
 		image->bus_resource.start, size);
-	if (image->kern_base = NULL) {
+	if (!image->kern_base) {
 		dev_err(ca91cx42_bridge->parent, "Failed to remap resource\n");
 		retval = -ENOMEM;
 		goto err_remap;
@@ -1035,7 +1035,7 @@ static int ca91cx42_dma_list_add(struct vme_dma_list *list,
 
 	/* XXX descriptor must be aligned on 64-bit boundaries */
 	entry = kmalloc(sizeof(*entry), GFP_KERNEL);
-	if (entry = NULL) {
+	if (!entry) {
 		retval = -ENOMEM;
 		goto err_mem;
 	}
@@ -1319,7 +1319,7 @@ static int ca91cx42_lm_set(struct vme_lm_resource *lm,
 
 	/* If we already have a callback attached, we can't move it! */
 	for (i = 0; i < lm->monitors; i++) {
-		if (bridge->lm_callback[i] != NULL) {
+		if (bridge->lm_callback[i]) {
 			mutex_unlock(&lm->mtx);
 			dev_err(dev, "Location monitor callback attached, "
 				"can't reset\n");
@@ -1428,7 +1428,7 @@ static int ca91cx42_lm_attach(struct vme_lm_resource *lm, int monitor,
 	}
 
 	/* Check that a callback isn't already attached */
-	if (bridge->lm_callback[monitor] != NULL) {
+	if (bridge->lm_callback[monitor]) {
 		mutex_unlock(&lm->mtx);
 		dev_err(dev, "Existing callback attached\n");
 		return -EBUSY;
@@ -1563,7 +1563,7 @@ static int ca91cx42_crcsr_init(struct vme_bridge *ca91cx42_bridge,
 	/* Allocate mem for CR/CSR image */
 	bridge->crcsr_kernel = pci_zalloc_consistent(pdev, VME_CRCSR_BUF_SIZE,
 						     &bridge->crcsr_bus);
-	if (bridge->crcsr_kernel = NULL) {
+	if (!bridge->crcsr_kernel) {
 		dev_err(&pdev->dev, "Failed to allocate memory for CR/CSR "
 			"image\n");
 		return -ENOMEM;
@@ -1615,14 +1615,14 @@ static int ca91cx42_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	 * dynamically allocate the bridge structure
 	 */
 	ca91cx42_bridge = kzalloc(sizeof(*ca91cx42_bridge), GFP_KERNEL);
-	if (ca91cx42_bridge = NULL) {
+	if (!ca91cx42_bridge) {
 		retval = -ENOMEM;
 		goto err_struct;
 	}
 	vme_init_bridge(ca91cx42_bridge);
 
 	ca91cx42_device = kzalloc(sizeof(*ca91cx42_device), GFP_KERNEL);
-	if (ca91cx42_device = NULL) {
+	if (!ca91cx42_device) {
 		retval = -ENOMEM;
 		goto err_driver;
 	}
@@ -1679,7 +1679,7 @@ static int ca91cx42_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	/* Add master windows to list */
 	for (i = 0; i < CA91C142_MAX_MASTER; i++) {
 		master_image = kmalloc(sizeof(*master_image), GFP_KERNEL);
-		if (master_image = NULL) {
+		if (!master_image) {
 			retval = -ENOMEM;
 			goto err_master;
 		}
@@ -1702,7 +1702,7 @@ static int ca91cx42_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	/* Add slave windows to list */
 	for (i = 0; i < CA91C142_MAX_SLAVE; i++) {
 		slave_image = kmalloc(sizeof(*slave_image), GFP_KERNEL);
-		if (slave_image = NULL) {
+		if (!slave_image) {
 			retval = -ENOMEM;
 			goto err_slave;
 		}
@@ -1726,7 +1726,7 @@ static int ca91cx42_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	/* Add dma engines to list */
 	for (i = 0; i < CA91C142_MAX_DMA; i++) {
 		dma_ctrlr = kmalloc(sizeof(*dma_ctrlr), GFP_KERNEL);
-		if (dma_ctrlr = NULL) {
+		if (!dma_ctrlr) {
 			retval = -ENOMEM;
 			goto err_dma;
 		}
@@ -1744,7 +1744,7 @@ static int ca91cx42_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 
 	/* Add location monitor to list */
 	lm = kmalloc(sizeof(*lm), GFP_KERNEL);
-	if (lm = NULL) {
+	if (!lm) {
 		retval = -ENOMEM;
 		goto err_lm;
 	}
-- 
2.14.0

