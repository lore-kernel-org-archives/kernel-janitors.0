From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 20 Jun 2018 11:08:00 +0000
Subject: [PATCH] tracing: Fix an off by one in __next()
Message-Id: <20180620110758.crunhd5bfep7zuiz@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Ingo Molnar <mingo@redhat.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

The > should be >= to prevent an off by one bug.

From reviewing the code, it seems possible for
stack_trace_max.nr_entries to be set to .max_entries and in that case we
would be reading one element beyond the end of the stack_dump_trace[]
array.  If it's not set to .max_entries then the bug doesn't affect
runtime.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/kernel/trace/trace_stack.c b/kernel/trace/trace_stack.c
index 4237eba4ef20..6e3edd745c68 100644
--- a/kernel/trace/trace_stack.c
+++ b/kernel/trace/trace_stack.c
@@ -286,7 +286,7 @@ __next(struct seq_file *m, loff_t *pos)
 {
 	long n = *pos - 1;
 
-	if (n > stack_trace_max.nr_entries || stack_dump_trace[n] = ULONG_MAX)
+	if (n >= stack_trace_max.nr_entries || stack_dump_trace[n] = ULONG_MAX)
 		return NULL;
 
 	m->private = (void *)n;
