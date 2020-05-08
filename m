From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 08 May 2020 15:07:40 +0000
Subject: [PATCH] workqueue: Fix an use after free in init_rescuer()
Message-Id: <20200508150740.GA415175@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tejun Heo <tj@kernel.org>, Sean Fu <fxinrong@gmail.com>
Cc: Lai Jiangshan <jiangshanlai@gmail.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

We need to preserve error code before freeing "rescuer".

Fixes: f187b6974f6df ("workqueue: Use IS_ERR and PTR_ERR instead of PTR_ERR_OR_ZERO.")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Another option would be to just revert the original commit.

 kernel/workqueue.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/kernel/workqueue.c b/kernel/workqueue.c
index ddf0537dce140..10ed8d761e0b7 100644
--- a/kernel/workqueue.c
+++ b/kernel/workqueue.c
@@ -4197,6 +4197,7 @@ static int wq_clamp_max_active(int max_active, unsigned int flags,
 static int init_rescuer(struct workqueue_struct *wq)
 {
 	struct worker *rescuer;
+	int ret;
 
 	if (!(wq->flags & WQ_MEM_RECLAIM))
 		return 0;
@@ -4208,8 +4209,9 @@ static int init_rescuer(struct workqueue_struct *wq)
 	rescuer->rescue_wq = wq;
 	rescuer->task = kthread_create(rescuer_thread, rescuer, "%s", wq->name);
 	if (IS_ERR(rescuer->task)) {
+		ret = PTR_ERR(rescuer->task);
 		kfree(rescuer);
-		return PTR_ERR(rescuer->task);
+		return ret;
 	}
 
 	wq->rescuer = rescuer;
-- 
2.26.2
