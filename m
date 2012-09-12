From: Peter Senna Tschudin <peter.senna@gmail.com>
Date: Wed, 12 Sep 2012 15:06:40 +0000
Subject: [PATCH 2/9] block/blk-tag.c: Remove useless kfree
Message-Id: <1347462407-13499-2-git-send-email-peter.senna@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jens Axboe <axboe@kernel.dk>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Peter Senna Tschudin <peter.senna@gmail.com>

Remove useless kfree() and clean up code related to the removal.

The semantic patch that finds this problem is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@r exists@
position p1,p2;
expression x;
@@

if (x@p1 = NULL) { ... kfree@p2(x); ... return ...; }

@unchanged exists@
position r.p1,r.p2;
expression e <= r.x,x,e1;
iterator I;
statement S;
@@

if (x@p1 = NULL) { ... when != I(x,...) S
                        when != e = e1
                        when != e += e1
                        when != e -= e1
                        when != ++e
                        when != --e
                        when != e++
                        when != e--
                        when != &e
   kfree@p2(x); ... return ...; }

@ok depends on unchanged exists@
position any r.p1;
position r.p2;
expression x;
@@

... when != true x@p1 = NULL
kfree@p2(x);

@depends on !ok && unchanged@
position r.p2;
expression x;
@@

*kfree@p2(x);
// </smpl>

Signed-off-by: Peter Senna Tschudin <peter.senna@gmail.com>

---
 block/blk-tag.c |    6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/block/blk-tag.c b/block/blk-tag.c
index 4af6f5c..cc345e1 100644
--- a/block/blk-tag.c
+++ b/block/blk-tag.c
@@ -186,7 +186,8 @@ int blk_queue_init_tags(struct request_queue *q, int depth,
 		tags = __blk_queue_init_tags(q, depth);
 
 		if (!tags)
-			goto fail;
+			return -ENOMEM;
+
 	} else if (q->queue_tags) {
 		rc = blk_queue_resize_tags(q, depth);
 		if (rc)
@@ -203,9 +204,6 @@ int blk_queue_init_tags(struct request_queue *q, int depth,
 	queue_flag_set_unlocked(QUEUE_FLAG_QUEUED, q);
 	INIT_LIST_HEAD(&q->tag_busy_list);
 	return 0;
-fail:
-	kfree(tags);
-	return -ENOMEM;
 }
 EXPORT_SYMBOL(blk_queue_init_tags);
 

