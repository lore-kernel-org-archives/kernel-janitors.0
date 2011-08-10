From: Julia Lawall <julia@diku.dk>
Date: Wed, 10 Aug 2011 06:02:14 +0000
Subject: [PATCH v2] drivers/mtd/nand/bcm_umi_nand.c: add missing kfree/iounmap
Message-Id: <1312956134-27553-1-git-send-email-julia@diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jiandong Zheng <jdzheng@broadcom.com>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Scott Branden <sbranden@broadcom.com>

From: Julia Lawall <julia@diku.dk>

Add kfree and iounmap systematically in all error handling code, including
under #if.

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/mtd/nand/bcm_umi_nand.c |   11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/bcm_umi_nand.c b/drivers/mtd/nand/bcm_umi_nand.c
index a8ae898..8cb567b 100644
--- a/drivers/mtd/nand/bcm_umi_nand.c
+++ b/drivers/mtd/nand/bcm_umi_nand.c
@@ -374,8 +374,10 @@ static int __devinit bcm_umi_nand_probe(struct platform_device *pdev)
 
 	r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 
-	if (!r)
+	if (!r) {
+		kfree(board_mtd);
 		return -ENXIO;
+	}
 
 	/* map physical address */
 	bcm_umi_io_base = ioremap(r->start, resource_size(r));
@@ -433,8 +435,11 @@ static int __devinit bcm_umi_nand_probe(struct platform_device *pdev)
 
 #if USE_DMA
 	err = nand_dma_init();
-	if (err != 0)
+	if (err != 0) {
+		iounmap(bcm_umi_io_base);
+		kfree(board_mtd);
 		return err;
+	}
 #endif
 
 	/* Figure out the size of the device that we have.
@@ -466,6 +471,8 @@ static int __devinit bcm_umi_nand_probe(struct platform_device *pdev)
 		{
 			printk(KERN_ERR "NAND - Unrecognized pagesize: %d\n",
 					 board_mtd->writesize);
+			iounmap(bcm_umi_io_base);
+			kfree(board_mtd);
 			return -EINVAL;
 		}
 	}

