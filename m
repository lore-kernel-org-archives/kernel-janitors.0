From: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
Date: Sun, 10 Dec 2017 21:25:47 +0000
Subject: Re: [PATCH] Scheduler: Removed first parameter from prepare_lock_switch
Message-Id: <20171210212547.mebrkihdh3h7gyl5@smtp.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171205140200.4guikhmagltvoehm@smtp.gmail.com>
 <20171206121437.g7wsnqhx6oyycyqf@hirez.programming.kicks-ass.net>
 <20171206235019.vvpx467magnuk25d@smtp.gmail.com>
 <20171207083820.tpgeqcfoelnau637@hirez.programming.kicks-ass.net>
 <20171207215225.v26vmzmnac3v6jfr@smtp.gmail.com>
In-Reply-To: <20171207215225.v26vmzmnac3v6jfr@smtp.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Peter Zijlstra <peterz@infradead.org>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Peter,

I tried to understand and applied all your suggestions, follows the
modification:

Adjustments: lock/unlock task in context_switch

Function prepare_lock_switch have an unused parameter, and also the
function name was not descriptive. To improve the readability and remove
the extra parameter, the following changes were made:

* Moved prepare_lock_switch from kernel/sched/sched.h to
  kernel/sched/core.c, renamed it to acquire_lock_task, and removed the
  unused parameter.

* Split the smp_store_release() out from finish_lock_switch() to a
  function named release_lock_task.

* Comments ajdustments.

Signed-off-by: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
---
 kernel/sched/core.c  | 52 ++++++++++++++++++++++++++++++++++++++++++++++++----
 kernel/sched/sched.h | 41 -----------------------------------------
 2 files changed, 48 insertions(+), 45 deletions(-)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 75554f366fd3..5b36a2d2b1ee 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -2045,7 +2045,7 @@ try_to_wake_up(struct task_struct *p, unsigned int state, int wake_flags)
 	 * If the owning (remote) CPU is still in the middle of schedule() with
 	 * this task as prev, wait until its done referencing the task.
 	 *
-	 * Pairs with the smp_store_release() in finish_lock_switch().
+	 * Pairs with the smp_store_release() in release_lock_task().
 	 *
 	 * This ensures that tasks getting woken will be fully ordered against
 	 * their previous state and preserve Program Order.
@@ -2571,6 +2571,49 @@ fire_sched_out_preempt_notifiers(struct task_struct *curr,
 
 #endif /* CONFIG_PREEMPT_NOTIFIERS */
 
+static inline void acquire_lock_task(struct task_struct *next)
+{
+#ifdef CONFIG_SMP
+	/*
+	 * Avoid task to be moved to a different CPU
+	 */
+	next->on_cpu = 1;
+#endif
+}
+
+static inline void release_lock_task(struct task_struct *prev)
+{
+#ifdef CONFIG_SMP
+	/*
+	 * After ->on_cpu is cleared, the task can be moved to a different CPU.
+	 * We must ensure this doesn't happen until the switch is completely
+	 * finished.
+	 *
+	 * In particular, the load of prev->state in finish_task_switch() must
+	 * happen before this.
+	 *
+	 * Pairs with the smp_cond_load_acquire() in try_to_wake_up().
+	 */
+	smp_store_release(&prev->on_cpu, 0);
+#endif
+}
+
+static inline void finish_lock_switch(struct rq *rq)
+{
+#ifdef CONFIG_DEBUG_SPINLOCK
+	/* this is a valid case when another task releases the spinlock */
+	rq->lock.owner = current;
+#endif
+	/*
+	 * If we are tracking spinlock dependencies then we have to
+	 * fix up the runqueue lock - which gets 'carried over' from
+	 * prev into current:
+	 */
+	spin_acquire(&rq->lock.dep_map, 0, 0, _THIS_IP_);
+
+	raw_spin_unlock_irq(&rq->lock);
+}
+
 /**
  * prepare_task_switch - prepare to switch tasks
  * @rq: the runqueue preparing to switch
@@ -2591,7 +2634,7 @@ prepare_task_switch(struct rq *rq, struct task_struct *prev,
 	sched_info_switch(rq, prev, next);
 	perf_event_task_sched_out(prev, next);
 	fire_sched_out_preempt_notifiers(prev, next);
-	prepare_lock_switch(rq, next);
+	acquire_lock_task(next);
 	prepare_arch_switch(next);
 }
 
@@ -2646,7 +2689,7 @@ static struct rq *finish_task_switch(struct task_struct *prev)
 	 * the scheduled task must drop that reference.
 	 *
 	 * We must observe prev->state before clearing prev->on_cpu (in
-	 * finish_lock_switch), otherwise a concurrent wakeup can get prev
+	 * release_lock_task), otherwise a concurrent wakeup can get prev
 	 * running on another CPU and we could rave with its RUNNING -> DEAD
 	 * transition, resulting in a double drop.
 	 */
@@ -2663,7 +2706,8 @@ static struct rq *finish_task_switch(struct task_struct *prev)
 	 * to use.
 	 */
 	smp_mb__after_unlock_lock();
-	finish_lock_switch(rq, prev);
+	release_lock_task(prev);
+	finish_lock_switch(rq);
 	finish_arch_post_lock_switch();
 
 	fire_sched_in_preempt_notifiers(current);
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index b19552a212de..43f5d6e936bb 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -1328,47 +1328,6 @@ static inline int task_on_rq_migrating(struct task_struct *p)
 # define finish_arch_post_lock_switch()	do { } while (0)
 #endif
 
-static inline void prepare_lock_switch(struct rq *rq, struct task_struct *next)
-{
-#ifdef CONFIG_SMP
-	/*
-	 * We can optimise this out completely for !SMP, because the
-	 * SMP rebalancing from interrupt is the only thing that cares
-	 * here.
-	 */
-	next->on_cpu = 1;
-#endif
-}
-
-static inline void finish_lock_switch(struct rq *rq, struct task_struct *prev)
-{
-#ifdef CONFIG_SMP
-	/*
-	 * After ->on_cpu is cleared, the task can be moved to a different CPU.
-	 * We must ensure this doesn't happen until the switch is completely
-	 * finished.
-	 *
-	 * In particular, the load of prev->state in finish_task_switch() must
-	 * happen before this.
-	 *
-	 * Pairs with the smp_cond_load_acquire() in try_to_wake_up().
-	 */
-	smp_store_release(&prev->on_cpu, 0);
-#endif
-#ifdef CONFIG_DEBUG_SPINLOCK
-	/* this is a valid case when another task releases the spinlock */
-	rq->lock.owner = current;
-#endif
-	/*
-	 * If we are tracking spinlock dependencies then we have to
-	 * fix up the runqueue lock - which gets 'carried over' from
-	 * prev into current:
-	 */
-	spin_acquire(&rq->lock.dep_map, 0, 0, _THIS_IP_);
-
-	raw_spin_unlock_irq(&rq->lock);
-}
-
 /*
  * wake flags
  */
-- 
2.15.1

