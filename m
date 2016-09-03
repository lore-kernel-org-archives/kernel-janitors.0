From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sat, 03 Sep 2016 07:06:30 +0000
Subject: [PATCH] drm: flip-work: Simplify code
Message-Id: <1472886390-29868-1-git-send-email-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: airlied@linux.ie
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Calling 'list_splice_tail' followed by 'INIT_LIST_HEAD' is equivalent to
'list_splice_tail_init'.

This has been spotted with the following coccinelle script:
/////
@@
expression y,z;
@@

-   list_splice_tail(y,z);
-   INIT_LIST_HEAD(y);
+   list_splice_tail_init(y,z);

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/gpu/drm/drm_flip_work.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_flip_work.c b/drivers/gpu/drm/drm_flip_work.c
index 12dea16f22a8..c8b54a6694f6 100644
--- a/drivers/gpu/drm/drm_flip_work.c
+++ b/drivers/gpu/drm/drm_flip_work.c
@@ -101,8 +101,7 @@ void drm_flip_work_commit(struct drm_flip_work *work,
 	unsigned long flags;
 
 	spin_lock_irqsave(&work->lock, flags);
-	list_splice_tail(&work->queued, &work->commited);
-	INIT_LIST_HEAD(&work->queued);
+	list_splice_tail_init(&work->queued, &work->commited);
 	spin_unlock_irqrestore(&work->lock, flags);
 	queue_work(wq, &work->worker);
 }
@@ -119,8 +118,7 @@ static void flip_worker(struct work_struct *w)
 
 		INIT_LIST_HEAD(&tasks);
 		spin_lock_irqsave(&work->lock, flags);
-		list_splice_tail(&work->commited, &tasks);
-		INIT_LIST_HEAD(&work->commited);
+		list_splice_tail_init(&work->commited, &tasks);
 		spin_unlock_irqrestore(&work->lock, flags);
 
 		if (list_empty(&tasks))
-- 
2.7.4

