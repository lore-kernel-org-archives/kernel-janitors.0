From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 25 Aug 2017 15:53:42 +0000
Subject: [PATCH 02/14] vme: Improve 11 size determinations
Message-Id: <9bb89ee2-c21e-3f0c-aaa3-ba1c24066140@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <7ab4be89-4aa6-5537-9839-da090635f249@users.sourceforge.net>
In-Reply-To: <7ab4be89-4aa6-5537-9839-da090635f249@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: devel@driverdev.osuosl.org, Aaron Sierra <asierra@xes-inc.com>, Alessio Igor Bogani <alessio.bogani@elettra.eu>, Arnd Bergmann <arnd@arndb.de>, Augusto Mecking Caringi <augustocaringi@gmail.com>, Baoyou Xie <baoyou.xie@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Manohar Vanga <manohar.vanga@gmail.com>, Martyn Welch <martyn@welchs.me.uk>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 24 Aug 2017 21:52:00 +0200

Replace the specification of data structures by pointer dereferences
as the parameter for the operator "sizeof" to make the corresponding size
determination a bit safer according to the Linux coding style convention.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/vme/vme.c | 25 ++++++++++++-------------
 1 file changed, 12 insertions(+), 13 deletions(-)

diff --git a/drivers/vme/vme.c b/drivers/vme/vme.c
index 53e87af8e0b8..1afddf5eafd4 100644
--- a/drivers/vme/vme.c
+++ b/drivers/vme/vme.c
@@ -337,4 +337,4 @@ struct vme_resource *vme_slave_request(struct vme_dev *vdev, u32 address,
 		goto err_image;
 
-	resource = kmalloc(sizeof(struct vme_resource), GFP_KERNEL);
+	resource = kmalloc(sizeof(*resource), GFP_KERNEL);
 	if (!resource)
@@ -540,5 +540,5 @@ struct vme_resource *vme_master_request(struct vme_dev *vdev, u32 address,
 		goto err_image;
 	}
 
-	resource = kmalloc(sizeof(struct vme_resource), GFP_KERNEL);
+	resource = kmalloc(sizeof(*resource), GFP_KERNEL);
 	if (!resource)
@@ -917,4 +917,4 @@ struct vme_resource *vme_dma_request(struct vme_dev *vdev, u32 route)
 		goto err_ctrlr;
 
-	resource = kmalloc(sizeof(struct vme_resource), GFP_KERNEL);
+	resource = kmalloc(sizeof(*resource), GFP_KERNEL);
 	if (!resource)
@@ -958,5 +958,5 @@ struct vme_dma_list *vme_new_dma_list(struct vme_resource *resource)
 
 	ctrlr = list_entry(resource->entry, struct vme_dma_resource, list);
 
-	dma_list = kmalloc(sizeof(struct vme_dma_list), GFP_KERNEL);
+	dma_list = kmalloc(sizeof(*dma_list), GFP_KERNEL);
 	if (!dma_list)
@@ -986,9 +986,9 @@ struct vme_dma_attr *vme_dma_pattern_attribute(u32 pattern, u32 type)
 	struct vme_dma_attr *attributes;
 	struct vme_dma_pattern *pattern_attr;
 
-	attributes = kmalloc(sizeof(struct vme_dma_attr), GFP_KERNEL);
+	attributes = kmalloc(sizeof(*attributes), GFP_KERNEL);
 	if (!attributes)
 		goto err_attr;
 
-	pattern_attr = kmalloc(sizeof(struct vme_dma_pattern), GFP_KERNEL);
+	pattern_attr = kmalloc(sizeof(*pattern_attr), GFP_KERNEL);
 	if (!pattern_attr)
@@ -1026,9 +1026,9 @@ struct vme_dma_attr *vme_dma_pci_attribute(dma_addr_t address)
 
 	/* XXX Run some sanity checks here */
 
-	attributes = kmalloc(sizeof(struct vme_dma_attr), GFP_KERNEL);
+	attributes = kmalloc(sizeof(*attributes), GFP_KERNEL);
 	if (!attributes)
 		goto err_attr;
 
-	pci_attr = kmalloc(sizeof(struct vme_dma_pci), GFP_KERNEL);
+	pci_attr = kmalloc(sizeof(*pci_attr), GFP_KERNEL);
 	if (!pci_attr)
@@ -1067,10 +1067,9 @@ struct vme_dma_attr *vme_dma_vme_attribute(unsigned long long address,
 	struct vme_dma_attr *attributes;
 	struct vme_dma_vme *vme_attr;
 
-	attributes = kmalloc(
-		sizeof(struct vme_dma_attr), GFP_KERNEL);
+	attributes = kmalloc(sizeof(*attributes), GFP_KERNEL);
 	if (!attributes)
 		goto err_attr;
 
-	vme_attr = kmalloc(sizeof(struct vme_dma_vme), GFP_KERNEL);
+	vme_attr = kmalloc(sizeof(*vme_attr), GFP_KERNEL);
 	if (!vme_attr)
@@ -1521,4 +1520,4 @@ struct vme_resource *vme_lm_request(struct vme_dev *vdev)
 		goto err_lm;
 
-	resource = kmalloc(sizeof(struct vme_resource), GFP_KERNEL);
+	resource = kmalloc(sizeof(*resource), GFP_KERNEL);
 	if (!resource)
@@ -1869,5 +1868,5 @@ static int __vme_register_driver_bus(struct vme_driver *drv,
 	struct vme_dev *tmp;
 
 	for (i = 0; i < ndevs; i++) {
-		vdev = kzalloc(sizeof(struct vme_dev), GFP_KERNEL);
+		vdev = kzalloc(sizeof(*vdev), GFP_KERNEL);
 		if (!vdev) {
-- 
2.14.0

