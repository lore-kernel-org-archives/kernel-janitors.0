From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 25 Feb 2015 13:15:14 +0000
Subject: [patch] memstick: mspro_block: add missing curly braces
Message-Id: <20150225131514.GC19745@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alex Dubov <oakad@yahoo.com>, Andrew Morton <akpm@linux-foundation.org>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From the indenting we can see the curly braces were obviously intended.
This is a static checker fix, but my guess is that we don't read enough
bytes, because we don't calculate "t_len" correctly.

Fixes: f1d82698029b ('memstick: use fully asynchronous request processing')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/memstick/core/mspro_block.c b/drivers/memstick/core/mspro_block.c
index fc145d2..922a750 100644
--- a/drivers/memstick/core/mspro_block.c
+++ b/drivers/memstick/core/mspro_block.c
@@ -758,7 +758,7 @@ static int mspro_block_complete_req(struct memstick_dev *card, int error)
 
 		if (error || (card->current_mrq.tpc = MSPRO_CMD_STOP)) {
 			if (msb->data_dir = READ) {
-				for (cnt = 0; cnt < msb->current_seg; cnt++)
+				for (cnt = 0; cnt < msb->current_seg; cnt++) {
 					t_len += msb->req_sg[cnt].length
 						 / msb->page_size;
 
@@ -766,6 +766,7 @@ static int mspro_block_complete_req(struct memstick_dev *card, int error)
 						t_len += msb->current_page - 1;
 
 					t_len *= msb->page_size;
+				}
 			}
 		} else
 			t_len = blk_rq_bytes(msb->block_req);
