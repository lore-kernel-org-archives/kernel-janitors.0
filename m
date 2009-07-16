From: jolsa@redhat.com
Date: Thu, 16 Jul 2009 19:44:26 +0000
Subject: [PATCH 1/3] tracing: removing not used variables
Message-Id: <1247773468-11594-2-git-send-email-jolsa@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1247773468-11594-1-git-send-email-jolsa@redhat.com>
In-Reply-To: <1247773468-11594-1-git-send-email-jolsa@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mingo@elte.hu, rostedt@goodmis.org
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Removing not used variables.

wbr,
jirka

Signed-off-by: Jiri Olsa <jolsa@redhat.com>

---
 kernel/trace/ftrace.c |    3 ---
 kernel/trace/trace.c  |    3 +--
 2 files changed, 1 insertions(+), 5 deletions(-)

diff --git a/kernel/trace/ftrace.c b/kernel/trace/ftrace.c
index 4521c77..1dc08ab 100644
--- a/kernel/trace/ftrace.c
+++ b/kernel/trace/ftrace.c
@@ -1375,7 +1375,6 @@ struct ftrace_iterator {
 	unsigned		flags;
 	unsigned char		buffer[FTRACE_BUFF_MAX+1];
 	unsigned		buffer_idx;
-	unsigned		filtered;
 };
 
 static void *
@@ -2312,7 +2311,6 @@ ftrace_regex_write(struct file *file, const char __user *ubuf,
 	}
 
 	if (isspace(ch)) {
-		iter->filtered++;
 		iter->buffer[iter->buffer_idx] = 0;
 		ret = ftrace_process_regex(iter->buffer,
 					   iter->buffer_idx, enable);
@@ -2443,7 +2441,6 @@ ftrace_regex_release(struct inode *inode, struct file *file, int enable)
 		iter = file->private_data;
 
 	if (iter->buffer_idx) {
-		iter->filtered++;
 		iter->buffer[iter->buffer_idx] = 0;
 		ftrace_match_records(iter->buffer, iter->buffer_idx, enable);
 	}
diff --git a/kernel/trace/trace.c b/kernel/trace/trace.c
index 8bc8d8a..d8bb7fd 100644
--- a/kernel/trace/trace.c
+++ b/kernel/trace/trace.c
@@ -4268,7 +4268,6 @@ void ftrace_dump(void)
 
 __init static int tracer_alloc_buffers(void)
 {
-	struct trace_array_cpu *data;
 	int ring_buf_size;
 	int i;
 	int ret = -ENOMEM;
@@ -4318,7 +4317,7 @@ __init static int tracer_alloc_buffers(void)
 
 	/* Allocate the first page for all buffers */
 	for_each_tracing_cpu(i) {
-		data = global_trace.data[i] = &per_cpu(global_trace_cpu, i);
+		global_trace.data[i] = &per_cpu(global_trace_cpu, i);
 		max_tr.data[i] = &per_cpu(max_data, i);
 	}
 
-- 
1.6.2.5

