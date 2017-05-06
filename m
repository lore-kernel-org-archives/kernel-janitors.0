From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 06 May 2017 19:43:59 +0000
Subject: [PATCH 3/3] kernel-sched: Combine two seq_printf() calls into one in show_schedstat()
Message-Id: <3ca7e838-0cdb-c014-e28d-b0507d9255f8@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <ece07743-9bbb-e396-b562-ba161c3eb9b8@users.sourceforge.net>
In-Reply-To: <ece07743-9bbb-e396-b562-ba161c3eb9b8@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 6 May 2017 21:26:19 +0200

Some data were put into a sequence by two separate function calls.
Print the same data by a single function call instead.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 kernel/sched/stats.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/kernel/sched/stats.c b/kernel/sched/stats.c
index 87e2c9f0c33e..05ee4b6dcfca 100644
--- a/kernel/sched/stats.c
+++ b/kernel/sched/stats.c
@@ -30,15 +30,11 @@ static int show_schedstat(struct seq_file *seq, void *v)
 
 		/* runqueue-specific stats */
 		seq_printf(seq,
-		    "cpu%d %u 0 %u %u %u %u %llu %llu %lu",
-		    cpu, rq->yld_count,
-		    rq->sched_count, rq->sched_goidle,
-		    rq->ttwu_count, rq->ttwu_local,
-		    rq->rq_cpu_time,
-		    rq->rq_sched_info.run_delay, rq->rq_sched_info.pcount);
-
-		seq_printf(seq, "\n");
-
+			   "cpu%d %u 0 %u %u %u %u %llu %llu %lu\n",
+			   cpu, rq->yld_count, rq->sched_count,
+			   rq->sched_goidle, rq->ttwu_count, rq->ttwu_local,
+			   rq->rq_cpu_time, rq->rq_sched_info.run_delay,
+			   rq->rq_sched_info.pcount);
 #ifdef CONFIG_SMP
 		/* domain-specific stats */
 		rcu_read_lock();
-- 
2.12.2

