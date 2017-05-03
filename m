From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 03 May 2017 20:36:50 +0000
Subject: [PATCH 1/6] lockdep: Replace 11 seq_puts() calls by seq_putc()
Message-Id: <0fae17e0-1880-e041-293e-8ab3184df6a7@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <3f95acb5-c037-b6fa-7a9b-258b4ae465fb@users.sourceforge.net>
In-Reply-To: <3f95acb5-c037-b6fa-7a9b-258b4ae465fb@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 3 May 2017 21:00:26 +0200

Some single characters should be put into a sequence.
Thus use the corresponding function "seq_putc".

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 kernel/locking/lockdep_proc.c | 24 +++++++++++-------------
 1 file changed, 11 insertions(+), 13 deletions(-)

diff --git a/kernel/locking/lockdep_proc.c b/kernel/locking/lockdep_proc.c
index 6d1fcc786081..825496ece766 100644
--- a/kernel/locking/lockdep_proc.c
+++ b/kernel/locking/lockdep_proc.c
@@ -81,15 +81,14 @@ static int l_show(struct seq_file *m, void *v)
 	print_name(m, class);
-	seq_puts(m, "\n");
+	seq_putc(m, '\n');
 
 	list_for_each_entry(entry, &class->locks_after, entry) {
 		if (entry->distance = 1) {
 			seq_printf(m, " -> [%p] ", entry->class->key);
 			print_name(m, entry->class);
-			seq_puts(m, "\n");
+			seq_putc(m, '\n');
 		}
 	}
-	seq_puts(m, "\n");
-
+	seq_putc(m, '\n');
 	return 0;
 }
 
@@ -156,10 +155,9 @@ static int lc_show(struct seq_file *m, void *v)
 
 		seq_printf(m, "[%p] ", class->key);
 		print_name(m, class);
-		seq_puts(m, "\n");
+		seq_putc(m, '\n');
 	}
-	seq_puts(m, "\n");
-
+	seq_putc(m, '\n');
 	return 0;
 }
 
@@ -393,10 +391,10 @@ static void seq_line(struct seq_file *m, char c, int offset, int length)
 	int i;
 
 	for (i = 0; i < offset; i++)
-		seq_puts(m, " ");
+		seq_putc(m, ' ');
 	for (i = 0; i < length; i++)
 		seq_printf(m, "%c", c);
-	seq_puts(m, "\n");
+	seq_putc(m, '\n');
 }
 
 static void snprint_time(char *buf, size_t bufsiz, s64 nr)
@@ -483,7 +481,7 @@ static void seq_stats(struct seq_file *m, struct lock_stat_data *data)
 		seq_lock_time(m, &stats->write_waittime);
 		seq_printf(m, " %14lu ", stats->bounces[bounce_acquired_write]);
 		seq_lock_time(m, &stats->write_holdtime);
-		seq_puts(m, "\n");
+		seq_putc(m, '\n');
 	}
 
 	if (stats->read_holdtime.nr) {
@@ -492,7 +490,7 @@ static void seq_stats(struct seq_file *m, struct lock_stat_data *data)
 		seq_lock_time(m, &stats->read_waittime);
 		seq_printf(m, " %14lu ", stats->bounces[bounce_acquired_read]);
 		seq_lock_time(m, &stats->read_holdtime);
-		seq_puts(m, "\n");
+		seq_putc(m, '\n');
 	}
 
 	if (stats->read_waittime.nr + stats->write_waittime.nr = 0)
@@ -532,9 +530,9 @@ static void seq_stats(struct seq_file *m, struct lock_stat_data *data)
 			   ip, (void *)class->contending_point[i]);
 	}
 	if (i) {
-		seq_puts(m, "\n");
+		seq_putc(m, '\n');
 		seq_line(m, '.', 0, 40 + 1 + 12 * (14 + 1));
-		seq_puts(m, "\n");
+		seq_putc(m, '\n');
 	}
 }
 
-- 
2.12.2

