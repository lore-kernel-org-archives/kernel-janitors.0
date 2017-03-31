From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 31 Mar 2017 15:21:30 +0000
Subject: [PATCH] ftrace: Remove an unneeded condition
Message-Id: <20170331152130.GA4947@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Ingo Molnar <mingo@redhat.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

We know that "mod_matches" is true here so there is no need to check
again.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/kernel/trace/ftrace.c b/kernel/trace/ftrace.c
index b9691ee8f6c1..efa396f183d2 100644
--- a/kernel/trace/ftrace.c
+++ b/kernel/trace/ftrace.c
@@ -3586,7 +3586,7 @@ ftrace_match_record(struct dyn_ftrace *rec, struct ftrace_glob *func_g,
 				return 0;
 		}
 
-		if (mod_matches && exclude_mod)
+		if (exclude_mod)
 			return 0;
 
 func_match:
