From: Dan Carpenter <error27@gmail.com>
Date: Sat, 06 Mar 2010 11:17:52 +0000
Subject: [patch] sched: cleanup: remove unused variable in try_to_wake_up()
Message-Id: <20100306111752.GL4958@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ingo Molnar <mingo@elte.hu>
Cc: Peter Zijlstra <peterz@infradead.org>, Andreas Herrmann <andreas.herrmann3@amd.com>, Thomas Gleixner <tglx@linutronix.de>, Gautham R Shenoy <ego@in.ibm.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, efault@gmx.de

We haven't used the "orig_rq" variable since 
055a00865d "Fix/add missing update_rq_clock() calls"

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/kernel/sched.c b/kernel/sched.c
index abb36b1..523c750 100644
--- a/kernel/sched.c
+++ b/kernel/sched.c
@@ -2359,7 +2359,7 @@ static int try_to_wake_up(struct task_struct *p, unsigned int state,
 {
 	int cpu, orig_cpu, this_cpu, success = 0;
 	unsigned long flags;
-	struct rq *rq, *orig_rq;
+	struct rq *rq;
 
 	if (!sched_feat(SYNC_WAKEUPS))
 		wake_flags &= ~WF_SYNC;
@@ -2367,7 +2367,7 @@ static int try_to_wake_up(struct task_struct *p, unsigned int state,
 	this_cpu = get_cpu();
 
 	smp_wmb();
-	rq = orig_rq = task_rq_lock(p, &flags);
+	rq = task_rq_lock(p, &flags);
 	update_rq_clock(rq);
 	if (!(p->state & state))
 		goto out;
