From: Jeehong Kim <jhez.kim@samsung.com>
Date: Tue, 30 Aug 2016 13:12:40 +0000
Subject: [PATCH V2] sched/fair: Fix that tasks are not constrained by cfs_b->quota on hotplug core, when hotp
Message-Id: <1472562760-20842-1-git-send-email-jhez.kim@samsung.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1472562591-20732-1-git-send-email-jhez.kim@samsung.com>
In-Reply-To: <1472562591-20732-1-git-send-email-jhez.kim@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mingo@redhat.com
Cc: peterz@infradead.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, ezjjilong@gmail.com, Jeehong Kim <jhez.kim@samsung.com>

In case that CONFIG_HOTPLUG_CPU and CONFIG_CFS_BANDWIDTH is turned on
and tasks in bandwidth controlled task group run on hotplug core,
the tasks are not controlled by cfs_b->quota when hotplug core is offline
and then online. The remaining tasks in task group consume all of
cfs_b->quota on other cores.

The cause of this problem is described as below:

1. When hotplug core is offline while tasks in task group run
on hotplug core, unregister_fair_sched_group() deletes
leaf_cfs_rq_list of tg->cfs_rq[cpu] from &rq_of(cfs_rq)->leaf_cfs_rq_list.

2. Then, when hotplug core is online, update_runtime_enabled()
registers cfs_b->quota on cfs_rq->runtime_enabled of all leaf cfs_rq
on runqueue. However, because this is before enqueue_entity() adds
&cfs_rq->leaf_cfs_rq_list on &rq_of(cfs_rq)->leaf_cfs_rq_list,
cfs->quota is not register on cfs_rq->runtime_enabled.

To resolve this problem, this patch makes update_runtime_enabled()
registers cfs_b->quota by using walk_tg_tree_from().

Signed-off-by: Jeehong Kim <jhez.kim@samsung.com>
---
V2: update_runtime_enabled() walks the whole tg tree,
instead of register quota on every enqueue.

kernel/sched/fair.c | 32 +++++++++++++++++++++-----------
 1 file changed, 21 insertions(+), 11 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 6488815..63b376d 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -4373,17 +4373,27 @@ static void destroy_cfs_bandwidth(struct cfs_bandwidth *cfs_b)
 	hrtimer_cancel(&cfs_b->slack_timer);
 }

-static void __maybe_unused update_runtime_enabled(struct rq *rq)
+static int __maybe_unused __update_runtime_enabled(struct task_group *tg, void *data)
 {
-	struct cfs_rq *cfs_rq;
+	struct rq *rq = data;
+	struct cfs_rq *cfs_rq = tg->cfs_rq[cpu_of(rq)];
+	struct cfs_bandwidth *cfs_b = &cfs_rq->tg->cfs_bandwidth;

-	for_each_leaf_cfs_rq(rq, cfs_rq) {
-		struct cfs_bandwidth *cfs_b = &cfs_rq->tg->cfs_bandwidth;
+	raw_spin_lock(&cfs_b->lock);
+	cfs_rq->runtime_enabled = cfs_b->quota != RUNTIME_INF;
+	raw_spin_unlock(&cfs_b->lock);

-		raw_spin_lock(&cfs_b->lock);
-		cfs_rq->runtime_enabled = cfs_b->quota != RUNTIME_INF;
-		raw_spin_unlock(&cfs_b->lock);
-	}
+	return 0;
+}
+
+static void __maybe_unused update_runtime_enabled(struct rq *rq)
+{
+	struct cfs_rq *cfs_rq = &rq->cfs;
+
+	/* register cfs_b->quota on the whole tg tree */
+	rcu_read_lock();
+	walk_tg_tree_from(cfs_rq->tg, __update_runtime_enabled, tg_nop, (void *)rq);
+	rcu_read_unlock();
 }
--

