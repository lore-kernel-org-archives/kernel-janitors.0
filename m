From: Eric Sesterhenn / snakebyte <snakebyte@gmx.de>
Date: Thu, 26 Jan 2006 00:00:43 +0000
Subject: [KJ] [Patch 8/9] BUG_ON() Conversion in md/raid6main.c
Message-Id: <1138233643.7232.45.camel@alice>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============042333310413638081=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============042333310413638081==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi,

this changes if() BUG(); constructs to BUG_ON() which is
cleaner and can better optimized away

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.16-rc1-git4/drivers/md/raid6main.c.orig	2006-01-26 00:30:19.000000000 +0100
+++ linux-2.6.16-rc1-git4/drivers/md/raid6main.c	2006-01-26 00:32:31.000000000 +0100
@@ -91,10 +91,8 @@ static void print_raid6_conf (raid6_conf
 static void __release_stripe(raid6_conf_t *conf, struct stripe_head *sh)
 {
 	if (atomic_dec_and_test(&sh->count)) {
-		if (!list_empty(&sh->lru))
-			BUG();
-		if (atomic_read(&conf->active_stripes)==0)
-			BUG();
+		BUG_ON(!list_empty(&sh->lru));
+		BUG_ON(atomic_read(&conf->active_stripes)==0);
 		if (test_bit(STRIPE_HANDLE, &sh->state)) {
 			if (test_bit(STRIPE_DELAYED, &sh->state))
 				list_add_tail(&sh->lru, &conf->delayed_list);
@@ -202,10 +200,8 @@ static void init_stripe(struct stripe_he
 	raid6_conf_t *conf = sh->raid_conf;
 	int disks = conf->raid_disks, i;
 
-	if (atomic_read(&sh->count) != 0)
-		BUG();
-	if (test_bit(STRIPE_HANDLE, &sh->state))
-		BUG();
+	BUG_ON(atomic_read(&sh->count) != 0);
+	BUG_ON(test_bit(STRIPE_HANDLE, &sh->state));
 
 	CHECK_DEVLOCK();
 	PRINTK("init_stripe called, stripe %llu\n",
@@ -283,13 +279,11 @@ static struct stripe_head *get_active_st
 				init_stripe(sh, sector, pd_idx);
 		} else {
 			if (atomic_read(&sh->count)) {
-				if (!list_empty(&sh->lru))
-					BUG();
+				BUG_ON(!list_empty(&sh->lru));
 			} else {
 				if (!test_bit(STRIPE_HANDLE, &sh->state))
 					atomic_inc(&conf->active_stripes);
-				if (list_empty(&sh->lru))
-					BUG();
+				BUG_ON(list_empty(&sh->lru));
 				list_del_init(&sh->lru);
 			}
 		}
@@ -348,8 +342,7 @@ static void shrink_stripes(raid6_conf_t 
 		spin_unlock_irq(&conf->device_lock);
 		if (!sh)
 			break;
-		if (atomic_read(&sh->count))
-			BUG();
+		BUG_ON(atomic_read(&sh->count));
 		shrink_buffers(sh, conf->raid_disks);
 		kmem_cache_free(conf->slab_cache, sh);
 		atomic_dec(&conf->active_stripes);
@@ -767,7 +760,7 @@ static void compute_parity(struct stripe
 				if (test_and_clear_bit(R5_Overlap, &sh->dev[i].flags))
 					wake_up(&conf->wait_for_overlap);
 
-				if (sh->dev[i].written) BUG();
+				BUG_ON(sh->dev[i].written);
 				sh->dev[i].written = chosen;
 			}
 		break;
@@ -957,8 +950,7 @@ static int add_stripe_bio(struct stripe_
 	if (*bip && (*bip)->bi_sector < bi->bi_sector + ((bi->bi_size)>>9))
 		goto overlap;
 
-	if (*bip && bi->bi_next && (*bip) != bi->bi_next)
-		BUG();
+	BUG_ON(*bip && bi->bi_next && (*bip) != bi->bi_next);
 	if (*bip)
 		bi->bi_next = *bip;
 	*bip = bi;
@@ -1893,8 +1885,7 @@ static void raid6d (mddev_t *mddev)
 
 		list_del_init(first);
 		atomic_inc(&sh->count);
-		if (atomic_read(&sh->count)!= 1)
-			BUG();
+		BUG_ON(atomic_read(&sh->count)!= 1);
 		spin_unlock_irq(&conf->device_lock);
 
 		handled++;



--===============042333310413638081==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============042333310413638081==--
