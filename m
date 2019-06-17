From: "Enrico Weigelt, metux IT consult" <info@metux.net>
Date: Mon, 17 Jun 2019 20:15:01 +0000
Subject: [PATCH] lib: devres: devm_ioremap_resource() make res parameter const
Message-Id: <1560802501-26956-1-git-send-email-info@metux.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

devm_ioremap_resource() doesn't change the passed struct resource,
so it can be a const pointer.

Now, calls sites w/ fixed resources can declare them static.
(in some cases possibly even __initconst)

Signed-off-by: Enrico Weigelt <info@metux.net>
---
 include/linux/device.h | 3 ++-
 lib/devres.c           | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/include/linux/device.h b/include/linux/device.h
index 848fc71..4a295e3 100644
--- a/include/linux/device.h
+++ b/include/linux/device.h
@@ -704,7 +704,8 @@ extern unsigned long devm_get_free_pages(struct device *dev,
 					 gfp_t gfp_mask, unsigned int order);
 extern void devm_free_pages(struct device *dev, unsigned long addr);
 
-void __iomem *devm_ioremap_resource(struct device *dev, struct resource *res);
+void __iomem *devm_ioremap_resource(struct device *dev,
+				    const struct resource *res);
 
 void __iomem *devm_of_iomap(struct device *dev,
 			    struct device_node *node, int index,
diff --git a/lib/devres.c b/lib/devres.c
index 69bed2f..6a0e9bd 100644
--- a/lib/devres.c
+++ b/lib/devres.c
@@ -131,7 +131,8 @@ void devm_iounmap(struct device *dev, void __iomem *addr)
  *	if (IS_ERR(base))
  *		return PTR_ERR(base);
  */
-void __iomem *devm_ioremap_resource(struct device *dev, struct resource *res)
+void __iomem *devm_ioremap_resource(struct device *dev,
+				    const struct resource *res)
 {
 	resource_size_t size;
 	void __iomem *dest_ptr;
-- 
1.9.1
