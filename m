From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 12 Mar 2018 15:31:04 +0000
Subject: [PATCH] altera_edac: Use common error handling code in altr_sdram_probe()
Message-Id: <f2f6b789-f262-f6cc-743f-244d4870c70e@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-edac@vger.kernel.org, Borislav Petkov <bp@alien8.de>, Mauro Carvalho Chehab <mchehab@kernel.org>, Thor Thayer <thor.thayer@linux.intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 12 Mar 2018 16:23:53 +0100

Add a jump target so that a specific error code is assigned to the
local variable "res" at the end of this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/edac/altera_edac.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/edac/altera_edac.c b/drivers/edac/altera_edac.c
index 11d6419788c2..d5c15b27d520 100644
--- a/drivers/edac/altera_edac.c
+++ b/drivers/edac/altera_edac.c
@@ -419,8 +419,7 @@ static int altr_sdram_probe(struct platform_device *pdev)
 		if (res < 0) {
 			edac_mc_printk(mci, KERN_ERR,
 				       "Unable to request irq %d\n", irq2);
-			res = -ENODEV;
-			goto err2;
+			goto e_nodev;
 		}
 
 		res = a10_unmask_irq(pdev, A10_DDR0_IRQ_MASK);
@@ -435,8 +434,7 @@ static int altr_sdram_probe(struct platform_device *pdev)
 	if (res < 0) {
 		edac_mc_printk(mci, KERN_ERR,
 			       "Unable to request irq %d\n", irq);
-		res = -ENODEV;
-		goto err2;
+		goto e_nodev;
 	}
 
 	/* Infrastructure ready - enable the IRQ */
@@ -444,8 +442,7 @@ static int altr_sdram_probe(struct platform_device *pdev)
 			       priv->ecc_irq_en_mask, priv->ecc_irq_en_mask)) {
 		edac_mc_printk(mci, KERN_ERR,
 			       "Error enabling SDRAM ECC IRQ\n");
-		res = -ENODEV;
-		goto err2;
+		goto e_nodev;
 	}
 
 	altr_sdr_mc_create_debugfs_nodes(mci);
@@ -454,6 +451,8 @@ static int altr_sdram_probe(struct platform_device *pdev)
 
 	return 0;
 
+e_nodev:
+	res = -ENODEV;
 err2:
 	edac_mc_del_mc(&pdev->dev);
 err:
-- 
2.16.2

