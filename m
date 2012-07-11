From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 11 Jul 2012 06:35:08 +0000
Subject: [patch] tracing: check for allocation failure
Message-Id: <20120711063507.GF11812@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Frederic Weisbecker <fweisbec@gmail.com>, Ingo Molnar <mingo@redhat.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Clean up and return -ENOMEM on if the kzalloc() fails.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/kernel/trace/trace.c b/kernel/trace/trace.c
index 814ff30..a120f98 100644
--- a/kernel/trace/trace.c
+++ b/kernel/trace/trace.c
@@ -2390,6 +2390,9 @@ __tracing_open(struct inode *inode, struct file *file)
 
 	iter->buffer_iter = kzalloc(sizeof(*iter->buffer_iter) * num_possible_cpus(),
 				    GFP_KERNEL);
+	if (!iter->buffer_iter)
+		goto release;
+
 	/*
 	 * We make a copy of the current tracer to avoid concurrent
 	 * changes on it while we are reading.
@@ -2451,6 +2454,7 @@ __tracing_open(struct inode *inode, struct file *file)
 	mutex_unlock(&trace_types_lock);
 	kfree(iter->trace);
 	kfree(iter->buffer_iter);
+release:
 	seq_release_private(inode, file);
 	return ERR_PTR(-ENOMEM);
 }
