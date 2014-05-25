From: Giedrius Rekasius <giedrius.rekasius@gmail.com>
Date: Sun, 25 May 2014 14:23:31 +0000
Subject: [PATCH] sched: remove redundant assignment to "rt_rq" in update_curr_rt(...)
Message-Id: <1401027811-30066-1-git-send-email-giedrius.rekasius@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ingo Molnar <mingo@redhat.com>
Cc: Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Variable "rt_rq" is used only in block "for_each_sched_rt_entity" so the
value assigned to it at the beginning of the update_curr_rt(...) gets
overwritten without ever being read. Remove redundant assignment and
move variable declaration to the block in which it is being used.

Signed-off-by: Giedrius Rekasius <giedrius.rekasius@gmail.com>
---
 kernel/sched/rt.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/kernel/sched/rt.c b/kernel/sched/rt.c
index bd2267a..7e0ea78 100644
--- a/kernel/sched/rt.c
+++ b/kernel/sched/rt.c
@@ -885,7 +885,6 @@ static void update_curr_rt(struct rq *rq)
 {
 	struct task_struct *curr = rq->curr;
 	struct sched_rt_entity *rt_se = &curr->rt;
-	struct rt_rq *rt_rq = rt_rq_of_se(rt_se);
 	u64 delta_exec;
 
 	if (curr->sched_class != &rt_sched_class)
@@ -910,7 +909,7 @@ static void update_curr_rt(struct rq *rq)
 		return;
 
 	for_each_sched_rt_entity(rt_se) {
-		rt_rq = rt_rq_of_se(rt_se);
+		struct rt_rq *rt_rq = rt_rq_of_se(rt_se);
 
 		if (sched_rt_runtime(rt_rq) != RUNTIME_INF) {
 			raw_spin_lock(&rt_rq->rt_runtime_lock);
-- 
1.9.3

