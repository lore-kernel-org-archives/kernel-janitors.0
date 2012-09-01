From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sat, 01 Sep 2012 16:33:08 +0000
Subject: [PATCH 1/4] drivers/spi/spi-sh-hspi.c: drop frees of devm_ alloc'd data
Message-Id: <1346517191-8794-2-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1346517191-8794-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1346517191-8794-1-git-send-email-Julia.Lawall-L2FTfq7BK8M@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org
Cc: spi-devel-general-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

From: Julia Lawall <Julia.Lawall@lip6.fr>

devm free functions should not have to be explicitly used.

A semantic match that finds this problem is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@
@@

(
* devm_kfree(...);
|
* devm_free_irq(...);
|
* devm_iounmap(...);
|
* devm_release_region(...);
|
* devm_release_mem_region(...);
)
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/spi/spi-sh-hspi.c |    5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/spi/spi-sh-hspi.c b/drivers/spi/spi-sh-hspi.c
index 934138c..796c077 100644
--- a/drivers/spi/spi-sh-hspi.c
+++ b/drivers/spi/spi-sh-hspi.c
@@ -283,7 +283,7 @@ static int __devinit hspi_probe(struct platform_device *pdev)
 	ret = spi_register_master(master);
 	if (ret < 0) {
 		dev_err(&pdev->dev, "spi_register_master error.\n");
-		goto error2;
+		goto error1;
 	}
 
 	pm_runtime_enable(&pdev->dev);
@@ -292,8 +292,6 @@ static int __devinit hspi_probe(struct platform_device *pdev)
 
 	return 0;
 
- error2:
-	devm_iounmap(hspi->dev, hspi->addr);
  error1:
 	clk_put(clk);
  error0:
@@ -310,7 +308,6 @@ static int __devexit hspi_remove(struct platform_device *pdev)
 
 	clk_put(hspi->clk);
 	spi_unregister_master(hspi->master);
-	devm_iounmap(hspi->dev, hspi->addr);
 
 	return 0;
 }

