From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 14 Jul 2016 10:44:56 +0000
Subject: [patch] mtd: pmcmsp-flash: Allocating too much in init_msp_flash()
Message-Id: <20160714104456.GG18175@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Woodhouse <dwmw2@infradead.org>, Marc St-Jean <stjeanma@pmc-sierra.com>
Cc: Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

There is a cut and paste issue here.  The bug is that we are allocating
more memory than necessary for msp_maps.  We should be allocating enough
space for a map_info struct (144 bytes) but we instead allocate enough
for an mtd_info struct (1840 bytes).  It's a small waste.

The other part of this is not harmful but when we allocated msp_flash
then we allocated enough space fro a map_info pointer instead of an
mtd_info pointer.  But since pointers are the same size it works out
fine.

Anyway, I decided to clean up all three allocations a bit to make them
a bit more consistent and clear.

Fixes: 68aa0fa87f6d ('[MTD] PMC MSP71xx flash/rootfs mappings')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Not tested!!

diff --git a/drivers/mtd/maps/pmcmsp-flash.c b/drivers/mtd/maps/pmcmsp-flash.c
index 744ca5c..f9fa3fa 100644
--- a/drivers/mtd/maps/pmcmsp-flash.c
+++ b/drivers/mtd/maps/pmcmsp-flash.c
@@ -75,15 +75,15 @@ static int __init init_msp_flash(void)
 
 	printk(KERN_NOTICE "Found %d PMC flash devices\n", fcnt);
 
-	msp_flash = kmalloc(fcnt * sizeof(struct map_info *), GFP_KERNEL);
+	msp_flash = kcalloc(fcnt, sizeof(*msp_flash), GFP_KERNEL);
 	if (!msp_flash)
 		return -ENOMEM;
 
-	msp_parts = kmalloc(fcnt * sizeof(struct mtd_partition *), GFP_KERNEL);
+	msp_parts = kcalloc(fcnt, sizeof(*msp_parts), GFP_KERNEL);
 	if (!msp_parts)
 		goto free_msp_flash;
 
-	msp_maps = kcalloc(fcnt, sizeof(struct mtd_info), GFP_KERNEL);
+	msp_maps = kcalloc(fcnt, sizeof(*msp_maps), GFP_KERNEL);
 	if (!msp_maps)
 		goto free_msp_parts;
 
