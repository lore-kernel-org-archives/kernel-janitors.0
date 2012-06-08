From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 08 Jun 2012 12:31:28 +0000
Subject: [patch -resend] drbd: fix resync_dump_detail() output
Message-Id: <20120608123128.GA18293@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lars Ellenberg <drbd-dev@lists.linbit.com>
Cc: drbd-user@lists.linbit.com, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

The tests here aren't correct.  It should be doing a shift before doing
the bitwise AND.  (bme->flags & BME_NO_WRITES) is always false and
(bme->flags & BME_LOCKED) checks for BME_NO_WRITES instead of checking
for locked.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
I sent this to the drbd-user list in March, but never recieved a
response.

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
 
