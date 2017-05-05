From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 05 May 2017 21:02:31 +0000
Subject: [PATCH 2/7] kernel-trace: Replace five seq_puts() calls by seq_putc()
Message-Id: <d7f03e83-07f8-b8d8-9a22-41dceb5de174@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <3419381c-6a8f-f0f6-86e8-3ee7f9af0076@users.sourceforge.net>
In-Reply-To: <3419381c-6a8f-f0f6-86e8-3ee7f9af0076@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ingo Molnar <mingo@redhat.com>, Steven Rostedt <rostedt@goodmis.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 5 May 2017 19:45:12 +0200

Five single characters should be put into a sequence.
Thus use the corresponding function "seq_putc".

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 kernel/trace/trace_events_hist.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/kernel/trace/trace_events_hist.c b/kernel/trace/trace_events_hist.c
index 94999934ffd5..df566e21344d 100644
--- a/kernel/trace/trace_events_hist.c
+++ b/kernel/trace/trace_events_hist.c
@@ -1013,7 +1013,7 @@ hist_trigger_entry_print(struct seq_file *m,
 	}
 
 	if (!multiline)
-		seq_puts(m, " ");
+		seq_putc(m, ' ');
 
 	seq_printf(m, "} hitcount: %10llu",
 		   tracing_map_read_sum(elt, HITCOUNT_IDX));
@@ -1030,7 +1030,7 @@ hist_trigger_entry_print(struct seq_file *m,
 		}
 	}
 
-	seq_puts(m, "\n");
+	seq_putc(m, '\n');
 }
 
 static int print_entries(struct seq_file *m,
@@ -1168,7 +1168,7 @@ static int event_hist_trigger_print(struct seq_file *m,
 		key_field = hist_data->fields[i];
 
 		if (i > hist_data->n_vals)
-			seq_puts(m, ",");
+			seq_putc(m, ',');
 
 		if (key_field->flags & HIST_FIELD_FL_STACKTRACE)
 			seq_puts(m, "stacktrace");
@@ -1182,7 +1182,7 @@ static int event_hist_trigger_print(struct seq_file *m,
 		if (i = HITCOUNT_IDX)
 			seq_puts(m, "hitcount");
 		else {
-			seq_puts(m, ",");
+			seq_putc(m, ',');
 			hist_field_print(m, hist_data->fields[i]);
 		}
 	}
@@ -1195,7 +1195,7 @@ static int event_hist_trigger_print(struct seq_file *m,
 		sort_key = &hist_data->sort_keys[i];
 
 		if (i > 0)
-			seq_puts(m, ",");
+			seq_putc(m, ',');
 
 		if (sort_key->field_idx = HITCOUNT_IDX)
 			seq_puts(m, "hitcount");
-- 
2.12.2

