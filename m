From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 13 Feb 2014 11:21:44 +0000
Subject: [patch] mtd: remove some duplicative checks
Message-Id: <20140213112144.GD15549@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Woodhouse <dwmw2@infradead.org>
Cc: kernel-janitors@vger.kernel.org, Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org

"rc" is an error code here, no need to check it a second time.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/mtd/rfd_ftl.c b/drivers/mtd/rfd_ftl.c
index 233b946e5d66..d1cbf26db2c0 100644
--- a/drivers/mtd/rfd_ftl.c
+++ b/drivers/mtd/rfd_ftl.c
@@ -602,8 +602,7 @@ static int mark_sector_deleted(struct partition *part, u_long old_addr)
 	if (rc) {
 		printk(KERN_ERR PREFIX "error writing '%s' at "
 			"0x%lx\n", part->mbd.mtd->name, addr);
-		if (rc)
-			goto err;
+		goto err;
 	}
 	if (block = part->current_block)
 		part->header_cache[offset + HEADER_MAP_OFFSET] = del;
@@ -675,8 +674,7 @@ static int do_writesect(struct mtd_blktrans_dev *dev, u_long sector, char *buf,
 	if (rc) {
 		printk(KERN_ERR PREFIX "error writing '%s' at 0x%lx\n",
 				part->mbd.mtd->name, addr);
-		if (rc)
-			goto err;
+		goto err;
 	}
 
 	part->sector_map[sector] = addr;
@@ -695,8 +693,7 @@ static int do_writesect(struct mtd_blktrans_dev *dev, u_long sector, char *buf,
 	if (rc) {
 		printk(KERN_ERR PREFIX "error writing '%s' at 0x%lx\n",
 				part->mbd.mtd->name, addr);
-		if (rc)
-			goto err;
+		goto err;
 	}
 	block->used_sectors++;
 	block->free_sectors--;
