From: Julia Lawall <julia@diku.dk>
Date: Mon, 26 Dec 2011 17:38:01 +0000
Subject: [PATCH 2/2] drivers/mtd/maps/lantiq-flash.c: drop iounmap for devm_ allocated data
Message-Id: <1324921081-13161-2-git-send-email-julia@diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Woodhouse <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

Data allocated with devm_ioremap or devm_ioremap_nocache should not be
freed using iounmap, because doing so causes a dangling pointer, and a
subsequent double free.

The semantic match that finds this problem is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@r@
expression x;
@@
(
 x = devm_ioremap(...)
|
 x = devm_ioremap_nocache(...)
)

@@
expression r.x;
@@
* iounmap(x)
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/mtd/maps/lantiq-flash.c |    6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/mtd/maps/lantiq-flash.c b/drivers/mtd/maps/lantiq-flash.c
index 4f10e27..7b889de 100644
--- a/drivers/mtd/maps/lantiq-flash.c
+++ b/drivers/mtd/maps/lantiq-flash.c
@@ -159,7 +159,7 @@ ltq_mtd_probe(struct platform_device *pdev)
 	if (!ltq_mtd->mtd) {
 		dev_err(&pdev->dev, "probing failed\n");
 		err = -ENXIO;
-		goto err_unmap;
+		goto err_free;
 	}
 
 	ltq_mtd->mtd->owner = THIS_MODULE;
@@ -179,8 +179,6 @@ ltq_mtd_probe(struct platform_device *pdev)
 
 err_destroy:
 	map_destroy(ltq_mtd->mtd);
-err_unmap:
-	iounmap(ltq_mtd->map->virt);
 err_free:
 	kfree(ltq_mtd->map);
 err_out:
@@ -198,8 +196,6 @@ ltq_mtd_remove(struct platform_device *pdev)
 			mtd_device_unregister(ltq_mtd->mtd);
 			map_destroy(ltq_mtd->mtd);
 		}
-		if (ltq_mtd->map->virt)
-			iounmap(ltq_mtd->map->virt);
 		kfree(ltq_mtd->map);
 		kfree(ltq_mtd);
 	}

