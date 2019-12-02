From: Colin King <colin.king@canonical.com>
Date: Mon, 02 Dec 2019 16:54:08 +0000
Subject: [PATCH] loop: remove redundant assignment to err
Message-Id: <20191202165408.64510-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable err is being assigned with a value that is never
read and it is being updated later with a new value.  The assignment
is redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/block/loop.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/block/loop.c b/drivers/block/loop.c
index 739b372a5112..30f187786dae 100644
--- a/drivers/block/loop.c
+++ b/drivers/block/loop.c
@@ -2006,7 +2006,6 @@ static int loop_add(struct loop_device **l, int i)
 		goto out_free_dev;
 	i = err;
 
-	err = -ENOMEM;
 	lo->tag_set.ops = &loop_mq_ops;
 	lo->tag_set.nr_hw_queues = 1;
 	lo->tag_set.queue_depth = 128;
-- 
2.24.0
