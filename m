From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 15 May 2020 10:19:03 +0000
Subject: [PATCH resend] scsi: lpfc: Fix a use after free in lpfc_nvme_unsol_ls_handler()
Message-Id: <20200515101903.GJ3041@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <yq1y2purqt1.fsf@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: James Smart <james.smart@broadcom.com>, linux-nvme@lists.infradead.org
Cc: Jens Axboe <axboe@kernel.dk>, Dick Kennedy <dick.kennedy@broadcom.com>, linux-scsi@vger.kernel.org, "Martin K. Petersen" <martin.petersen@oracle.com>, "James E.J. Bottomley" <jejb@linux.ibm.com>, kernel-janitors@vger.kernel.org, Paul Ely <paul.ely@broadcom.com>, Hannes Reinecke <hare@suse.de>

The "axchg" pointer is dereferenced when we call the
lpfc_nvme_unsol_ls_issue_abort() function.  It can't be either freed or
NULL.

Fixes: 3a8070c567aa ("lpfc: Refactor NVME LS receive handling")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
Reviewed-by: James Smart <james.smart@broadcom.com>
---
Resending to the NVMe list.  Added James' R-b.

Is there a way we could update MAINTAINERS so that ./get_maintainer.pl
send these to the correct list?

 drivers/scsi/lpfc/lpfc_sli.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/scsi/lpfc/lpfc_sli.c b/drivers/scsi/lpfc/lpfc_sli.c
index 38889cb6e1996..fcf51b4192d66 100644
--- a/drivers/scsi/lpfc/lpfc_sli.c
+++ b/drivers/scsi/lpfc/lpfc_sli.c
@@ -2895,14 +2895,14 @@ lpfc_nvme_unsol_ls_handler(struct lpfc_hba *phba, struct lpfc_iocbq *piocb)
 			(phba->nvmet_support) ? "T" : "I", ret);
 
 out_fail:
-	kfree(axchg);
-
 	/* recycle receive buffer */
 	lpfc_in_buf_free(phba, &nvmebuf->dbuf);
 
 	/* If start of new exchange, abort it */
-	if (fctl & FC_FC_FIRST_SEQ && !(fctl & FC_FC_EX_CTX))
+	if (axchg && (fctl & FC_FC_FIRST_SEQ) && !(fctl & FC_FC_EX_CTX))
 		lpfc_nvme_unsol_ls_issue_abort(phba, axchg, sid, oxid);
+
+	kfree(axchg);
 }
 
 /**
-- 
2.26.2
