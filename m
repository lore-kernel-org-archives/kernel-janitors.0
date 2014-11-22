From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 22 Nov 2014 18:30:12 +0000
Subject: [patch] tracing: remove unneeded NULL check
Message-Id: <20141122183012.GB6994@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Ingo Molnar <mingo@redhat.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

We checked "iter->trace" earlier so there is no need to check here.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/kernel/trace/trace.c b/kernel/trace/trace.c
index 9ddd6aa..52fbbc5 100644
--- a/kernel/trace/trace.c
+++ b/kernel/trace/trace.c
@@ -3019,7 +3019,7 @@ __tracing_open(struct inode *inode, struct file *file, bool snapshot)
 	mutex_init(&iter->mutex);
 
 	/* Notify the tracer early; before we stop tracing. */
-	if (iter->trace && iter->trace->open)
+	if (iter->trace->open)
 		iter->trace->open(iter);
 
 	/* Annotate start of buffers if we had overruns */
