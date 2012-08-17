From: emilgoode@gmail.com
Date: Fri, 17 Aug 2012 16:53:26 +0000
Subject: [PATCH] staging: drm/omap: Add error handling
Message-Id: <502e7651.241a700a.4d05.7e27@mx.google.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: gregkh@linuxfoundation.org, rob@ti.com, andy.gross@ti.com, daniel.vetter@ffwll.ch
Cc: devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Emil Goode <emilgoode@gmail.com>

From: Emil Goode <emilgoode@gmail.com>

This patch adds fail checks for kmalloc and kzalloc calls
and also adds a error path that frees allocated pages by
introducing a call to _drm_gem_put_pages.

Signed-off-by: Emil Goode <emilgoode@gmail.com>
---
 drivers/staging/omapdrm/omap_gem.c |   17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/omapdrm/omap_gem.c b/drivers/staging/omapdrm/omap_gem.c
index 74082aa..c828743 100644
--- a/drivers/staging/omapdrm/omap_gem.c
+++ b/drivers/staging/omapdrm/omap_gem.c
@@ -226,7 +226,8 @@ static int omap_gem_attach_pages(struct drm_gem_object *obj)
 	struct drm_device *dev = obj->dev;
 	struct omap_gem_object *omap_obj = to_omap_bo(obj);
 	struct page **pages;
-	int i, npages = obj->size >> PAGE_SHIFT;
+	int npages = obj->size >> PAGE_SHIFT;
+	int i, ret;
 	dma_addr_t *addrs;
 
 	WARN_ON(omap_obj->pages);
@@ -246,18 +247,32 @@ static int omap_gem_attach_pages(struct drm_gem_object *obj)
 	 */
 	if (omap_obj->flags & (OMAP_BO_WC|OMAP_BO_UNCACHED)) {
 		addrs = kmalloc(npages * sizeof(addrs), GFP_KERNEL);
+		if (!addrs) {
+			ret = -ENOMEM;
+			goto free_pages;
+		}
+
 		for (i = 0; i < npages; i++) {
 			addrs[i] = dma_map_page(dev->dev, pages[i],
 					0, PAGE_SIZE, DMA_BIDIRECTIONAL);
 		}
 	} else {
 		addrs = kzalloc(npages * sizeof(addrs), GFP_KERNEL);
+		if (!addrs) {
+			ret = -ENOMEM;
+			goto free_pages;
+		}
 	}
 
 	omap_obj->addrs = addrs;
 	omap_obj->pages = pages;
 
 	return 0;
+
+free_pages:
+	_drm_gem_put_pages(obj, pages, true, false);
+
+	return ret;
 }
 
 /** release backing pages */
-- 
1.7.10.4

