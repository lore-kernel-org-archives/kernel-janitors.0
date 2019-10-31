From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 31 Oct 2019 10:53:41 +0000
Subject: [PATCH] iocost: don't nest spin_lock_irq in ioc_weight_write()
Message-Id: <20191031105341.GA26612@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jens Axboe <axboe@kernel.dk>, Tejun Heo <tj@kernel.org>
Cc: linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

This code causes a static analysis warning:

    block/blk-iocost.c:2113 ioc_weight_write() error: double lock 'irq'

We disable IRQs in blkg_conf_prep() and re-enable them in
blkg_conf_finish().  IRQ disable/enable should not be nested because
that means the IRQs will be enabled at the first unlock instead of the
second one.

Fixes: 7caa47151ab2 ("blkcg: implement blk-iocost")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 block/blk-iocost.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/block/blk-iocost.c b/block/blk-iocost.c
index 2a3db80c1dce..a7ed434eae03 100644
--- a/block/blk-iocost.c
+++ b/block/blk-iocost.c
@@ -2110,10 +2110,10 @@ static ssize_t ioc_weight_write(struct kernfs_open_file *of, char *buf,
 			goto einval;
 	}
 
-	spin_lock_irq(&iocg->ioc->lock);
+	spin_lock(&iocg->ioc->lock);
 	iocg->cfg_weight = v;
 	weight_updated(iocg);
-	spin_unlock_irq(&iocg->ioc->lock);
+	spin_unlock(&iocg->ioc->lock);
 
 	blkg_conf_finish(&ctx);
 	return nbytes;
-- 
2.20.1
