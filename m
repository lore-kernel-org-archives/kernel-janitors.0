From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 30 Jun 2017 08:03:53 +0000
Subject: [PATCH 2/2] scsi: lpfc: don't double count abort errors
Message-Id: <20170630080352.mmfyjjxsznzx75yf@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170630080250.mjbosf64qlytrsii@mwanda>
In-Reply-To: <20170630080250.mjbosf64qlytrsii@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: James Smart <james.smart@broadcom.com>
Cc: Dick Kennedy <dick.kennedy@broadcom.com>, "James E.J. Bottomley" <jejb@linux.vnet.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org

If lpfc_nvmet_unsol_fcp_issue_abort() fails then we accidentally
increment "tgtp->xmt_abort_rsp_error" and then two lines later we
increment it a second time.

Fixes: 547077a44b3b ("scsi: lpfc: Adding additional stats counters for nvme.")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/scsi/lpfc/lpfc_nvmet.c b/drivers/scsi/lpfc/lpfc_nvmet.c
index 7dc061a14f95..fbeec344c6cc 100644
--- a/drivers/scsi/lpfc/lpfc_nvmet.c
+++ b/drivers/scsi/lpfc/lpfc_nvmet.c
@@ -2583,7 +2583,6 @@ lpfc_nvmet_unsol_fcp_issue_abort(struct lpfc_hba *phba,
 	}
 
 aerr:
-	atomic_inc(&tgtp->xmt_abort_rsp_error);
 	ctxp->flag &= ~LPFC_NVMET_ABORT_OP;
 	atomic_inc(&tgtp->xmt_abort_rsp_error);
 	lpfc_printf_log(phba, KERN_ERR, LOG_NVME_ABTS,
