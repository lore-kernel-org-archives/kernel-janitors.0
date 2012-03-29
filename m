From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 29 Mar 2012 18:51:19 +0000
Subject: [patch] blkcg: change a spin_lock() to spin_lock_irq()
Message-Id: <20120329185119.GA21812@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jens Axboe <axboe@kernel.dk>, Tejun Heo <tj@kernel.org>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Smatch complains that we re-enable IRQs twice.  It looks like we forgot
to disable them here on the spin_trylock() failure path.  This was added
in 9f13ef678e "blkcg: use double locking instead of RCU for blkg
synchronization".

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/block/blk-cgroup.c b/block/blk-cgroup.c
index 74a76a8..bf4b76e 100644
--- a/block/blk-cgroup.c
+++ b/block/blk-cgroup.c
@@ -1598,7 +1598,7 @@ static int blkiocg_pre_destroy(struct cgroup *cgroup)
 		} else {
 			spin_unlock_irq(&blkcg->lock);
 			cpu_relax();
-			spin_lock(&blkcg->lock);
+			spin_lock_irq(&blkcg->lock);
 		}
 	}
 
