From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 17 Jan 2020 05:30:07 +0000
Subject: [PATCH] tracing/boot: Fix an IS_ERR() vs NULL bug
Message-Id: <20200117053007.5h2juv272pokqhtq@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Steven Rostedt (VMware)" <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>
Cc: Ingo Molnar <mingo@redhat.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

The trace_array_get_by_name() function doesn't return error pointers,
it returns NULL on error.

Fixes: 4f712a4d04a4 ("tracing/boot: Add instance node support")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 kernel/trace/trace_boot.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/trace/trace_boot.c b/kernel/trace/trace_boot.c
index fa9603dc6469..cd541ac1cbc1 100644
--- a/kernel/trace/trace_boot.c
+++ b/kernel/trace/trace_boot.c
@@ -322,7 +322,7 @@ trace_boot_init_instances(struct xbc_node *node)
 			continue;
 
 		tr = trace_array_get_by_name(p);
-		if (IS_ERR(tr)) {
+		if (!tr) {
 			pr_err("Failed to get trace instance %s\n", p);
 			continue;
 		}
-- 
2.11.0
