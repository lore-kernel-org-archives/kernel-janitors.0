From: Colin King <colin.king@canonical.com>
Date: Fri, 15 Nov 2019 08:59:38 +0000
Subject: [PATCH][next] ftrace: fix spelling mistake "wakeing" -> "waking"
Message-Id: <20191115085938.38947-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Steven Rostedt <rostedt@goodmis.org>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in a trace_printk message. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 samples/ftrace/ftrace-direct.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/samples/ftrace/ftrace-direct.c b/samples/ftrace/ftrace-direct.c
index 1483f067b000..a2e3063bd306 100644
--- a/samples/ftrace/ftrace-direct.c
+++ b/samples/ftrace/ftrace-direct.c
@@ -6,7 +6,7 @@
 
 void my_direct_func(struct task_struct *p)
 {
-	trace_printk("wakeing up %s-%d\n", p->comm, p->pid);
+	trace_printk("waking up %s-%d\n", p->comm, p->pid);
 }
 
 extern void my_tramp(void *);
-- 
2.20.1
