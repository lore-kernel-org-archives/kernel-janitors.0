From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 07 Jan 2017 19:55:23 +0000
Subject: [PATCH 3/9] memstick: Delete unwanted spaces behind three function parameters
Message-Id: <3e11edb7-519f-4cde-f22f-3c6bbdda536c@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <64dfa775-4e4a-bdb0-7b55-41f43ccdf11a@users.sourceforge.net>
In-Reply-To: <64dfa775-4e4a-bdb0-7b55-41f43ccdf11a@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Maxim Levitsky <maximlevitsky@gmail.com>, kernel-janitors@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 7 Jan 2017 18:54:25 +0100

The script "checkpatch.pl" pointed information out like the following.

ERROR: space prohibited before that ',' (ctx:WxW)

Thus fix the affected source code places.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/memstick/core/ms_block.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/memstick/core/ms_block.c b/drivers/memstick/core/ms_block.c
index ec17885a5956..526e671a3435 100644
--- a/drivers/memstick/core/ms_block.c
+++ b/drivers/memstick/core/ms_block.c
@@ -194,7 +194,8 @@ static void msb_mark_block_unused(struct msb_data *msb, int pba)
 	int zone = msb_get_zone_from_pba(pba);
 
 	if (!test_bit(pba, msb->used_blocks_bitmap)) {
-		pr_err("BUG: attempt to mark already unused pba %d as unused" , pba);
+		pr_err("BUG: attempt to mark already unused pba %d as unused",
+		       pba);
 		msb->read_only = true;
 		return;
 	}
@@ -1551,7 +1552,7 @@ static int msb_cache_flush(struct msb_data *msb)
 	dbg_verbose("Flushing the write cache of pba %d (LBA %d)",
 						pba, msb->cache_block_lba);
 
-	sg_init_one(&sg, msb->cache , msb->block_size);
+	sg_init_one(&sg, msb->cache, msb->block_size);
 
 	/* Read all missing pages in cache */
 	for (page = 0; page < msb->pages_in_block; page++) {
@@ -1597,7 +1598,9 @@ static int msb_cache_flush(struct msb_data *msb)
 			dbg("marking page %d as containing damaged data",
 				page);
 			msb_set_overwrite_flag(msb,
-				pba , page, 0xFF & ~MEMSTICK_OV_PG_NORMAL);
+					       pba,
+					       page,
+					       0xFF & ~MEMSTICK_OV_PG_NORMAL);
 		}
 	}
 
-- 
2.11.0

