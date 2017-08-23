From: Colin King <colin.king@canonical.com>
Date: Wed, 23 Aug 2017 11:23:09 +0000
Subject: [PATCH][next] tracing: remove redundant unread variable ret
Message-Id: <20170823112309.19383-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Steven Rostedt <rostedt@goodmis.org>, Ingo Molnar <mingo@redhat.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Integer ret is being assigned but never used and hence it is
redundant. Remove it, fixes clang warning:

trace_events_hist.c:1077:3: warning: Value stored to 'ret' is never read

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 kernel/trace/trace_events_hist.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/kernel/trace/trace_events_hist.c b/kernel/trace/trace_events_hist.c
index 1c21d0e2a145..f123b5d0c226 100644
--- a/kernel/trace/trace_events_hist.c
+++ b/kernel/trace/trace_events_hist.c
@@ -1062,7 +1062,7 @@ static void hist_trigger_show(struct seq_file *m,
 			      struct event_trigger_data *data, int n)
 {
 	struct hist_trigger_data *hist_data;
-	int n_entries, ret = 0;
+	int n_entries;
 
 	if (n > 0)
 		seq_puts(m, "\n\n");
@@ -1073,10 +1073,8 @@ static void hist_trigger_show(struct seq_file *m,
 
 	hist_data = data->private_data;
 	n_entries = print_entries(m, hist_data);
-	if (n_entries < 0) {
-		ret = n_entries;
+	if (n_entries < 0)
 		n_entries = 0;
-	}
 
 	seq_printf(m, "\nTotals:\n    Hits: %llu\n    Entries: %u\n    Dropped: %llu\n",
 		   (u64)atomic64_read(&hist_data->map->hits),
-- 
2.14.1

