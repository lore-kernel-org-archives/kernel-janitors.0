From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 28 Feb 2020 17:21:36 +0000
Subject: [PATCH resend] loop: Fix IS_ERR() vs NULL bugs in loop_prepare_queue()
Message-Id: <20200228172136.h5dvwvrg5yfywxss@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <c106c6ec-7171-3586-d5c5-5c14e386b3d5@kernel.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jens Axboe <axboe@kernel.dk>, Dan Schatzberg <schatzberg.dan@gmail.com>, Andrew Morton <akpm@linux-foundation.org>
Cc: linux-block@vger.kernel.org, kernel-janitors@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>, linux-mm@kvack.org

The alloc_workqueue() function returns NULL on error, it never returns
error pointers.

Fixes: 29dab2122492 ("loop: use worker per cgroup instead of kworker")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
Acked-by: Dan Schatzberg <schatzberg.dan@gmail.com>
---
Resending because this goes through your -mm tree, Andrew.  The
get_maintainer.pl script lead me astray.

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
