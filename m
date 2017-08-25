From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 25 Aug 2017 15:59:01 +0000
Subject: [PATCH 04/14] vme: Adjust 48 checks for null pointers
Message-Id: <b941205e-1070-f0af-a484-8d5c43b0dcd1@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <7ab4be89-4aa6-5537-9839-da090635f249@users.sourceforge.net>
In-Reply-To: <7ab4be89-4aa6-5537-9839-da090635f249@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: devel@driverdev.osuosl.org, Aaron Sierra <asierra@xes-inc.com>, Alessio Igor Bogani <alessio.bogani@elettra.eu>, Arnd Bergmann <arnd@arndb.de>, Augusto Mecking Caringi <augustocaringi@gmail.com>, Baoyou Xie <baoyou.xie@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Manohar Vanga <manohar.vanga@gmail.com>, Martyn Welch <martyn@welchs.me.uk>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 24 Aug 2017 22:24:38 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The script “checkpatch.pl” pointed information out like the following.

Comparison to NULL could be written …

Thus fix the affected source code places.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/vme/vme.c | 101 ++++++++++++++++++++++++++----------------------------
 1 file changed, 48 insertions(+), 53 deletions(-)

diff --git a/drivers/vme/vme.c b/drivers/vme/vme.c
index d890410e472d..a2e36e6a0d84 100644
--- a/drivers/vme/vme.c
+++ b/drivers/vme/vme.c
@@ -92,23 +92,23 @@ void *vme_alloc_consistent(struct vme_resource *resource, size_t size,
 {
 	struct vme_bridge *bridge;
 
-	if (resource = NULL) {
+	if (!resource) {
 		printk(KERN_ERR "No resource\n");
 		return NULL;
 	}
 
 	bridge = find_bridge(resource);
-	if (bridge = NULL) {
+	if (!bridge) {
 		printk(KERN_ERR "Can't find bridge\n");
 		return NULL;
 	}
 
-	if (bridge->parent = NULL) {
+	if (!bridge->parent) {
 		printk(KERN_ERR "Dev entry NULL for bridge %s\n", bridge->name);
 		return NULL;
 	}
 
-	if (bridge->alloc_consistent = NULL) {
+	if (!bridge->alloc_consistent) {
 		printk(KERN_ERR "alloc_consistent not supported by bridge %s\n",
 		       bridge->name);
 		return NULL;
@@ -132,23 +132,23 @@ void vme_free_consistent(struct vme_resource *resource, size_t size,
 {
 	struct vme_bridge *bridge;
 
-	if (resource = NULL) {
+	if (!resource) {
 		printk(KERN_ERR "No resource\n");
 		return;
 	}
 
 	bridge = find_bridge(resource);
-	if (bridge = NULL) {
+	if (!bridge) {
 		printk(KERN_ERR "Can't find bridge\n");
 		return;
 	}
 
-	if (bridge->parent = NULL) {
+	if (!bridge->parent) {
 		printk(KERN_ERR "Dev entry NULL for bridge %s\n", bridge->name);
 		return;
 	}
 
-	if (bridge->free_consistent = NULL) {
+	if (!bridge->free_consistent) {
 		printk(KERN_ERR "free_consistent not supported by bridge %s\n",
 		       bridge->name);
 		return;
@@ -303,7 +303,7 @@ struct vme_resource *vme_slave_request(struct vme_dev *vdev, u32 address,
 	struct vme_resource *resource = NULL;
 
 	bridge = vdev->bridge;
-	if (bridge = NULL) {
+	if (!bridge) {
 		printk(KERN_ERR "Can't find VME bus\n");
 		goto err_bus;
 	}
@@ -313,7 +313,7 @@ struct vme_resource *vme_slave_request(struct vme_dev *vdev, u32 address,
 		slave_image = list_entry(slave_pos,
 			struct vme_slave_resource, list);
 
-		if (slave_image = NULL) {
+		if (!slave_image) {
 			printk(KERN_ERR "Registered NULL Slave resource\n");
 			continue;
 		}
@@ -333,7 +333,7 @@ struct vme_resource *vme_slave_request(struct vme_dev *vdev, u32 address,
 	}
 
 	/* No free image */
-	if (allocated_image = NULL)
+	if (!allocated_image)
 		goto err_image;
 
 	resource = kmalloc(sizeof(*resource), GFP_KERNEL);
@@ -388,7 +388,7 @@ int vme_slave_set(struct vme_resource *resource, int enabled,
 
 	image = list_entry(resource->entry, struct vme_slave_resource, list);
 
-	if (bridge->slave_set = NULL) {
+	if (!bridge->slave_set) {
 		printk(KERN_ERR "Function not supported\n");
 		return -ENOSYS;
 	}
@@ -437,7 +437,7 @@ int vme_slave_get(struct vme_resource *resource, int *enabled,
 
 	image = list_entry(resource->entry, struct vme_slave_resource, list);
 
-	if (bridge->slave_get = NULL) {
+	if (!bridge->slave_get) {
 		printk(KERN_ERR "vme_slave_get not supported\n");
 		return -EINVAL;
 	}
@@ -464,7 +464,7 @@ void vme_slave_free(struct vme_resource *resource)
 
 	slave_image = list_entry(resource->entry, struct vme_slave_resource,
 		list);
-	if (slave_image = NULL) {
+	if (!slave_image) {
 		printk(KERN_ERR "Can't find slave resource\n");
 		return;
 	}
@@ -504,7 +504,7 @@ struct vme_resource *vme_master_request(struct vme_dev *vdev, u32 address,
 	struct vme_resource *resource = NULL;
 
 	bridge = vdev->bridge;
-	if (bridge = NULL) {
+	if (!bridge) {
 		printk(KERN_ERR "Can't find VME bus\n");
 		goto err_bus;
 	}
@@ -514,7 +514,7 @@ struct vme_resource *vme_master_request(struct vme_dev *vdev, u32 address,
 		master_image = list_entry(master_pos,
 			struct vme_master_resource, list);
 
-		if (master_image = NULL) {
+		if (!master_image) {
 			printk(KERN_WARNING "Registered NULL master resource\n");
 			continue;
 		}
@@ -535,7 +535,7 @@ struct vme_resource *vme_master_request(struct vme_dev *vdev, u32 address,
 	}
 
 	/* Check to see if we found a resource */
-	if (allocated_image = NULL) {
+	if (!allocated_image) {
 		printk(KERN_ERR "Can't find a suitable resource\n");
 		goto err_image;
 	}
@@ -592,7 +592,7 @@ int vme_master_set(struct vme_resource *resource, int enabled,
 
 	image = list_entry(resource->entry, struct vme_master_resource, list);
 
-	if (bridge->master_set = NULL) {
+	if (!bridge->master_set) {
 		printk(KERN_WARNING "vme_master_set not supported\n");
 		return -EINVAL;
 	}
@@ -642,7 +642,7 @@ int vme_master_get(struct vme_resource *resource, int *enabled,
 
 	image = list_entry(resource->entry, struct vme_master_resource, list);
 
-	if (bridge->master_get = NULL) {
+	if (!bridge->master_get) {
 		printk(KERN_WARNING "%s not supported\n", __func__);
 		return -EINVAL;
 	}
@@ -674,7 +674,7 @@ ssize_t vme_master_read(struct vme_resource *resource, void *buf, size_t count,
 	struct vme_master_resource *image;
 	size_t length;
 
-	if (bridge->master_read = NULL) {
+	if (!bridge->master_read) {
 		printk(KERN_WARNING "Reading from resource not supported\n");
 		return -EINVAL;
 	}
@@ -723,7 +723,7 @@ ssize_t vme_master_write(struct vme_resource *resource, void *buf,
 	struct vme_master_resource *image;
 	size_t length;
 
-	if (bridge->master_write = NULL) {
+	if (!bridge->master_write) {
 		printk(KERN_WARNING "Writing to resource not supported\n");
 		return -EINVAL;
 	}
@@ -774,7 +774,7 @@ unsigned int vme_master_rmw(struct vme_resource *resource, unsigned int mask,
 	struct vme_bridge *bridge = find_bridge(resource);
 	struct vme_master_resource *image;
 
-	if (bridge->master_rmw = NULL) {
+	if (!bridge->master_rmw) {
 		printk(KERN_WARNING "Writing to resource not supported\n");
 		return -EINVAL;
 	}
@@ -844,7 +844,7 @@ void vme_master_free(struct vme_resource *resource)
 
 	master_image = list_entry(resource->entry, struct vme_master_resource,
 		list);
-	if (master_image = NULL) {
+	if (!master_image) {
 		printk(KERN_ERR "Can't find master resource\n");
 		return;
 	}
@@ -884,7 +884,7 @@ struct vme_resource *vme_dma_request(struct vme_dev *vdev, u32 route)
 	printk(KERN_ERR "No VME resource Attribute tests done\n");
 
 	bridge = vdev->bridge;
-	if (bridge = NULL) {
+	if (!bridge) {
 		printk(KERN_ERR "Can't find VME bus\n");
 		goto err_bus;
 	}
@@ -893,8 +893,7 @@ struct vme_resource *vme_dma_request(struct vme_dev *vdev, u32 route)
 	list_for_each(dma_pos, &bridge->dma_resources) {
 		dma_ctrlr = list_entry(dma_pos,
 			struct vme_dma_resource, list);
-
-		if (dma_ctrlr = NULL) {
+		if (!dma_ctrlr) {
 			printk(KERN_ERR "Registered NULL DMA resource\n");
 			continue;
 		}
@@ -913,7 +912,7 @@ struct vme_resource *vme_dma_request(struct vme_dev *vdev, u32 route)
 	}
 
 	/* Check to see if we found a resource */
-	if (allocated_ctrlr = NULL)
+	if (!allocated_ctrlr)
 		goto err_ctrlr;
 
 	resource = kmalloc(sizeof(*resource), GFP_KERNEL);
@@ -1128,7 +1127,7 @@ int vme_dma_list_add(struct vme_dma_list *list, struct vme_dma_attr *src,
 	struct vme_bridge *bridge = list->parent->parent;
 	int retval;
 
-	if (bridge->dma_list_add = NULL) {
+	if (!bridge->dma_list_add) {
 		printk(KERN_WARNING "Link List DMA generation not supported\n");
 		return -EINVAL;
 	}
@@ -1161,7 +1160,7 @@ int vme_dma_list_exec(struct vme_dma_list *list)
 	struct vme_bridge *bridge = list->parent->parent;
 	int retval;
 
-	if (bridge->dma_list_exec = NULL) {
+	if (!bridge->dma_list_exec) {
 		printk(KERN_ERR "Link List DMA execution not supported\n");
 		return -EINVAL;
 	}
@@ -1190,7 +1189,7 @@ int vme_dma_list_free(struct vme_dma_list *list)
 	struct vme_bridge *bridge = list->parent->parent;
 	int retval;
 
-	if (bridge->dma_list_empty = NULL) {
+	if (!bridge->dma_list_empty) {
 		printk(KERN_WARNING "Emptying of Link Lists not supported\n");
 		return -EINVAL;
 	}
@@ -1322,8 +1321,7 @@ void vme_irq_handler(struct vme_bridge *bridge, int level, int statid)
 
 	call = bridge->irq[level - 1].callback[statid].func;
 	priv_data = bridge->irq[level - 1].callback[statid].priv_data;
-
-	if (call != NULL)
+	if (call)
 		call(level, statid, priv_data);
 	else
 		printk(KERN_WARNING "Spurious VME interrupt, level:%x, vector:%x\n",
@@ -1354,7 +1352,7 @@ int vme_irq_request(struct vme_dev *vdev, int level, int statid,
 	struct vme_bridge *bridge;
 
 	bridge = vdev->bridge;
-	if (bridge = NULL) {
+	if (!bridge) {
 		printk(KERN_ERR "Can't find VME bus\n");
 		return -EINVAL;
 	}
@@ -1364,7 +1362,7 @@ int vme_irq_request(struct vme_dev *vdev, int level, int statid,
 		return -EINVAL;
 	}
 
-	if (bridge->irq_set = NULL) {
+	if (!bridge->irq_set) {
 		printk(KERN_ERR "Configuring interrupts not supported\n");
 		return -EINVAL;
 	}
@@ -1403,7 +1401,7 @@ void vme_irq_free(struct vme_dev *vdev, int level, int statid)
 	struct vme_bridge *bridge;
 
 	bridge = vdev->bridge;
-	if (bridge = NULL) {
+	if (!bridge) {
 		printk(KERN_ERR "Can't find VME bus\n");
 		return;
 	}
@@ -1413,7 +1411,7 @@ void vme_irq_free(struct vme_dev *vdev, int level, int statid)
 		return;
 	}
 
-	if (bridge->irq_set = NULL) {
+	if (!bridge->irq_set) {
 		printk(KERN_ERR "Configuring interrupts not supported\n");
 		return;
 	}
@@ -1450,7 +1448,7 @@ int vme_irq_generate(struct vme_dev *vdev, int level, int statid)
 	struct vme_bridge *bridge;
 
 	bridge = vdev->bridge;
-	if (bridge = NULL) {
+	if (!bridge) {
 		printk(KERN_ERR "Can't find VME bus\n");
 		return -EINVAL;
 	}
@@ -1460,7 +1458,7 @@ int vme_irq_generate(struct vme_dev *vdev, int level, int statid)
 		return -EINVAL;
 	}
 
-	if (bridge->irq_generate = NULL) {
+	if (!bridge->irq_generate) {
 		printk(KERN_WARNING "Interrupt generation not supported\n");
 		return -EINVAL;
 	}
@@ -1488,7 +1486,7 @@ struct vme_resource *vme_lm_request(struct vme_dev *vdev)
 	struct vme_resource *resource = NULL;
 
 	bridge = vdev->bridge;
-	if (bridge = NULL) {
+	if (!bridge) {
 		printk(KERN_ERR "Can't find VME bus\n");
 		goto err_bus;
 	}
@@ -1497,8 +1495,7 @@ struct vme_resource *vme_lm_request(struct vme_dev *vdev)
 	list_for_each(lm_pos, &bridge->lm_resources) {
 		lm = list_entry(lm_pos,
 			struct vme_lm_resource, list);
-
-		if (lm = NULL) {
+		if (!lm) {
 			printk(KERN_ERR "Registered NULL Location Monitor resource\n");
 			continue;
 		}
@@ -1515,7 +1512,7 @@ struct vme_resource *vme_lm_request(struct vme_dev *vdev)
 	}
 
 	/* Check to see if we found a resource */
-	if (allocated_lm = NULL)
+	if (!allocated_lm)
 		goto err_lm;
 
 	resource = kmalloc(sizeof(*resource), GFP_KERNEL);
@@ -1591,7 +1588,7 @@ int vme_lm_set(struct vme_resource *resource, unsigned long long lm_base,
 
 	lm = list_entry(resource->entry, struct vme_lm_resource, list);
 
-	if (bridge->lm_set = NULL) {
+	if (!bridge->lm_set) {
 		printk(KERN_ERR "vme_lm_set not supported\n");
 		return -EINVAL;
 	}
@@ -1627,7 +1624,7 @@ int vme_lm_get(struct vme_resource *resource, unsigned long long *lm_base,
 
 	lm = list_entry(resource->entry, struct vme_lm_resource, list);
 
-	if (bridge->lm_get = NULL) {
+	if (!bridge->lm_get) {
 		printk(KERN_ERR "vme_lm_get not supported\n");
 		return -EINVAL;
 	}
@@ -1664,7 +1661,7 @@ int vme_lm_attach(struct vme_resource *resource, int monitor,
 
 	lm = list_entry(resource->entry, struct vme_lm_resource, list);
 
-	if (bridge->lm_attach = NULL) {
+	if (!bridge->lm_attach) {
 		printk(KERN_ERR "vme_lm_attach not supported\n");
 		return -EINVAL;
 	}
@@ -1697,7 +1694,7 @@ int vme_lm_detach(struct vme_resource *resource, int monitor)
 
 	lm = list_entry(resource->entry, struct vme_lm_resource, list);
 
-	if (bridge->lm_detach = NULL) {
+	if (!bridge->lm_detach) {
 		printk(KERN_ERR "vme_lm_detach not supported\n");
 		return -EINVAL;
 	}
@@ -1759,12 +1756,12 @@ int vme_slot_num(struct vme_dev *vdev)
 	struct vme_bridge *bridge;
 
 	bridge = vdev->bridge;
-	if (bridge = NULL) {
+	if (!bridge) {
 		printk(KERN_ERR "Can't find VME bus\n");
 		return -EINVAL;
 	}
 
-	if (bridge->slot_get = NULL) {
+	if (!bridge->slot_get) {
 		printk(KERN_WARNING "vme_slot_num not supported\n");
 		return -EINVAL;
 	}
@@ -1787,7 +1784,7 @@ int vme_bus_num(struct vme_dev *vdev)
 	struct vme_bridge *bridge;
 
 	bridge = vdev->bridge;
-	if (bridge = NULL) {
+	if (!bridge) {
 		pr_err("Can't find VME bus\n");
 		return -EINVAL;
 	}
@@ -2004,8 +2001,7 @@ static int vme_bus_probe(struct device *dev)
 	struct vme_dev *vdev = dev_to_vme_dev(dev);
 
 	driver = dev->platform_data;
-
-	if (driver->probe != NULL)
+	if (driver->probe)
 		retval = driver->probe(vdev);
 
 	return retval;
@@ -2018,8 +2014,7 @@ static int vme_bus_remove(struct device *dev)
 	struct vme_dev *vdev = dev_to_vme_dev(dev);
 
 	driver = dev->platform_data;
-
-	if (driver->remove != NULL)
+	if (driver->remove)
 		retval = driver->remove(vdev);
 
 	return retval;
-- 
2.14.0

