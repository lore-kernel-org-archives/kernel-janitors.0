From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 12 Oct 2017 20:30:57 +0000
Subject: [PATCH] scsi: lpfc: Fix a precedence bug in lpfc_nvme_io_cmd_wqe_cmpl()
Message-Id: <20171012203057.ixo2ds5i5ecbyv4y@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: James Smart <james.smart@broadcom.com>, Dick Kennedy <dick.kennedy@broadcom.com>
Cc: "James E.J. Bottomley" <jejb@linux.vnet.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org

The ! has higher precedence than the & operation.  I've added
parenthesis so this works as intended.

Fixes: 952c303b329c ("scsi: lpfc: Ensure io aborts interlocked with the target.")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/scsi/lpfc/lpfc_nvme.c b/drivers/scsi/lpfc/lpfc_nvme.c
index 60f0dbd0f192..517ae570e507 100644
--- a/drivers/scsi/lpfc/lpfc_nvme.c
+++ b/drivers/scsi/lpfc/lpfc_nvme.c
@@ -948,7 +948,7 @@ lpfc_nvme_io_cmd_wqe_cmpl(struct lpfc_hba *phba, struct lpfc_iocbq *pwqeIn,
 	/* NVME targets need completion held off until the abort exchange
 	 * completes.
 	 */
-	if (!lpfc_ncmd->flags & LPFC_SBUF_XBUSY)
+	if (!(lpfc_ncmd->flags & LPFC_SBUF_XBUSY))
 		nCmd->done(nCmd);
 
 	spin_lock_irqsave(&phba->hbalock, flags);
