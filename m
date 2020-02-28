From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 28 Feb 2020 14:13:50 +0000
Subject: [PATCH] loop: Fix IS_ERR() vs NULL bugs in loop_prepare_queue()
Message-Id: <20200228141350.iaviwnry3z4ipjqe@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jens Axboe <axboe@kernel.dk>, Dan Schatzberg <schatzberg.dan@gmail.com>
Cc: linux-block@vger.kernel.org, kernel-janitors@vger.kernel.org

The alloc_workqueue() function returns NULL on error, it never returns
error pointers.

Fixes: 29dab2122492 ("loop: use worker per cgroup instead of kworker")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/block/loop.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/block/loop.c b/drivers/block/loop.c
index da8ec0b9d909..a31ca5e04fae 100644
--- a/drivers/block/loop.c
+++ b/drivers/block/loop.c
@@ -897,7 +897,7 @@ static int loop_prepare_queue(struct loop_device *lo)
 					WQ_UNBOUND | WQ_FREEZABLE |
 					WQ_MEM_RECLAIM,
 					lo->lo_number);
-	if (IS_ERR(lo->workqueue))
+	if (!lo->workqueue)
 		return -ENOMEM;
 
 	return 0;
-- 
2.11.0
