From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 10 May 2019 11:24:41 +0000
Subject: [PATCH] mspro_block: Fix an error code in mspro_block_issue_req()
Message-Id: <20190510112440.GA22858@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

We accidentally changed the error code from -EAGAIN to 1 when we did the
blk-mq conversion.

Maybe a contributing factor to this mistake is that it wasn't obvious
that the "while (chunk) {" condition is always true.  I have cleaned
that up as well.

Fixes: d0be12274dad ("mspro_block: convert to blk-mq")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/memstick/core/mspro_block.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/memstick/core/mspro_block.c b/drivers/memstick/core/mspro_block.c
index aba50ec98b4d..9fc22c755dbf 100644
--- a/drivers/memstick/core/mspro_block.c
+++ b/drivers/memstick/core/mspro_block.c
@@ -694,13 +694,13 @@ static void h_mspro_block_setup_cmd(struct memstick_dev *card, u64 offset,
 
 /*** Data transfer ***/
 
-static int mspro_block_issue_req(struct memstick_dev *card, bool chunk)
+static int mspro_block_issue_req(struct memstick_dev *card)
 {
 	struct mspro_block_data *msb = memstick_get_drvdata(card);
 	u64 t_off;
 	unsigned int count;
 
-	while (chunk) {
+	while (true) {
 		msb->current_page = 0;
 		msb->current_seg = 0;
 		msb->seg_count = blk_rq_map_sg(msb->block_req->q,
@@ -709,6 +709,7 @@ static int mspro_block_issue_req(struct memstick_dev *card, bool chunk)
 
 		if (!msb->seg_count) {
 			unsigned int bytes = blk_rq_cur_bytes(msb->block_req);
+			bool chunk;
 
 			chunk = blk_update_request(msb->block_req,
 							BLK_STS_RESOURCE,
@@ -718,7 +719,7 @@ static int mspro_block_issue_req(struct memstick_dev *card, bool chunk)
 			__blk_mq_end_request(msb->block_req,
 						BLK_STS_RESOURCE);
 			msb->block_req = NULL;
-			break;
+			return -EAGAIN;
 		}
 
 		t_off = blk_rq_pos(msb->block_req);
@@ -735,8 +736,6 @@ static int mspro_block_issue_req(struct memstick_dev *card, bool chunk)
 		memstick_new_req(card->host);
 		return 0;
 	}
-
-	return 1;
 }
 
 static int mspro_block_complete_req(struct memstick_dev *card, int error)
@@ -779,7 +778,7 @@ static int mspro_block_complete_req(struct memstick_dev *card, int error)
 		chunk = blk_update_request(msb->block_req,
 				errno_to_blk_status(error), t_len);
 		if (chunk) {
-			error = mspro_block_issue_req(card, chunk);
+			error = mspro_block_issue_req(card);
 			if (!error)
 				goto out;
 		} else {
@@ -849,7 +848,7 @@ static blk_status_t mspro_queue_rq(struct blk_mq_hw_ctx *hctx,
 	msb->block_req = bd->rq;
 	blk_mq_start_request(bd->rq);
 
-	if (mspro_block_issue_req(card, true))
+	if (mspro_block_issue_req(card))
 		msb->block_req = NULL;
 
 	spin_unlock_irq(&msb->q_lock);
-- 
2.18.0
