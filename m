From: James Smart <jsmart2021@gmail.com>
Date: Wed, 20 May 2020 18:59:28 +0000
Subject: [PATCH 2/3] lpfc: fix axchg pointer reference after free and double frees
Message-Id: <20200520185929.48779-3-jsmart2021@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200520185929.48779-1-jsmart2021@gmail.com>
In-Reply-To: <20200520185929.48779-1-jsmart2021@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-nvme@lists.infradead.org
Cc: axboe@kernel.dk, James Smart <jsmart2021@gmail.com>, Dick Kennedy <dick.kennedy@broadcom.com>, martin.petersen@oracle.com, linux-scsi@vger.kernel.org, jejb@linux.ibm.com, kernel-janitors@vger.kernel.org, hch@infradead.org, paul.ely@broadcom.com, hare@suse.de, dan.carpenter@oracle.com

The axchg structure is a structure allocated early in the
lpfc_nvme_unsol_ls_handler() to represent the newly received exchange.
Upon error, the out_fail path in the routine unconditionally frees the
pointer, yet subsequently passes the pointer to the abort routine.
Additionally, the abort routine, lpfc_nvme_unsol_ls_issue_abort(), also
has a failure path that will attempt to delete the pointer on error.

Fix these errors by:
- Removing the unconditional free so that it stays valid if passed
  to the abort routine.
- Revise the abort routine to not free the pointer. Instead, return
  a success/failure status. Note: if success, the later completion of
  the abort frees the structure.
- Back in the unsol_ls_handler() error path, if the abort routine was
  skipped (thus no possible reference) or the abort routine returned
  error, free the pointer.

Fixes: 3a8070c567aa ("lpfc: Refactor NVME LS receive handling")
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Dick Kennedy <dick.kennedy@broadcom.com>
Signed-off-by: James Smart <jsmart2021@gmail.com>
---
 drivers/scsi/lpfc/lpfc_nvmet.c |  3 +--
 drivers/scsi/lpfc/lpfc_sli.c   | 10 ++++++----
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/scsi/lpfc/lpfc_nvmet.c b/drivers/scsi/lpfc/lpfc_nvmet.c
index bccf9da302ee..32eb5e873e9b 100644
--- a/drivers/scsi/lpfc/lpfc_nvmet.c
+++ b/drivers/scsi/lpfc/lpfc_nvmet.c
@@ -3598,10 +3598,9 @@ lpfc_nvme_unsol_ls_issue_abort(struct lpfc_hba *phba,
 	abts_wqeq->context2 = NULL;
 	abts_wqeq->context3 = NULL;
 	lpfc_sli_release_iocbq(phba, abts_wqeq);
-	kfree(ctxp);
 	lpfc_printf_log(phba, KERN_ERR, LOG_NVME_ABTS,
 			"6056 Failed to Issue ABTS. Status x%x\n", rc);
-	return 0;
+	return 1;
 }
 
 /**
diff --git a/drivers/scsi/lpfc/lpfc_sli.c b/drivers/scsi/lpfc/lpfc_sli.c
index 1aaf40081e21..9e21c4f3b009 100644
--- a/drivers/scsi/lpfc/lpfc_sli.c
+++ b/drivers/scsi/lpfc/lpfc_sli.c
@@ -2813,7 +2813,7 @@ lpfc_nvme_unsol_ls_handler(struct lpfc_hba *phba, struct lpfc_iocbq *piocb)
 	struct lpfc_async_xchg_ctx *axchg = NULL;
 	char *failwhy = NULL;
 	uint32_t oxid, sid, did, fctl, size;
-	int ret;
+	int ret = 1;
 
 	d_buf = piocb->context2;
 
@@ -2897,14 +2897,16 @@ lpfc_nvme_unsol_ls_handler(struct lpfc_hba *phba, struct lpfc_iocbq *piocb)
 			(phba->nvmet_support) ? "T" : "I", ret);
 
 out_fail:
-	kfree(axchg);
 
 	/* recycle receive buffer */
 	lpfc_in_buf_free(phba, &nvmebuf->dbuf);
 
 	/* If start of new exchange, abort it */
-	if (fctl & FC_FC_FIRST_SEQ && !(fctl & FC_FC_EX_CTX))
-		lpfc_nvme_unsol_ls_issue_abort(phba, axchg, sid, oxid);
+	if (axchg && (fctl & FC_FC_FIRST_SEQ && !(fctl & FC_FC_EX_CTX)))
+		ret = lpfc_nvme_unsol_ls_issue_abort(phba, axchg, sid, oxid);
+
+	if (ret)
+		kfree(axchg);
 }
 
 /**
-- 
2.26.1
