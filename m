From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sat, 17 May 2014 06:32:48 +0000
Subject: [PATCH 1/2] mtd: delete unneeded call to platform_get_drvdata
Message-Id: <1400308369-24375-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Woodhouse <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>

Platform_get_drvdata is an accessor function, and has no purpose if its
result is not used.

The semantic patch that fixes this problem is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@
identifier x;
type T;
@@
- T x = platform_get_drvdata(...);
... when != x
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/mtd/nand/bf5xx_nand.c |    4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/mtd/nand/bf5xx_nand.c b/drivers/mtd/nand/bf5xx_nand.c
index b7a2494..b5fbd48 100644
--- a/drivers/mtd/nand/bf5xx_nand.c
+++ b/drivers/mtd/nand/bf5xx_nand.c
@@ -840,15 +840,11 @@ out_err_kzalloc:
 
 static int bf5xx_nand_suspend(struct platform_device *dev, pm_message_t pm)
 {
-	struct bf5xx_nand_info *info = platform_get_drvdata(dev);
-
 	return 0;
 }
 
 static int bf5xx_nand_resume(struct platform_device *dev)
 {
-	struct bf5xx_nand_info *info = platform_get_drvdata(dev);
-
 	return 0;
 }
 

