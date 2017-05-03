From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 03 May 2017 20:38:59 +0000
Subject: [PATCH 3/6] lockdep: Replace four seq_printf() calls by seq_puts()
Message-Id: <38fbeb11-8a3f-69f2-ff04-4cd9b61250b8@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <3f95acb5-c037-b6fa-7a9b-258b4ae465fb@users.sourceforge.net>
In-Reply-To: <3f95acb5-c037-b6fa-7a9b-258b4ae465fb@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 3 May 2017 21:46:49 +0200

Four strings which did not contain data format specifications should be put
into a sequence. Thus use the corresponding function "seq_puts".

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 kernel/locking/lockdep_proc.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/kernel/locking/lockdep_proc.c b/kernel/locking/lockdep_proc.c
index b1fa2ae31c0b..a353f53b6de6 100644
--- a/kernel/locking/lockdep_proc.c
+++ b/kernel/locking/lockdep_proc.c
@@ -61,7 +61,7 @@ static int l_show(struct seq_file *m, void *v)
 	char usage[LOCK_USAGE_CHARS];
 
 	if (v = &all_lock_classes) {
-		seq_printf(m, "all lock classes:\n");
+		seq_puts(m, "all lock classes:\n");
 		return 0;
 	}
 
@@ -141,8 +141,8 @@ static int lc_show(struct seq_file *m, void *v)
 
 	if (v = SEQ_START_TOKEN) {
 		if (nr_chain_hlocks > MAX_LOCKDEP_CHAIN_HLOCKS)
-			seq_printf(m, "(buggered) ");
-		seq_printf(m, "all lock chains:\n");
+			seq_puts(m, "(buggered) ");
+		seq_puts(m, "all lock chains:\n");
 		return 0;
 	}
 
@@ -541,7 +541,7 @@ static void seq_header(struct seq_file *m)
 	seq_puts(m, "lock_stat version 0.4\n");
 
 	if (unlikely(!debug_locks))
-		seq_printf(m, "*WARNING* lock debugging disabled!! - possibly due to a lockdep warning\n");
+		seq_puts(m, "*WARNING* lock debugging disabled!! - possibly due to a lockdep warning\n");
 
 	seq_line(m, '-', 0, 40 + 1 + 12 * (14 + 1));
 	seq_printf(m, "%40s %14s %14s %14s %14s %14s %14s %14s %14s %14s %14s "
-- 
2.12.2

