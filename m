From: Colin King <colin.king@canonical.com>
Date: Wed, 14 Nov 2018 22:17:05 +0000
Subject: [PATCH][next] block: clean up dead code that is now redundant
Message-Id: <20181114221705.17207-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The boolean next_sorted is set to false and is never changed, hence
the code that checks if it is true is dead code and can now be
removed.  This dead code occurred from a previous commit that cleaned
up the elevator and removed the setting of next_sorted to true.

Detected by CoverityScan, CID#1475401 ("'Constant' variable guards
dead code")

Fixes: a1ce35fa4985 ("block: remove dead elevator code")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 block/elevator.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/block/elevator.c b/block/elevator.c
index 19351ffa56b1..796436270682 100644
--- a/block/elevator.c
+++ b/block/elevator.c
@@ -394,18 +394,11 @@ void elv_merge_requests(struct request_queue *q, struct request *rq,
 			     struct request *next)
 {
 	struct elevator_queue *e = q->elevator;
-	bool next_sorted = false;
 
 	if (e->type->ops.requests_merged)
 		e->type->ops.requests_merged(q, rq, next);
 
 	elv_rqhash_reposition(q, rq);
-
-	if (next_sorted) {
-		elv_rqhash_del(q, next);
-		q->nr_sorted--;
-	}
-
 	q->last_merge = rq;
 }
 
-- 
2.19.1
