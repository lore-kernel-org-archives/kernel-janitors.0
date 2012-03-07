From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 07 Mar 2012 10:03:01 +0000
Subject: [patch] drbd: fix resync_dump_detail() output
Message-Id: <20120307100301.GC25452@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

The tests here aren't correct.  It should be doing a shift before doing
the bitwise AND.  (bme->flags & BME_NO_WRITES) is always false and
(bme->flags & BME_LOCKED) checks for BME_NO_WRITES instead of checking
for locked.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/block/drbd/drbd_proc.c b/drivers/block/drbd/drbd_proc.c
index 2959cdf..ffe1ee4 100644
--- a/drivers/block/drbd/drbd_proc.c
+++ b/drivers/block/drbd/drbd_proc.c
@@ -187,8 +187,10 @@ static void resync_dump_detail(struct seq_file *seq, struct lc_element *e)
 	struct bm_extent *bme = lc_entry(e, struct bm_extent, lce);
 
 	seq_printf(seq, "%5d %s %s\n", bme->rs_left,
-		   bme->flags & BME_NO_WRITES ? "NO_WRITES" : "---------",
-		   bme->flags & BME_LOCKED ? "LOCKED" : "------"
+		   test_bit(BME_NO_WRITES, &bme->flags) ?
+			"NO_WRITES" : "---------",
+		   test_bit(BME_LOCKED, &bme->flags) ?
+			"LOCKED" : "------"
 		   );
 }
 
