From: Colin King <colin.king@canonical.com>
Date: Mon, 08 May 2017 10:44:40 +0000
Subject: [PATCH] blk-mq: make __blk_mq_stop_hw_queues static
Message-Id: <20170508104440.10945-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Making __blk_mq_stop_hw_queues static fixes sparse warning:

  block/blk-mq.c:6: warning: symbol '__blk_mq_stop_hw_queues' was not
  declared. Should it be static?

Fixes: 2719aa217e0d0 ("blk-mq: don't use sync workqueue flushing from drivers")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 block/blk-mq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block/blk-mq.c b/block/blk-mq.c
index 5d4ce7eb8dbf..5385fc89a6d2 100644
--- a/block/blk-mq.c
+++ b/block/blk-mq.c
@@ -1236,7 +1236,7 @@ void blk_mq_stop_hw_queue(struct blk_mq_hw_ctx *hctx)
 }
 EXPORT_SYMBOL(blk_mq_stop_hw_queue);
 
-void __blk_mq_stop_hw_queues(struct request_queue *q, bool sync)
+static void __blk_mq_stop_hw_queues(struct request_queue *q, bool sync)
 {
 	struct blk_mq_hw_ctx *hctx;
 	int i;
-- 
2.11.0

