From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 25 Feb 2014 08:35:09 +0000
Subject: [patch] dm thin: inverted down_trylock() test
Message-Id: <20140225083509.GB5023@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alasdair Kergon <agk@redhat.com>, Joe Thornber <ejt@redhat.com>
Cc: linux-raid@vger.kernel.org, dm-devel@redhat.com, kernel-janitors@vger.kernel.org, Mike Snitzer <snitzer@redhat.com>

down_trylock() is the opposite of mutex_trylock().  It returns zero on
success and one on failure.

Fixes: f4ef95631ebf ('dm thin: do not run the worker thread if pool is suspended')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/md/dm-thin.c b/drivers/md/dm-thin.c
index 6cbe9d2e0385..7d8e03c21fa9 100644
--- a/drivers/md/dm-thin.c
+++ b/drivers/md/dm-thin.c
@@ -237,7 +237,7 @@ struct thin_c {
  */
 static void wake_worker(struct pool *pool)
 {
-	if (down_trylock(&pool->queue_work_lock)) {
+	if (!down_trylock(&pool->queue_work_lock)) {
 		queue_work(pool->wq, &pool->worker);
 		up(&pool->queue_work_lock);
 	}
