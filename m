From: Firo Yang <firogm@gmail.com>
Date: Mon, 08 Jun 2015 06:19:06 +0000
Subject: [PATCH] ARM: pxa: ssp: remove unnessary free for devm_xxx
Message-Id: <1433744346-14095-1-git-send-email-firogm@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

A Coccinelle warning.
It's not necessary to free memory allocated with devm_xxx
and using these free functions maybe lead to a double free that
will corrupt the resource subsys. So, I just remove them.

Signed-off-by: Firo Yang <firogm@gmail.com>
---
 arch/arm/plat-pxa/ssp.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/arch/arm/plat-pxa/ssp.c b/arch/arm/plat-pxa/ssp.c
index ad9529c..f3f1431 100644
--- a/arch/arm/plat-pxa/ssp.c
+++ b/arch/arm/plat-pxa/ssp.c
@@ -239,18 +239,10 @@ static int pxa_ssp_remove(struct platform_device *pdev)
 	if (ssp = NULL)
 		return -ENODEV;
 
-	iounmap(ssp->mmio_base);
-
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	release_mem_region(res->start, resource_size(res));
-
-	clk_put(ssp->clk);
-
 	mutex_lock(&ssp_lock);
 	list_del(&ssp->node);
 	mutex_unlock(&ssp_lock);
 
-	kfree(ssp);
 	return 0;
 }
 
-- 
2.4.2

