From: shenghui <crosslonelyover@gmail.com>
Date: Tue, 29 Jun 2010 07:10:38 +0000
Subject: [PATCH] avoid race condition in pick_next_task_fair in
Message-Id: <AANLkTin49UHeVhfS-iFwWvPIg29HPhXaP3DorBAa-a0I@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, mingo@elte.hu, peterz@infradead.org, Greg KH <greg@kroah.com>

Hi,

      I walked some code in kernel/sched_fair.c in version 2.6.35-rc3, and
got the following potential failure:

static struct task_struct *pick_next_task_fair(struct rq *rq)
{
...
	if (!cfs_rq->nr_running)
		return NULL;

	do {
		se = pick_next_entity(cfs_rq);
		set_next_entity(cfs_rq, se);
		cfs_rq = group_cfs_rq(se);
	} while (cfs_rq);
...
}

/*
 * The dequeue_task method is called after nr_running is
 * decreased. We remove the task from the rbtree and
 * update the fair scheduling stats:
 */
static void dequeue_task_fair(struct rq *rq, struct task_struct *p, int flags)
{
...
		dequeue_entity(cfs_rq, se, flags);
...
}

static void
dequeue_entity(struct cfs_rq *cfs_rq, struct sched_entity *se, int flags)
{
...
	if (se != cfs_rq->curr)
		__dequeue_entity(cfs_rq, se);
        account_entity_dequeue(cfs_rq, se);
	update_min_vruntime(cfs_rq);
...
}

dequeue_task_fair() is used to dequeue some task, and it calls
dequeue_entity() to finish the job. While dequeue_entity() calls
__dequeue_entity() first, then calls account_entity_dequeue()
to do substraction on cfs_rq->nr_running.
Here, if one task is dequeued, then cfs_rq->nr_running will be
changed later, e.g 1 to 0.
In the pick_next_task_fair(), the if check will get passed before
nr_running is set 0 and the following while structure is executed.

	do {
		se = pick_next_entity(cfs_rq);
		set_next_entity(cfs_rq, se);
		cfs_rq = group_cfs_rq(se);
	} while (cfs_rq);

We may get se set NULL here, and set_next_entity may deference
NULL pointer, which can lead to Oops.

I think some lock on the metadata can fix this issue, but we may
change plenty of code to add support for lock. I think the easist
way is just substacting nr_running before dequing tasks.

Following is my patch, please check it.


From 4fe38deac173c7777cd02096950e979749170873 Mon Sep 17 00:00:00 2001
From: Wang Sheng-Hui <crosslonelyover@gmail.com>
Date: Tue, 29 Jun 2010 14:49:05 +0800
Subject: [PATCH] avoid race condition in pick_next_task_fair in
kernel/sched_fair.c


Signed-off-by: Wang Sheng-Hui <crosslonelyover@gmail.com>
---
 kernel/sched_fair.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/sched_fair.c b/kernel/sched_fair.c
index eed35ed..93073ff 100644
--- a/kernel/sched_fair.c
+++ b/kernel/sched_fair.c
@@ -823,9 +823,9 @@ dequeue_entity(struct cfs_rq *cfs_rq, struct
sched_entity *se, int flags)

 	clear_buddies(cfs_rq, se);

+	account_entity_dequeue(cfs_rq, se);
 	if (se != cfs_rq->curr)
 		__dequeue_entity(cfs_rq, se);
-	account_entity_dequeue(cfs_rq, se);
 	update_min_vruntime(cfs_rq);

 	/*
@@ -1059,7 +1059,7 @@ enqueue_task_fair(struct rq *rq, struct
task_struct *p, int flags)
 }

 /*
- * The dequeue_task method is called before nr_running is
+ * The dequeue_task method is called after nr_running is
  * decreased. We remove the task from the rbtree and
  * update the fair scheduling stats:
  */
-- 
1.6.3.3



-- 


Thanks and Best Regards,
shenghui
