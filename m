From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 05 May 2017 21:01:44 +0000
Subject: [PATCH 1/7] kernel-trace: Combine two function calls into one in hist_trigger_entry_print()
Message-Id: <7f9cad99-4eb5-7b3f-505d-8fa9265f476e@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <3419381c-6a8f-f0f6-86e8-3ee7f9af0076@users.sourceforge.net>
In-Reply-To: <3419381c-6a8f-f0f6-86e8-3ee7f9af0076@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ingo Molnar <mingo@redhat.com>, Steven Rostedt <rostedt@goodmis.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 5 May 2017 19:40:39 +0200

A bit of data was put into a sequence by two separate function calls.
Print the same data by a single function call instead.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 kernel/trace/trace_events_hist.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/kernel/trace/trace_events_hist.c b/kernel/trace/trace_events_hist.c
index 1c21d0e2a145..94999934ffd5 100644
--- a/kernel/trace/trace_events_hist.c
+++ b/kernel/trace/trace_events_hist.c
@@ -1017,7 +1017,5 @@ hist_trigger_entry_print(struct seq_file *m,
 
-	seq_puts(m, "}");
-
-	seq_printf(m, " hitcount: %10llu",
+	seq_printf(m, "} hitcount: %10llu",
 		   tracing_map_read_sum(elt, HITCOUNT_IDX));
 
 	for (i = 1; i < hist_data->n_vals; i++) {
-- 
2.12.2

