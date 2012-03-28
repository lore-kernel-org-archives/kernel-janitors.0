From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 28 Mar 2012 10:46:09 +0000
Subject: [patch] cpuset: remove an unused variable
Message-Id: <20120328104608.GD29022@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Paul Menage <paul@paulmenage.org>, Peter Zijlstra <a.p.zijlstra@chello.nl>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Ingo Molnar <mingo@kernel.org>

We don't use "cpu" any more after 2baab4e904 "sched: Fix
select_fallback_rq() vs cpu_active/cpu_online".

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/kernel/cpuset.c b/kernel/cpuset.c
index dfceaca..14f7070 100644
--- a/kernel/cpuset.c
+++ b/kernel/cpuset.c
@@ -2165,7 +2165,6 @@ void cpuset_cpus_allowed(struct task_struct *tsk, struct cpumask *pmask)
 void cpuset_cpus_allowed_fallback(struct task_struct *tsk)
 {
 	const struct cpuset *cs;
-	int cpu;
 
 	rcu_read_lock();
 	cs = task_cs(tsk);
