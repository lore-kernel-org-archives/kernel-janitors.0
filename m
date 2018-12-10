From: Colin King <colin.king@canonical.com>
Date: Mon, 10 Dec 2018 23:20:06 +0000
Subject: [PATCH][tracing-next] tracing: fix uninitialized return value if dyn_event_ops_list list is empty
Message-Id: <20181210232006.12348-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Steven Rostedt <rostedt@goodmis.org>, Ingo Molnar <mingo@redhat.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently, in the unlikely case when the dyn_event_ops_list list is
empty then ret is never assigned a value and the function will return
with a uninitialized garbage return value from ret.  Fix this corner
case by setting ret to zero.

Fixes: 5448d44c3855 ("tracing: Add unified dynamic event framework")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 kernel/trace/trace_dynevent.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/trace/trace_dynevent.c b/kernel/trace/trace_dynevent.c
index dd1f43588d70..4f633476c307 100644
--- a/kernel/trace/trace_dynevent.c
+++ b/kernel/trace/trace_dynevent.c
@@ -74,7 +74,7 @@ int dyn_event_release(int argc, char **argv, struct dyn_event_operations *type)
 static int create_dyn_event(int argc, char **argv)
 {
 	struct dyn_event_operations *ops;
-	int ret;
+	int ret = 0;
 
 	if (argv[0][0] = '-' || argv[0][0] = '!')
 		return dyn_event_release(argc, argv, NULL);
-- 
2.19.1
