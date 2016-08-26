From: Jeehong Kim <jhez.kim@samsung.com>
Date: Fri, 26 Aug 2016 09:40:39 +0000
Subject: [PATCH] sched/fair: Fix that tasks are not constrained by cfs_b->quota on hotplug core, when hotplug
Message-Id: <1472204439-3542-1-git-send-email-jhez.kim@samsung.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mingo@redhat.com
Cc: peterz@infradead.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, ezjjilong@gmail.com, Jeehong Kim <jhez.kim@samsung.com>

In case that CONFIG_HOTPLUG_CPU and CONFIG_CFS_BANDWIDTH is turned on and tasks in bandwidth controlled task group run on hotplug core, the tasks are not controlled by cfs_b->quota when hotplug core is offline and then online. The remaining tasks in task group consume all of cfs_b->quota on other cores.

The cause of this problem is described as below;

1. When hotplug core is offline while tasks in task group run on hotplug core, unregister_fair_sched_group() deletes leaf_cfs_rq_list of tg->cfs_rq[cpu] from &rq_of(cfs_rq)->leaf_cfs_rq_list.

2. Then, when hotplug core is online, update_runtime_enabled() registers cfs_b->quota on cfs_rq->runtime_enabled of all leaf cfs_rq on runqueue. However, because this is before	enqueue_entity() adds &cfs_rq->leaf_cfs_rq_list on &rq_of(cfs_rq)->leaf_cfs_rq_list, cfs->quota is not register on cfs_rq->runtime_enabled.

To resolve this problem, this patch registers cfs_b->quota on cfs_rq->runtime_enabled after list_add_leaf_cfs_rq() for every enqueue_entity().

Signed-off-by: Jeehong Kim <jhez.kim@samsung.com>
---
 kernel/sched/fair.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 6488815..1f4b104 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -4246,9 +4246,16 @@ static void do_sched_cfs_slack_timer(struct cfs_bandwidth *cfs_b)
  */
 static void check_enqueue_throttle(struct cfs_rq *cfs_rq)
 {
+	struct cfs_bandwidth *cfs_b = &cfs_rq->tg->cfs_bandwidth;
+
 	if (!cfs_bandwidth_used())
 		return;

+	/* register cfs_b->quota */
+	raw_spin_lock(&cfs_b->lock);
+	cfs_rq->runtime_enabled = cfs_b->quota != RUNTIME_INF;
+	raw_spin_unlock(&cfs_b->lock);
+
 	/* an active group must be handled by the update_curr()->put() path */
 	if (!cfs_rq->runtime_enabled || cfs_rq->curr)
 		return;
--
1.9.1

