From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 25 Aug 2017 16:17:07 +0000
Subject: [PATCH 14/14] vme: tsi148: Adjust 14 checks for null pointers
Message-Id: <cd35605c-e52d-ef65-e105-5e0bc24f4ce4@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <7ab4be89-4aa6-5537-9839-da090635f249@users.sourceforge.net>
In-Reply-To: <7ab4be89-4aa6-5537-9839-da090635f249@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: devel@driverdev.osuosl.org, Aaron Sierra <asierra@xes-inc.com>, Alessio Igor Bogani <alessio.bogani@elettra.eu>, Arnd Bergmann <arnd@arndb.de>, Augusto Mecking Caringi <augustocaringi@gmail.com>, Baoyou Xie <baoyou.xie@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Manohar Vanga <manohar.vanga@gmail.com>, Martyn Welch <martyn@welchs.me.uk>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 25 Aug 2017 12:00:17 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The script “checkpatch.pl” pointed information out like the following.

Comparison to NULL could be written …

Thus fix the affected source code places.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/vme/bridges/vme_tsi148.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/vme/bridges/vme_tsi148.c b/drivers/vme/bridges/vme_tsi148.c
index 61946f5d356f..cba9514605b7 100644
--- a/drivers/vme/bridges/vme_tsi148.c
+++ b/drivers/vme/bridges/vme_tsi148.c
@@ -748,9 +748,9 @@ static int tsi148_alloc_resource(struct vme_master_resource *image,
 	if (size = 0)
 		return 0;
 
-	if (image->bus_resource.name = NULL) {
+	if (!image->bus_resource.name) {
 		image->bus_resource.name = kmalloc(VMENAMSIZ+3, GFP_ATOMIC);
-		if (image->bus_resource.name = NULL) {
+		if (!image->bus_resource.name) {
 			retval = -ENOMEM;
 			goto err_name;
 		}
@@ -776,7 +776,7 @@ static int tsi148_alloc_resource(struct vme_master_resource *image,
 
 	image->kern_base = ioremap_nocache(
 		image->bus_resource.start, size);
-	if (image->kern_base = NULL) {
+	if (!image->kern_base) {
 		dev_err(tsi148_bridge->parent, "Failed to remap resource\n");
 		retval = -ENOMEM;
 		goto err_remap;
@@ -1640,7 +1640,7 @@ static int tsi148_dma_list_add(struct vme_dma_list *list,
 
 	/* Descriptor must be aligned on 64-bit boundaries */
 	entry = kmalloc(sizeof(*entry), GFP_KERNEL);
-	if (entry = NULL) {
+	if (!entry) {
 		retval = -ENOMEM;
 		goto err_mem;
 	}
@@ -1943,7 +1943,7 @@ static int tsi148_lm_set(struct vme_lm_resource *lm, unsigned long long lm_base,
 
 	/* If we already have a callback attached, we can't move it! */
 	for (i = 0; i < lm->monitors; i++) {
-		if (bridge->lm_callback[i] != NULL) {
+		if (bridge->lm_callback[i]) {
 			mutex_unlock(&lm->mtx);
 			dev_err(tsi148_bridge->parent, "Location monitor "
 				"callback attached, can't reset\n");
@@ -2068,7 +2068,7 @@ static int tsi148_lm_attach(struct vme_lm_resource *lm, int monitor,
 	}
 
 	/* Check that a callback isn't already attached */
-	if (bridge->lm_callback[monitor] != NULL) {
+	if (bridge->lm_callback[monitor]) {
 		mutex_unlock(&lm->mtx);
 		dev_err(tsi148_bridge->parent, "Existing callback attached\n");
 		return -EBUSY;
@@ -2205,7 +2205,7 @@ static int tsi148_crcsr_init(struct vme_bridge *tsi148_bridge,
 	/* Allocate mem for CR/CSR image */
 	bridge->crcsr_kernel = pci_zalloc_consistent(pdev, VME_CRCSR_BUF_SIZE,
 						     &bridge->crcsr_bus);
-	if (bridge->crcsr_kernel = NULL) {
+	if (!bridge->crcsr_kernel) {
 		dev_err(tsi148_bridge->parent, "Failed to allocate memory for "
 			"CR/CSR image\n");
 		return -ENOMEM;
@@ -2292,14 +2292,14 @@ static int tsi148_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	 * dynamically generate this so we get one per device
 	 */
 	tsi148_bridge = kzalloc(sizeof(*tsi148_bridge), GFP_KERNEL);
-	if (tsi148_bridge = NULL) {
+	if (!tsi148_bridge) {
 		retval = -ENOMEM;
 		goto err_struct;
 	}
 	vme_init_bridge(tsi148_bridge);
 
 	tsi148_device = kzalloc(sizeof(*tsi148_device), GFP_KERNEL);
-	if (tsi148_device = NULL) {
+	if (!tsi148_device) {
 		retval = -ENOMEM;
 		goto err_driver;
 	}
@@ -2365,7 +2365,7 @@ static int tsi148_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 
 		tsi148_device->flush_image  			kmalloc(sizeof(*tsi148_device->flush_image), GFP_KERNEL);
-		if (tsi148_device->flush_image = NULL) {
+		if (!tsi148_device->flush_image) {
 			retval = -ENOMEM;
 			goto err_master;
 		}
@@ -2381,7 +2381,7 @@ static int tsi148_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	/* Add master windows to list */
 	for (i = 0; i < master_num; i++) {
 		master_image = kmalloc(sizeof(*master_image), GFP_KERNEL);
-		if (master_image = NULL) {
+		if (!master_image) {
 			retval = -ENOMEM;
 			goto err_master;
 		}
@@ -2407,7 +2407,7 @@ static int tsi148_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	/* Add slave windows to list */
 	for (i = 0; i < TSI148_MAX_SLAVE; i++) {
 		slave_image = kmalloc(sizeof(*slave_image), GFP_KERNEL);
-		if (slave_image = NULL) {
+		if (!slave_image) {
 			retval = -ENOMEM;
 			goto err_slave;
 		}
@@ -2428,7 +2428,7 @@ static int tsi148_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	/* Add dma engines to list */
 	for (i = 0; i < TSI148_MAX_DMA; i++) {
 		dma_ctrlr = kmalloc(sizeof(*dma_ctrlr), GFP_KERNEL);
-		if (dma_ctrlr = NULL) {
+		if (!dma_ctrlr) {
 			retval = -ENOMEM;
 			goto err_dma;
 		}
@@ -2448,7 +2448,7 @@ static int tsi148_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 
 	/* Add location monitor to list */
 	lm = kmalloc(sizeof(*lm), GFP_KERNEL);
-	if (lm = NULL) {
+	if (!lm) {
 		retval = -ENOMEM;
 		goto err_lm;
 	}
-- 
2.14.0

