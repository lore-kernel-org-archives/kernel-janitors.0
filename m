From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 05 Feb 2013 11:37:51 +0000
Subject: [patch] sched: signedness bug in yield_to()
Message-Id: <20130205113751.GA20521@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ingo Molnar <mingo@redhat.com>
Cc: Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, kbuild@01.org

In 7b270f6099 "sched: Bail out of yield_to when source and target
runqueue has one task" we changed this to store -ESRCH so it needs to
be signed.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 3e7b280..7ba7ea5 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -4384,7 +4384,7 @@ bool __sched yield_to(struct task_struct *p, bool preempt)
 	struct task_struct *curr = current;
 	struct rq *rq, *p_rq;
 	unsigned long flags;
-	bool yielded = 0;
+	int yielded = 0;
 
 	local_irq_save(flags);
 	rq = this_rq();
