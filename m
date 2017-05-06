From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 06 May 2017 19:41:40 +0000
Subject: [PATCH 1/3] kernel-sched: Use seq_putc() in three functions
Message-Id: <d8c7dddc-9007-4e3d-73d3-3e783383fa25@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <ece07743-9bbb-e396-b562-ba161c3eb9b8@users.sourceforge.net>
In-Reply-To: <ece07743-9bbb-e396-b562-ba161c3eb9b8@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 6 May 2017 20:45:35 +0200

Four single characters (line breaks) should be put into a sequence.
Thus use the corresponding function "seq_putc".

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 kernel/sched/cpuacct.c | 6 +++---
 kernel/sched/debug.c   | 3 +--
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/kernel/sched/cpuacct.c b/kernel/sched/cpuacct.c
index f95ab29a45d0..28d9fe0df92a 100644
--- a/kernel/sched/cpuacct.c
+++ b/kernel/sched/cpuacct.c
@@ -221,7 +221,7 @@ static int __cpuacct_percpu_seq_show(struct seq_file *m,
 		percpu = cpuacct_cpuusage_read(ca, i, index);
 		seq_printf(m, "%llu ", (unsigned long long) percpu);
 	}
-	seq_printf(m, "\n");
+	seq_putc(m, '\n');
 	return 0;
 }
 
@@ -249,7 +249,7 @@ static int cpuacct_all_seq_show(struct seq_file *m, void *V)
 	seq_puts(m, "cpu");
 	for (index = 0; index < CPUACCT_STAT_NSTATS; index++)
 		seq_printf(m, " %s", cpuacct_stat_desc[index]);
-	seq_puts(m, "\n");
+	seq_putc(m, '\n');
 
 	for_each_possible_cpu(cpu) {
 		struct cpuacct_usage *cpuusage = per_cpu_ptr(ca->cpuusage, cpu);
@@ -271,7 +271,7 @@ static int cpuacct_all_seq_show(struct seq_file *m, void *V)
 			raw_spin_unlock_irq(&cpu_rq(cpu)->lock);
 #endif
 		}
-		seq_puts(m, "\n");
+		seq_putc(m, '\n');
 	}
 	return 0;
 }
diff --git a/kernel/sched/debug.c b/kernel/sched/debug.c
index 38f019324f1a..ff599b7f10b6 100644
--- a/kernel/sched/debug.c
+++ b/kernel/sched/debug.c
@@ -78,8 +78,7 @@ static int sched_feat_show(struct seq_file *m, void *v)
 			seq_puts(m, "NO_");
 		seq_printf(m, "%s ", sched_feat_names[i]);
 	}
-	seq_puts(m, "\n");
-
+	seq_putc(m, '\n');
 	return 0;
 }
 
-- 
2.12.2

