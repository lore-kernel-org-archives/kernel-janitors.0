From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 22 Jan 2017 08:33:08 +0000
Subject: [PATCH 3/5] blk-throttle: Adjust two function calls together with a variable assignment
Message-Id: <7d68f93d-c14c-60aa-2b02-5005a0a62cad@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <e734cafa-eec0-9d5b-b368-2de496a96c80@users.sourceforge.net>
In-Reply-To: <e734cafa-eec0-9d5b-b368-2de496a96c80@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-block@vger.kernel.org, Jens Axboe <axboe@kernel.dk>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 21 Jan 2017 22:15:33 +0100

The script "checkpatch.pl" pointed information out like the following.

ERROR: do not use assignment in if condition

Thus fix the affected source code places.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 block/blk-throttle.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/block/blk-throttle.c b/block/blk-throttle.c
index b392b48310ba..3cf7472fbba2 100644
--- a/block/blk-throttle.c
+++ b/block/blk-throttle.c
@@ -866,10 +866,12 @@ static void tg_update_disptime(struct throtl_grp *tg)
 	unsigned long read_wait = -1, write_wait = -1, min_wait = -1, disptime;
 	struct bio *bio;
 
-	if ((bio = throtl_peek_queued(&sq->queued[READ])))
+	bio = throtl_peek_queued(&sq->queued[READ]);
+	if (bio)
 		tg_may_dispatch(tg, bio, &read_wait);
 
-	if ((bio = throtl_peek_queued(&sq->queued[WRITE])))
+	bio = throtl_peek_queued(&sq->queued[WRITE]);
+	if (bio)
 		tg_may_dispatch(tg, bio, &write_wait);
 
 	min_wait = min(read_wait, write_wait);
-- 
2.11.0

