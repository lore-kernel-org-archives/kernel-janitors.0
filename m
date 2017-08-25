From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 25 Aug 2017 15:57:19 +0000
Subject: [PATCH 03/14] vme: Move an assignment in vme_new_dma_list()
Message-Id: <296b53ad-dd93-255d-a69a-f48ced245af9@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <7ab4be89-4aa6-5537-9839-da090635f249@users.sourceforge.net>
In-Reply-To: <7ab4be89-4aa6-5537-9839-da090635f249@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: devel@driverdev.osuosl.org, Aaron Sierra <asierra@xes-inc.com>, Alessio Igor Bogani <alessio.bogani@elettra.eu>, Arnd Bergmann <arnd@arndb.de>, Augusto Mecking Caringi <augustocaringi@gmail.com>, Baoyou Xie <baoyou.xie@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Manohar Vanga <manohar.vanga@gmail.com>, Martyn Welch <martyn@welchs.me.uk>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 24 Aug 2017 22:04:45 +0200

Assign a pointer to a data structure member without using an intermediate
local variable.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/vme/vme.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/vme/vme.c b/drivers/vme/vme.c
index 1afddf5eafd4..d890410e472d 100644
--- a/drivers/vme/vme.c
+++ b/drivers/vme/vme.c
@@ -948,7 +948,6 @@ EXPORT_SYMBOL(vme_dma_request);
  */
 struct vme_dma_list *vme_new_dma_list(struct vme_resource *resource)
 {
-	struct vme_dma_resource *ctrlr;
 	struct vme_dma_list *dma_list;
 
 	if (resource->type != VME_DMA) {
@@ -956,14 +955,14 @@ struct vme_dma_list *vme_new_dma_list(struct vme_resource *resource)
 		return NULL;
 	}
 
-	ctrlr = list_entry(resource->entry, struct vme_dma_resource, list);
-
 	dma_list = kmalloc(sizeof(*dma_list), GFP_KERNEL);
 	if (!dma_list)
 		return NULL;
 
 	INIT_LIST_HEAD(&dma_list->entries);
-	dma_list->parent = ctrlr;
+	dma_list->parent = list_entry(resource->entry,
+				      struct vme_dma_resource,
+				      list);
 	mutex_init(&dma_list->mtx);
 
 	return dma_list;
-- 
2.14.0

