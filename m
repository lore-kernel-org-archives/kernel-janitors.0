From: Colin King <colin.king@canonical.com>
Date: Wed, 18 Nov 2020 14:13:14 +0000
Subject: [PATCH][next] scsi: lpfc: Fix memory leak on lcb_context
Message-Id: <20201118141314.462471-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: James Smart <james.smart@broadcom.com>, Dick Kennedy <dick.kennedy@broadcom.com>, "James E . J . Bottomley" <jejb@linux.ibm.com>, "Martin K . Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently there is an error return path that neglects to free the
allocation for lcb_context.  Fix this by adding a new error free
exit path that kfree's lcb_context before returning.  Use this new
kfree exit path in another exit error path that also kfree's the same
object, allowing a line of code to be removed.

Addresses-Coverity: ("Resource leak")
Fixes: 4430f7fd09ec ("scsi: lpfc: Rework locations of ndlp reference taking")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/scsi/lpfc/lpfc_els.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/scsi/lpfc/lpfc_els.c b/drivers/scsi/lpfc/lpfc_els.c
index 03f47d1b21fe..0d3271b4c130 100644
--- a/drivers/scsi/lpfc/lpfc_els.c
+++ b/drivers/scsi/lpfc/lpfc_els.c
@@ -6515,18 +6515,20 @@ lpfc_els_rcv_lcb(struct lpfc_vport *vport, struct lpfc_iocbq *cmdiocb,
 	lcb_context->ndlp = lpfc_nlp_get(ndlp);
 	if (!lcb_context->ndlp) {
 		rjt_err = LSRJT_UNABLE_TPC;
-		goto rjt;
+		goto rjt_free;
 	}
 
 	if (lpfc_sli4_set_beacon(vport, lcb_context, state)) {
 		lpfc_printf_vlog(ndlp->vport, KERN_ERR, LOG_TRACE_EVENT,
 				 "0193 failed to send mail box");
-		kfree(lcb_context);
 		lpfc_nlp_put(ndlp);
 		rjt_err = LSRJT_UNABLE_TPC;
-		goto rjt;
+		goto rjt_free;
 	}
 	return 0;
+
+rjt_free:
+	kfree(lcb_context);
 rjt:
 	memset(&stat, 0, sizeof(stat));
 	stat.un.b.lsRjtRsnCode = rjt_err;
-- 
2.28.0
