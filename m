From: Javier Martinez Canillas <martinez.javier@gmail.com>
Date: Sat, 31 Oct 2009 05:06:03 +0000
Subject: trace/ftrace.c: Fix compile warnings
Message-Id: <1256965563.4278.7.camel@laptop>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

This patch is against linux-next 20091030. 

It solves two compile warning on kernel/trace/ftrace.c.

Signed-off-by: Javier Martinez Canillas <martinez.javier@gmail.com>
---
 kernel/trace/ftrace.c |    9 ++++++---
 1 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/kernel/trace/ftrace.c b/kernel/trace/ftrace.c
index 1ed514f..7f3756d 100644
--- a/kernel/trace/ftrace.c
+++ b/kernel/trace/ftrace.c
@@ -2274,7 +2274,9 @@ void ftrace_set_notrace(unsigned char *buf, int len, int reset)
 #define FTRACE_FILTER_SIZE		COMMAND_LINE_SIZE
 static char ftrace_notrace_buf[FTRACE_FILTER_SIZE] __initdata;
 static char ftrace_filter_buf[FTRACE_FILTER_SIZE] __initdata;
+#ifdef CONFIG_FUNCTION_GRAPH_TRACER
 static char ftrace_graph_buf[FTRACE_FILTER_SIZE] __initdata;
+#endif
 
 static int __init set_ftrace_notrace(char *str)
 {
@@ -2987,6 +2989,7 @@ ftrace_pid_write(struct file *filp, const char __user *ubuf,
 {
 	char buf[64];
 	long val;
+	char *bufstr;
 	int ret;
 
 	if (cnt >= sizeof(buf))
@@ -3001,11 +3004,11 @@ ftrace_pid_write(struct file *filp, const char __user *ubuf,
 	 * Allow "echo > set_ftrace_pid" or "echo -n '' > set_ftrace_pid"
 	 * to clean the filter quietly.
 	 */
-	strstrip(buf);
-	if (strlen(buf) = 0)
+	bufstr = strstrip(buf);
+	if (strlen(bufstr) = 0)
 		return 1;
 
-	ret = strict_strtol(buf, 10, &val);
+	ret = strict_strtol(bufstr, 10, &val);
 	if (ret < 0)
 		return ret;
 
-- 
1.6.0.4



