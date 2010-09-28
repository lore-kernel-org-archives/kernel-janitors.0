From: matt mooney <mfm@muteddisk.com>
Date: Tue, 28 Sep 2010 02:04:53 +0000
Subject: [PATCH 3/3 RESEND] trace: remove cast from void*
Message-Id: <74a39e380e35d0e6a9bf326669974e51d60f41b4.1285638395.git.mfm@muteddisk.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Unnecessary cast from void* in assignment.

Signed-off-by: matt mooney <mfm@muteddisk.com>
---
 kernel/trace/ftrace.c |    4 ++--
 kernel/trace/trace.c  |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/kernel/trace/ftrace.c b/kernel/trace/ftrace.c
index fa7ece6..f1bd6ff 100644
--- a/kernel/trace/ftrace.c
+++ b/kernel/trace/ftrace.c
@@ -1601,8 +1601,8 @@ ftrace_failures_open(struct inode *inode, struct file *file)
 
 	ret = ftrace_avail_open(inode, file);
 	if (!ret) {
-		m = (struct seq_file *)file->private_data;
-		iter = (struct ftrace_iterator *)m->private;
+		m = file->private_data;
+		iter = m->private;
 		iter->flags = FTRACE_ITER_FAILURES;
 	}
 
diff --git a/kernel/trace/trace.c b/kernel/trace/trace.c
index 9ec59f5..001bcd2 100644
--- a/kernel/trace/trace.c
+++ b/kernel/trace/trace.c
@@ -2196,7 +2196,7 @@ int tracing_open_generic(struct inode *inode, struct file *filp)
 
 static int tracing_release(struct inode *inode, struct file *file)
 {
-	struct seq_file *m = (struct seq_file *)file->private_data;
+	struct seq_file *m = file->private_data;
 	struct trace_iterator *iter;
 	int cpu;
 
-- 
1.7.2.1

