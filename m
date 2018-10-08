From: Colin King <colin.king@canonical.com>
Date: Mon, 08 Oct 2018 21:16:09 +0000
Subject: [PATCH][md-next] md: remove redundant code that is no longer reachable
Message-Id: <20181008211609.9650-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Shaohua Li <shli@kernel.org>, linux-raid@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

And earlier commit removed the error label to two statements that
are now never reachable.  Since this code is now dead code, remove it.

Detected by CoverityScan, CID#1462409 ("Structurally dead code")

Fixes: d5d885fd514f ("md: introduce new personality funciton start()")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/md/raid5-cache.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/md/raid5-cache.c b/drivers/md/raid5-cache.c
index e6e925add700..ec3a5ef7fee0 100644
--- a/drivers/md/raid5-cache.c
+++ b/drivers/md/raid5-cache.c
@@ -3151,8 +3151,6 @@ int r5l_init_log(struct r5conf *conf, struct md_rdev *rdev)
 	set_bit(MD_HAS_JOURNAL, &conf->mddev->flags);
 	return 0;
 
-	rcu_assign_pointer(conf->log, NULL);
-	md_unregister_thread(&log->reclaim_thread);
 reclaim_thread:
 	mempool_exit(&log->meta_pool);
 out_mempool:
-- 
2.17.1
