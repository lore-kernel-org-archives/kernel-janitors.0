From: Peter Zijlstra <peterz@infradead.org>
Date: Mon, 18 Dec 2017 19:30:02 +0000
Subject: Re: [PATCH v2] Adjustments: lock/unlock task in context_switch
Message-Id: <20171218193002.zzuocnd2hyt34ok5@hirez.programming.kicks-ass.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171215140603.gxe5i2y6fg5ojfpp@smtp.gmail.com>
In-Reply-To: <20171215140603.gxe5i2y6fg5ojfpp@smtp.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: rodrigosiqueira <rodrigosiqueiramelo@gmail.com>, Ingo Molnar <mingo@kernel.org>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org



Thanks; I've slightly changed it, find below. I'll queue it for the next
merge window.

---
Subject: sched: Rework / clarify prepare_lock_switch()
From: rodrigosiqueira <rodrigosiqueiramelo@gmail.com>
Date: Fri, 15 Dec 2017 12:06:03 -0200

The function prepare_lock_switch has an unused parameter, and also the
function name was not descriptive. To improve the readability and remove
the extra parameter, the following changes were made:

* Moved prepare_lock_switch from kernel/sched/sched.h to
  kernel/sched/core.c, renamed it to acquire_task, and removed the
  unused parameter.

* Split the smp_store_release() out from finish_lock_switch() to a
  function named release_task.

* Comments ajdustments.

Signed-off-by: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Link: http://lkml.kernel.org/r/20171215140603.gxe5i2y6fg5ojfpp@smtp.gmail.com
---
 kernel/sched/core.c  |   53 +++++++++++++++++++++++++++++++++++++++++++++++----
 kernel/sched/sched.h |   41 ---------------------------------------
 2 files changed, 49 insertions(+), 45 deletions(-)

--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -2045,7 +2045,7 @@ try_to_wake_up(struct task_struct *p, un
 	 * If the owning (remote) CPU is still in the middle of schedule() with
 	 * this task as prev, wait until its done referencing the task.
 	 *
-	 * Pairs with the smp_store_release() in finish_lock_switch().
+	 * Pairs with the smp_store_release() in release_task().
 	 *
 	 * This ensures that tasks getting woken will be fully ordered against
 	 * their previous state and preserve Program Order.
@@ -2571,6 +2571,50 @@ fire_sched_out_preempt_notifiers(struct
 
 #endif /* CONFIG_PREEMPT_NOTIFIERS */
 
+static inline void acquire_task(struct task_struct *next)
+{
+#ifdef CONFIG_SMP
+	/*
+	 * Claim the task as running, we do this before switching to it
+	 * such that any running task will have this set.
+	 */
+	next->on_cpu = 1;
+#endif
+}
+
+static inline void release_task(struct task_struct *prev)
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
@@ -2591,7 +2635,7 @@ prepare_task_switch(struct rq *rq, struc
 	sched_info_switch(rq, prev, next);
 	perf_event_task_sched_out(prev, next);
 	fire_sched_out_preempt_notifiers(prev, next);
-	prepare_lock_switch(rq, next);
+	acquire_task(next);
 	prepare_arch_switch(next);
 }
 
@@ -2646,7 +2690,7 @@ static struct rq *finish_task_switch(str
 	 * the scheduled task must drop that reference.
 	 *
 	 * We must observe prev->state before clearing prev->on_cpu (in
-	 * finish_lock_switch), otherwise a concurrent wakeup can get prev
+	 * release_task), otherwise a concurrent wakeup can get prev
 	 * running on another CPU and we could rave with its RUNNING -> DEAD
 	 * transition, resulting in a double drop.
 	 */
@@ -2663,7 +2707,8 @@ static struct rq *finish_task_switch(str
 	 * to use.
 	 */
 	smp_mb__after_unlock_lock();
-	finish_lock_switch(rq, prev);
+	release_task(prev);
+	finish_lock_switch(rq);
 	finish_arch_post_lock_switch();
 
 	fire_sched_in_preempt_notifiers(current);
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -1328,47 +1328,6 @@ static inline int task_on_rq_migrating(s
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
