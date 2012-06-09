From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 09 Jun 2012 16:10:27 +0000
Subject: [patch] ftrace: clear bits properly in reset_iter_read()
Message-Id: <20120609161027.GD6488@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Frederic Weisbecker <fweisbec@gmail.com>, Ingo Molnar <mingo@redhat.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

There is a typo here where '&' is used instead of '|' and it turns the
statement into a noop.  The original code is equivalent to:

	iter->flags &= ~((1 << 2) & (1 << 4));

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
This is a static checker fix and I'm not super familiar with ftrace.
Please review carefully.

diff --git a/kernel/trace/ftrace.c b/kernel/trace/ftrace.c
index a008663..97da2dc 100644
--- a/kernel/trace/ftrace.c
+++ b/kernel/trace/ftrace.c
@@ -2358,7 +2358,7 @@ static void reset_iter_read(struct ftrace_iterator *iter)
 {
 	iter->pos = 0;
 	iter->func_pos = 0;
-	iter->flags &= ~(FTRACE_ITER_PRINTALL & FTRACE_ITER_HASH);
+	iter->flags &= ~(FTRACE_ITER_PRINTALL | FTRACE_ITER_HASH);
 }
 
 static void *t_start(struct seq_file *m, loff_t *pos)
