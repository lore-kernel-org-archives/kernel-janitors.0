From: Chunyu Hu <chuhu@redhat.com>
Date: Mon, 14 Mar 2016 12:35:41 +0000
Subject: [PATCH] tracing: fix a potential mutex deadlock in register_tracer
Message-Id: <1457958941-30265-1-git-send-email-chuhu@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: rostedt@goodmis.org
Cc: mingo@redhat.com, dan.carpenter@oracle.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

commit d39cdd2036a63eef17a14efbd969405ca5612886 ("tracing: Make
tracer_flags use the right set_flag callback")  introduces a potential
mutex deadlock issue, as it forgets to free the mutex when allocaing
the tracer_flags gets fail. This patch fix the issue. The issue was
found by Dan Carpenter through Smatch static code check tool.

Signed-off-by: Chunyu Hu <chuhu@redhat.com>
---
 kernel/trace/trace.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/kernel/trace/trace.c b/kernel/trace/trace.c
index b401a18..0ae4604 100644
--- a/kernel/trace/trace.c
+++ b/kernel/trace/trace.c
@@ -1256,8 +1256,10 @@ int __init register_tracer(struct tracer *type)
 	if (!type->flags) {
 		/*allocate a dummy tracer_flags*/
 		type->flags = kmalloc(sizeof(*type->flags), GFP_KERNEL);
-		if (!type->flags)
-			return -ENOMEM;
+		if (!type->flags) {
+			ret = -ENOMEM;
+			goto out;
+		}
 		type->flags->val = 0;
 		type->flags->opts = dummy_tracer_opt;
 	} else
-- 
1.8.3.1

