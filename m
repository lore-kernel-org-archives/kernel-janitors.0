From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 14 Oct 2016 07:29:08 +0000
Subject: [patch] perf/x86/intel: remove an inconsistent NULL check
Message-Id: <20161014072908.GA15303@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Smatch complains that we don't check "event->ctx" consistently.  It's
never NULL so we can just remove the check.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/arch/x86/events/intel/lbr.c b/arch/x86/events/intel/lbr.c
index fc6cf21..81b321a 100644
--- a/arch/x86/events/intel/lbr.c
+++ b/arch/x86/events/intel/lbr.c
@@ -458,8 +458,8 @@ void intel_pmu_lbr_del(struct perf_event *event)
 	if (!x86_pmu.lbr_nr)
 		return;
 
-	if (branch_user_callstack(cpuc->br_sel) && event->ctx &&
-					event->ctx->task_ctx_data) {
+	if (branch_user_callstack(cpuc->br_sel) &&
+	    event->ctx->task_ctx_data) {
 		task_ctx = event->ctx->task_ctx_data;
 		task_ctx->lbr_callstack_users--;
 	}
