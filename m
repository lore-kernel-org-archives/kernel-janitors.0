From: Peter Senna Tschudin <peter.senna@gmail.com>
Date: Sat, 17 May 2014 18:22:57 +0000
Subject: [PATCH 1/4] VMCI: Remove redundant error check
Message-Id: <1400350980-30455-1-git-send-email-peter.senna@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: Peter Senna Tschudin <peter.senna@gmail.com>, kernel-janitors@vger.kernel.org

Remove double checks, and move the call to pr_devel to the
first check. The simplified version of the coccinelle semantic
patch that fixes this issue is as follows:

// <smpl>
@@
expression E; identifier pr; expression list es;
@@
for(...;...;...){
...
-	if (E) break;
+	if (E){
+		pr(es);
+		break;
+	}
...
}
- if(E) pr(es);
// </smpl>

Tested by compilation only.

Signed-off-by: Peter Senna Tschudin <peter.senna@gmail.com>

---
 drivers/misc/vmw_vmci/vmci_context.c |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/misc/vmw_vmci/vmci_context.c b/drivers/misc/vmw_vmci/vmci_context.c
index f866a4b..3995e64 100644
--- a/drivers/misc/vmw_vmci/vmci_context.c
+++ b/drivers/misc/vmw_vmci/vmci_context.c
@@ -836,12 +836,12 @@ int vmci_ctx_set_chkpt_state(u32 context_id,
 	for (i = 0; i < num_ids && result = VMCI_SUCCESS; i++) {
 		current_id = ((u32 *)cpt_buf)[i];
 		result = vmci_ctx_add_notification(context_id, current_id);
-		if (result != VMCI_SUCCESS)
+		if (result != VMCI_SUCCESS) {
+			pr_devel("Failed to set cpt state (type=%d) (error=%d)\n",
+				 cpt_type, result);
 			break;
+		}
 	}
-	if (result != VMCI_SUCCESS)
-		pr_devel("Failed to set cpt state (type=%d) (error=%d)\n",
-			 cpt_type, result);
 
 	return result;
 }

