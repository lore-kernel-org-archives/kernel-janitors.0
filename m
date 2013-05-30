From: Emil Goode <emilgoode@gmail.com>
Date: Thu, 30 May 2013 15:00:36 +0000
Subject: [PATCH] mtd: lantiq-flash: Convert to devm_kzalloc
Message-Id: <1369926036-2416-1-git-send-email-emilgoode@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dwmw2@infradead.org, artem.bityutskiy@linux.intel.com, wfp5p@virginia.edu, gregkh@linuxfoundation.org, thierry.reding@avionic-design.de
Cc: kernel-janitors@vger.kernel.org, Emil Goode <emilgoode@gmail.com>, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org

The ltq_mtd_probe function is missing some error handling for
memory allocation failure. This patch fixes that and simplifies
the code by converting to devm_kzalloc.

Signed-off-by: Emil Goode <emilgoode@gmail.com>
---
 drivers/mtd/maps/lantiq-flash.c |   31 +++++++++++++++----------------
 1 file changed, 15 insertions(+), 16 deletions(-)

diff --git a/drivers/mtd/maps/lantiq-flash.c b/drivers/mtd/maps/lantiq-flash.c
index d7ac65d..de0ac1e 100644
--- a/drivers/mtd/maps/lantiq-flash.c
+++ b/drivers/mtd/maps/lantiq-flash.c
@@ -123,24 +123,28 @@ ltq_mtd_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
-	ltq_mtd = kzalloc(sizeof(struct ltq_mtd), GFP_KERNEL);
+	ltq_mtd = devm_kzalloc(&pdev->dev, sizeof(struct ltq_mtd), GFP_KERNEL);
+	if (!ltq_mtd)
+		return -ENOMEM;
+
 	platform_set_drvdata(pdev, ltq_mtd);
 
 	ltq_mtd->res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	if (!ltq_mtd->res) {
 		dev_err(&pdev->dev, "failed to get memory resource\n");
-		err = -ENOENT;
-		goto err_out;
+		return -ENOENT;
 	}
 
-	ltq_mtd->map = kzalloc(sizeof(struct map_info), GFP_KERNEL);
+	ltq_mtd->map = devm_kzalloc(&pdev->dev, sizeof(struct map_info),
+				    GFP_KERNEL);
+	if (!ltq_mtd->map)
+		return -ENOMEM;
+
 	ltq_mtd->map->phys = ltq_mtd->res->start;
 	ltq_mtd->map->size = resource_size(ltq_mtd->res);
 	ltq_mtd->map->virt = devm_ioremap_resource(&pdev->dev, ltq_mtd->res);
-	if (IS_ERR(ltq_mtd->map->virt)) {
-		err = PTR_ERR(ltq_mtd->map->virt);
-		goto err_out;
-	}
+	if (IS_ERR(ltq_mtd->map->virt))
+		return PTR_ERR(ltq_mtd->map->virt);
 
 	ltq_mtd->map->name = ltq_map_name;
 	ltq_mtd->map->bankwidth = 2;
@@ -155,8 +159,7 @@ ltq_mtd_probe(struct platform_device *pdev)
 
 	if (!ltq_mtd->mtd) {
 		dev_err(&pdev->dev, "probing failed\n");
-		err = -ENXIO;
-		goto err_free;
+		return -ENXIO;
 	}
 
 	ltq_mtd->mtd->owner = THIS_MODULE;
@@ -177,10 +180,7 @@ ltq_mtd_probe(struct platform_device *pdev)
 
 err_destroy:
 	map_destroy(ltq_mtd->mtd);
-err_free:
-	kfree(ltq_mtd->map);
-err_out:
-	kfree(ltq_mtd);
+
 	return err;
 }
 
@@ -194,9 +194,8 @@ ltq_mtd_remove(struct platform_device *pdev)
 			mtd_device_unregister(ltq_mtd->mtd);
 			map_destroy(ltq_mtd->mtd);
 		}
-		kfree(ltq_mtd->map);
-		kfree(ltq_mtd);
 	}
+
 	return 0;
 }
 
-- 
1.7.10.4

