From: Eric Sesterhenn <snakebyte@gmx.de>
Date: Wed, 06 Sep 2006 21:27:49 +0000
Subject: [KJ] [Patch] BUG_ON cleanup for drivers/md/
Message-Id: <1157578069.17421.1.camel@alice>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

hi,

this changes two if() BUG(); usages to BUG_ON(); so people
can disable it safely.

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.18-rc6/drivers/md/md.c.orig	2006-09-06 23:22:07.000000000 +0200
+++ linux-2.6.18-rc6/drivers/md/md.c	2006-09-06 23:22:17.000000000 +0200
@@ -4476,8 +4476,7 @@ static int md_release(struct inode *inod
 {
  	mddev_t *mddev = inode->i_bdev->bd_disk->private_data;
 
-	if (!mddev)
-		BUG();
+	BUG_ON(!mddev);
 	mddev_put(mddev);
 
 	return 0;
--- linux-2.6.18-rc6/drivers/md/raid5.c.orig	2006-09-06 23:19:40.000000000 +0200
+++ linux-2.6.18-rc6/drivers/md/raid5.c	2006-09-06 23:20:52.000000000 +0200
@@ -1108,7 +1108,7 @@ static void compute_parity6(struct strip
 				if (test_and_clear_bit(R5_Overlap, &sh->dev[i].flags))
 					wake_up(&conf->wait_for_overlap);
 
-				if (sh->dev[i].written) BUG();
+				BUG_ON(sh->dev[i].written);
 				sh->dev[i].written = chosen;
 			}
 		break;


_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
