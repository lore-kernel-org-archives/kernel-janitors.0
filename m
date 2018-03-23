From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 23 Mar 2018 11:37:36 +0000
Subject: [PATCH] tracing: Fix a potential NULL dereference
Message-Id: <20180323113735.GC28518@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Steven Rostedt <rostedt@goodmis.org>, Tom Zanussi <tom.zanussi@linux.intel.com>
Cc: Ingo Molnar <mingo@redhat.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

We forgot to set the error code on this path so we return ERR_PTR(0)
which is NULL.  It results in a NULL dereference in the caller.

Fixes: 100719dcef44 ("tracing: Add simple expression support to hist triggers")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/kernel/trace/trace_events_hist.c b/kernel/trace/trace_events_hist.c
index 4f027642ceef..a02bc09d765a 100644
--- a/kernel/trace/trace_events_hist.c
+++ b/kernel/trace/trace_events_hist.c
@@ -2776,6 +2776,7 @@ static struct hist_field *parse_expr(struct hist_trigger_data *hist_data,
 		expr->fn = hist_field_plus;
 		break;
 	default:
+		ret = -EINVAL;
 		goto free;
 	}
 
