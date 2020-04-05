From: Colin King <colin.king@canonical.com>
Date: Sun, 05 Apr 2020 13:01:34 +0000
Subject: [PATCH] ftrace: remove redundant assignment to pointer 'name'
Message-Id: <20200405130134.376247-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Steven Rostedt <rostedt@goodmis.org>, Ingo Molnar <mingo@redhat.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The pointer 'name' is being initialized with a value that is never read
and it is being updated later with a new value. The initialization
is redundant and can be removed. Replace it with the later assignment.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 kernel/trace/trace.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/kernel/trace/trace.c b/kernel/trace/trace.c
index 6519b7afc499..7f763edc7195 100644
--- a/kernel/trace/trace.c
+++ b/kernel/trace/trace.c
@@ -3783,9 +3783,7 @@ print_trace_header(struct seq_file *m, struct trace_iterator *iter)
 	struct tracer *type = iter->trace;
 	unsigned long entries;
 	unsigned long total;
-	const char *name = "preemption";
-
-	name = type->name;
+	const char *name = type->name;
 
 	get_total_entries(buf, &total, &entries);
 
-- 
2.25.1
