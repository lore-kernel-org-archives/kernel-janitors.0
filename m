From: James Smart <jsmart2021@gmail.com>
Date: Wed, 20 May 2020 18:59:27 +0000
Subject: [PATCH 1/3] lpfc: Fix pointer checks and comments in LS receive refactoring
Message-Id: <20200520185929.48779-2-jsmart2021@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200520185929.48779-1-jsmart2021@gmail.com>
In-Reply-To: <20200520185929.48779-1-jsmart2021@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: linux-nvme@lists.infradead.org
Cc: axboe@kernel.dk, James Smart <jsmart2021@gmail.com>, martin.petersen@oracle.com, linux-scsi@vger.kernel.org, jejb@linux.ibm.com, kernel-janitors@vger.kernel.org, hch@infradead.org, paul.ely@broadcom.com, hare@suse.de, dan.carpenter@oracle.com

Additional testing encountered null pointers that weren't fully qualified
in lpfc_nvmet_xmt_ls_abort_cmp() and lpfc_nvmet_unsol_issue_abort().

The same error was detected and reported by static checker reporting:
  drivers/scsi/lpfc/lpfc_sli.c:2905 lpfc_nvme_unsol_ls_handler()
  error: we previously assumed 'phba->targetport' could be null
    (see line 2837)

Fix by making phba->nvmet_support and phba->targetport validity checks
in lpfc_nvmet_xmt_ls_abort_cmp() and lpfc_nvmet_unsol_issue_abort().

Fixes: 3a8070c567aaa (“lpfc: Refactor NVME LS receive handling”)
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Paul Ely <paul.ely@broadcom.com>
Signed-off-by: James Smart <jsmart2021@gmail.com>
---
 drivers/scsi/lpfc/lpfc_nvmet.c | 26 +++++++++++++++++---------
 1 file changed, 17 insertions(+), 9 deletions(-)

diff --git a/drivers/scsi/lpfc/lpfc_nvmet.c b/drivers/scsi/lpfc/lpfc_nvmet.c
index 1c6bbbba70b5..bccf9da302ee 100644
--- a/drivers/scsi/lpfc/lpfc_nvmet.c
+++ b/drivers/scsi/lpfc/lpfc_nvmet.c
@@ -3207,8 +3207,10 @@ lpfc_nvmet_xmt_ls_abort_cmp(struct lpfc_hba *phba, struct lpfc_iocbq *cmdwqe,
 	ctxp = cmdwqe->context2;
 	result = wcqe->parameter;
 
-	tgtp = (struct lpfc_nvmet_tgtport *)phba->targetport->private;
-	atomic_inc(&tgtp->xmt_ls_abort_cmpl);
+	if (phba->nvmet_support) {
+		tgtp = (struct lpfc_nvmet_tgtport *)phba->targetport->private;
+		atomic_inc(&tgtp->xmt_ls_abort_cmpl);
+	}
 
 	lpfc_printf_log(phba, KERN_INFO, LOG_NVME_ABTS,
 			"6083 Abort cmpl: ctx x%px WCQE:%08x %08x %08x %08x\n",
@@ -3244,7 +3246,7 @@ lpfc_nvmet_unsol_issue_abort(struct lpfc_hba *phba,
 			     struct lpfc_async_xchg_ctx *ctxp,
 			     uint32_t sid, uint16_t xri)
 {
-	struct lpfc_nvmet_tgtport *tgtp;
+	struct lpfc_nvmet_tgtport *tgtp = NULL;
 	struct lpfc_iocbq *abts_wqeq;
 	union lpfc_wqe128 *wqe_abts;
 	struct lpfc_nodelist *ndlp;
@@ -3253,13 +3255,15 @@ lpfc_nvmet_unsol_issue_abort(struct lpfc_hba *phba,
 			"6067 ABTS: sid %x xri x%x/x%x\n",
 			sid, xri, ctxp->wqeq->sli4_xritag);
 
-	tgtp = (struct lpfc_nvmet_tgtport *)phba->targetport->private;
+	if (phba->nvmet_support && phba->targetport)
+		tgtp = (struct lpfc_nvmet_tgtport *)phba->targetport->private;
 
 	ndlp = lpfc_findnode_did(phba->pport, sid);
 	if (!ndlp || !NLP_CHK_NODE_ACT(ndlp) ||
 	    ((ndlp->nlp_state != NLP_STE_UNMAPPED_NODE) &&
 	    (ndlp->nlp_state != NLP_STE_MAPPED_NODE))) {
-		atomic_inc(&tgtp->xmt_abort_rsp_error);
+		if (tgtp)
+			atomic_inc(&tgtp->xmt_abort_rsp_error);
 		lpfc_printf_log(phba, KERN_ERR, LOG_NVME_ABTS,
 				"6134 Drop ABTS - wrong NDLP state x%x.\n",
 				(ndlp) ? ndlp->nlp_state : NLP_STE_MAX_STATE);
@@ -3538,7 +3542,7 @@ lpfc_nvme_unsol_ls_issue_abort(struct lpfc_hba *phba,
 				struct lpfc_async_xchg_ctx *ctxp,
 				uint32_t sid, uint16_t xri)
 {
-	struct lpfc_nvmet_tgtport *tgtp;
+	struct lpfc_nvmet_tgtport *tgtp = NULL;
 	struct lpfc_iocbq *abts_wqeq;
 	unsigned long flags;
 	int rc;
@@ -3555,7 +3559,9 @@ lpfc_nvme_unsol_ls_issue_abort(struct lpfc_hba *phba,
 		ctxp->state = LPFC_NVME_STE_LS_ABORT;
 	}
 
-	tgtp = (struct lpfc_nvmet_tgtport *)phba->targetport->private;
+	if (phba->nvmet_support && phba->targetport)
+		tgtp = (struct lpfc_nvmet_tgtport *)phba->targetport->private;
+
 	if (!ctxp->wqeq) {
 		/* Issue ABTS for this WQE based on iotag */
 		ctxp->wqeq = lpfc_sli_get_iocbq(phba);
@@ -3582,11 +3588,13 @@ lpfc_nvme_unsol_ls_issue_abort(struct lpfc_hba *phba,
 	rc = lpfc_sli4_issue_wqe(phba, ctxp->hdwq, abts_wqeq);
 	spin_unlock_irqrestore(&phba->hbalock, flags);
 	if (rc = WQE_SUCCESS) {
-		atomic_inc(&tgtp->xmt_abort_unsol);
+		if (tgtp)
+			atomic_inc(&tgtp->xmt_abort_unsol);
 		return 0;
 	}
 out:
-	atomic_inc(&tgtp->xmt_abort_rsp_error);
+	if (tgtp)
+		atomic_inc(&tgtp->xmt_abort_rsp_error);
 	abts_wqeq->context2 = NULL;
 	abts_wqeq->context3 = NULL;
 	lpfc_sli_release_iocbq(phba, abts_wqeq);
-- 
2.26.1
