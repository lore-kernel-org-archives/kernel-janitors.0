From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 12 Jul 2017 07:33:40 +0000
Subject: [PATCH 1/2] ftrace: remove an unneeded NULL check
Message-Id: <20170712073340.4enzeojeoupuds5a@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Ingo Molnar <mingo@redhat.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

"func" can't be NULL and it doesn't make sense to check because we've
already derefenced it.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/kernel/trace/ftrace.c b/kernel/trace/ftrace.c
index 2953d558bbee..2a3c45743f54 100644
--- a/kernel/trace/ftrace.c
+++ b/kernel/trace/ftrace.c
@@ -3950,7 +3950,7 @@ static int cache_mod(struct trace_array *tr,
 				continue;
 
 			/* no func matches all */
-			if (!func || strcmp(func, "*") = 0 ||
+			if (strcmp(func, "*") = 0 ||
 			    (ftrace_mod->func &&
 			     strcmp(ftrace_mod->func, func) = 0)) {
 				ret = 0;
