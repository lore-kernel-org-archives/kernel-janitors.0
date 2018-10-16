From: YueHaibing <yuehaibing@huawei.com>
Date: Tue, 16 Oct 2018 01:45:26 +0000
Subject: [PATCH -next] null_blk: remove set but not used variable 'q'
Message-Id: <1539654326-165410-1-git-send-email-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jens Axboe <axboe@kernel.dk>
Cc: YueHaibing <yuehaibing@huawei.com>, linux-block@vger.kernel.org, kernel-janitors@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/block/null_blk_main.c: In function 'end_cmd':
drivers/block/null_blk_main.c:609:24: warning:
 variable 'q' set but not used [-Wunused-but-set-variable]

It not used any more after commit
e50b1e327aeb ("null_blk: remove legacy IO path")

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/block/null_blk_main.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/block/null_blk_main.c b/drivers/block/null_blk_main.c
index 0b302d7..e945910 100644
--- a/drivers/block/null_blk_main.c
+++ b/drivers/block/null_blk_main.c
@@ -606,12 +606,8 @@ static struct nullb_cmd *alloc_cmd(struct nullb_queue *nq, int can_wait)
 
 static void end_cmd(struct nullb_cmd *cmd)
 {
-	struct request_queue *q = NULL;
 	int queue_mode = cmd->nq->dev->queue_mode;
 
-	if (cmd->rq)
-		q = cmd->rq->q;
-
 	switch (queue_mode)  {
 	case NULL_Q_MQ:
 		blk_mq_end_request(cmd->rq, cmd->error);
