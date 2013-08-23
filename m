From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 23 Aug 2013 09:51:45 +0000
Subject: [patch] mtd cs553x_nand: use kzalloc() instead of memset
Message-Id: <20130823095145.GQ31293@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Woodhouse <dwmw2@infradead.org>
Cc: Mike Dunn <mikedunn@newsguy.com>, Artem Bityutskiy <artem.bityutskiy@linux.intel.com>, kernel-janitors@vger.kernel.org, Nathan Williams <nathan@traverse.com.au>, linux-mtd@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>

It's cleaner to use kzalloc() instead of zeroing out in a separate call
to memset().

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/mtd/nand/cs553x_nand.c b/drivers/mtd/nand/cs553x_nand.c
index 2cdeab8..d469a9a 100644
--- a/drivers/mtd/nand/cs553x_nand.c
+++ b/drivers/mtd/nand/cs553x_nand.c
@@ -197,7 +197,7 @@ static int __init cs553x_init_one(int cs, int mmio, unsigned long adr)
 	}
 
 	/* Allocate memory for MTD device structure and private data */
-	new_mtd = kmalloc(sizeof(struct mtd_info) + sizeof(struct nand_chip), GFP_KERNEL);
+	new_mtd = kzalloc(sizeof(struct mtd_info) + sizeof(struct nand_chip), GFP_KERNEL);
 	if (!new_mtd) {
 		printk(KERN_WARNING "Unable to allocate CS553X NAND MTD device structure.\n");
 		err = -ENOMEM;
@@ -207,10 +207,6 @@ static int __init cs553x_init_one(int cs, int mmio, unsigned long adr)
 	/* Get pointer to private data */
 	this = (struct nand_chip *)(&new_mtd[1]);
 
-	/* Initialize structures */
-	memset(new_mtd, 0, sizeof(struct mtd_info));
-	memset(this, 0, sizeof(struct nand_chip));
-
 	/* Link the private data with the MTD structure */
 	new_mtd->priv = this;
 	new_mtd->owner = THIS_MODULE;
