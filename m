From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 05 Sep 2020 12:50:20 +0000
Subject: [PATCH] tracing: remove a pointless assignment
Message-Id: <20200905125020.GD183976@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

The "tr" is a stack variable so setting it to NULL before a return is
a no-op.  Delete the assignment.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 kernel/trace/trace.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/kernel/trace/trace.c b/kernel/trace/trace.c
index f40d850ebabc..a19b56f24350 100644
--- a/kernel/trace/trace.c
+++ b/kernel/trace/trace.c
@@ -8799,7 +8799,6 @@ static int __remove_instance(struct trace_array *tr)
 	free_cpumask_var(tr->tracing_cpumask);
 	kfree(tr->name);
 	kfree(tr);
-	tr = NULL;
 
 	return 0;
 }
-- 
2.28.0
