From: Julia Lawall <julia@diku.dk>
Date: Wed, 10 Aug 2011 08:14:14 +0000
Subject: [PATCH v3] drivers/mtd/nand/bcm_umi_nand.c: clean up error handling code
Message-Id: <1312964054-25266-1-git-send-email-julia@diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jiandong Zheng <jdzheng@broadcom.com>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Scott Branden <sbranden@broadcom.com>

From: Julia Lawall <julia@diku.dk>

Convert error handling code to use gotos.  At the same time, this adds
calls to kfree and iounmap in a few cases where they were overlooked.

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/mtd/nand/bcm_umi_nand.c |   33 ++++++++++++++++++---------------
 1 file changed, 18 insertions(+), 15 deletions(-)

diff --git a/drivers/mtd/nand/bcm_umi_nand.c b/drivers/mtd/nand/bcm_umi_nand.c
index a8ae898..46b58d6 100644
--- a/drivers/mtd/nand/bcm_umi_nand.c
+++ b/drivers/mtd/nand/bcm_umi_nand.c
@@ -374,16 +374,18 @@ static int __devinit bcm_umi_nand_probe(struct platform_device *pdev)
 
 	r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 
-	if (!r)
-		return -ENXIO;
+	if (!r) {
+		err = -ENXIO;
+		goto out_free;
+	}
 
 	/* map physical address */
 	bcm_umi_io_base = ioremap(r->start, resource_size(r));
 
 	if (!bcm_umi_io_base) {
 		printk(KERN_ERR "ioremap to access BCM UMI NAND chip failed\n");
-		kfree(board_mtd);
-		return -EIO;
+		err = -EIO;
+		goto out_free;
 	}
 
 	/* Get pointer to private data */
@@ -399,9 +401,8 @@ static int __devinit bcm_umi_nand_probe(struct platform_device *pdev)
 	/* Initialize the NAND hardware.  */
 	if (bcm_umi_nand_inithw() < 0) {
 		printk(KERN_ERR "BCM UMI NAND chip could not be initialized\n");
-		iounmap(bcm_umi_io_base);
-		kfree(board_mtd);
-		return -EIO;
+		err = -EIO;
+		goto out_unmap;
 	}
 
 	/* Set address of NAND IO lines */
@@ -434,7 +435,7 @@ static int __devinit bcm_umi_nand_probe(struct platform_device *pdev)
 #if USE_DMA
 	err = nand_dma_init();
 	if (err != 0)
-		return err;
+		goto out_unmap;
 #endif
 
 	/* Figure out the size of the device that we have.
@@ -445,9 +446,7 @@ static int __devinit bcm_umi_nand_probe(struct platform_device *pdev)
 	err = nand_scan_ident(board_mtd, 1, NULL);
 	if (err) {
 		printk(KERN_ERR "nand_scan failed: %d\n", err);
-		iounmap(bcm_umi_io_base);
-		kfree(board_mtd);
-		return err;
+		goto out_unmap;
 	}
 
 	/* Now that we know the nand size, we can setup the ECC layout */
@@ -466,7 +465,8 @@ static int __devinit bcm_umi_nand_probe(struct platform_device *pdev)
 		{
 			printk(KERN_ERR "NAND - Unrecognized pagesize: %d\n",
 					 board_mtd->writesize);
-			return -EINVAL;
+			err = -EINVAL;
+			goto out_unmap;
 		}
 	}
 
@@ -483,9 +483,7 @@ static int __devinit bcm_umi_nand_probe(struct platform_device *pdev)
 	err = nand_scan_tail(board_mtd);
 	if (err) {
 		printk(KERN_ERR "nand_scan failed: %d\n", err);
-		iounmap(bcm_umi_io_base);
-		kfree(board_mtd);
-		return err;
+		goto out_unmap;
 	}
 
 	/* Register the partitions */
@@ -494,6 +492,11 @@ static int __devinit bcm_umi_nand_probe(struct platform_device *pdev)
 
 	/* Return happy */
 	return 0;
+out_unmap:
+	iounmap(bcm_umi_io_base);
+out_free:
+	kfree(board_mtd);
+	return err;
 }
 
 static int bcm_umi_nand_remove(struct platform_device *pdev)

