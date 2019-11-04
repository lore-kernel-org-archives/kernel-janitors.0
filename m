From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 04 Nov 2019 10:18:11 +0000
Subject: [PATCH] iocost: add a comment about locking in ioc_weight_write()
Message-Id: <20191104101811.GA20821@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <x49d0ebd2sl.fsf@segfault.boston.devel.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jens Axboe <axboe@kernel.dk>, Jeff Moyer <jmoyer@redhat.com>
Cc: linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

It wasn't very clear that blkg_conf_prep() disables IRQ and that they
are enabled in blkg_conf_finish() so this patch adds a comment about it.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
I don't know if it's too late to fold this in with the previous patch?

 block/blk-iocost.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/block/blk-iocost.c b/block/blk-iocost.c
index a7ed434eae03..c5a8703ca6aa 100644
--- a/block/blk-iocost.c
+++ b/block/blk-iocost.c
@@ -2095,6 +2095,7 @@ static ssize_t ioc_weight_write(struct kernfs_open_file *of, char *buf,
 		return nbytes;
 	}
 
+	/* blkg_conf_prep() takes the q->queue_lock and disables IRQs */
 	ret = blkg_conf_prep(blkcg, &blkcg_policy_iocost, buf, &ctx);
 	if (ret)
 		return ret;
@@ -2115,6 +2116,7 @@ static ssize_t ioc_weight_write(struct kernfs_open_file *of, char *buf,
 	weight_updated(iocg);
 	spin_unlock(&iocg->ioc->lock);
 
+	/* blkg_conf_finish() unlocks the q->queue_lock and enables IRQs */
 	blkg_conf_finish(&ctx);
 	return nbytes;
 
-- 
2.20.1
