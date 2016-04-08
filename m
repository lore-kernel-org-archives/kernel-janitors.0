From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 08 Apr 2016 13:02:35 +0000
Subject: [patch] staging: lowmemorykiller: remove bogus NULL check
Message-Id: <20160408130235.GA9376@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

The NULL checking here doesn't make sense, so it causes a static checker
warning.  It turns out that p->mm can't be NULL so the inconsistency is
harmless and we should just remove the check.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/staging/android/lowmemorykiller.c b/drivers/staging/android/lowmemorykiller.c
index c79f224..24d2745 100644
--- a/drivers/staging/android/lowmemorykiller.c
+++ b/drivers/staging/android/lowmemorykiller.c
@@ -131,7 +131,7 @@ static unsigned long lowmem_scan(struct shrinker *s, struct shrink_control *sc)
 		if (!p)
 			continue;
 
-		if (task_lmk_waiting(p) && p->mm &&
+		if (task_lmk_waiting(p) &&
 		    time_before_eq(jiffies, lowmem_deathpending_timeout)) {
 			task_unlock(p);
 			rcu_read_unlock();
