From: Tejun Heo <tj@kernel.org>
Date: Tue, 21 Jul 2015 15:06:34 +0000
Subject: [PATCH block/for-linus] blkcg: fix double unlock in blkcg_policy_register() error path
Message-Id: <20150721150634.GF15934@mtj.duckdns.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150720145436.GA19257@mwanda>
In-Reply-To: <20150720145436.GA19257@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jens Axboe <axboe@kernel.dk>
Cc: kernel-janitors@vger.kernel.org, Dan Carpenter <dan.carpenter@oracle.com>, linux-kernel@vger.kernel.org

06b285bd1125 ("blkcg: fix blkcg_policy_data allocation bug")
introduced double unlock of blkcg_pol_mutx on allocation failure path.
Fix it.

Signed-off-by: Tejun Heo <tj@kernel.org>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Fixes: 06b285bd1125 ("blkcg: fix blkcg_policy_data allocation bug")
---
 block/blk-cgroup.c |    4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/block/blk-cgroup.c b/block/blk-cgroup.c
index 9da02c0..24fb729 100644
--- a/block/blk-cgroup.c
+++ b/block/blk-cgroup.c
@@ -1187,10 +1187,8 @@ int blkcg_policy_register(struct blkcg_policy *pol)
 			struct blkcg_policy_data *cpd;
 
 			cpd = kzalloc(pol->cpd_size, GFP_KERNEL);
-			if (!cpd) {
-				mutex_unlock(&blkcg_pol_mutex);
+			if (!cpd)
 				goto err_free_cpds;
-			}
 
 			blkcg->pd[pol->plid] = cpd;
 			cpd->plid = pol->plid;
