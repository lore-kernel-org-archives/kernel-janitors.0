From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 25 Jan 2021 08:44:34 +0000
Subject: [PATCH] scsi: lpfc: Fix ancient double free
Message-Id: <YA6E8rO51hE56SVw@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: James Smart <james.smart@broadcom.com>
Cc: Dick Kennedy <dick.kennedy@broadcom.com>, "James E.J. Bottomley" <jejb@linux.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, James Bottomley <James.Bottomley@steeleye.com>, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org

The "pmb" pointer is freed at the start of the function and then freed
again in the error handling code.

Fixes: 92d7f7b0cde3 ("[SCSI] lpfc: NPIV: add NPIV support on top of SLI-3")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/scsi/lpfc/lpfc_hbadisc.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/scsi/lpfc/lpfc_hbadisc.c b/drivers/scsi/lpfc/lpfc_hbadisc.c
index f890b5b7e6ca..48ca4a612f80 100644
--- a/drivers/scsi/lpfc/lpfc_hbadisc.c
+++ b/drivers/scsi/lpfc/lpfc_hbadisc.c
@@ -1155,13 +1155,14 @@ lpfc_mbx_cmpl_local_config_link(struct lpfc_hba *phba, LPFC_MBOXQ_t *pmb)
 	struct lpfc_vport *vport = pmb->vport;
 	LPFC_MBOXQ_t *sparam_mb;
 	struct lpfc_dmabuf *sparam_mp;
+	u16 status = pmb->u.mb.mbxStatus;
 	int rc;
 
-	if (pmb->u.mb.mbxStatus)
-		goto out;
-
 	mempool_free(pmb, phba->mbox_mem_pool);
 
+	if (status)
+		goto out;
+
 	/* don't perform discovery for SLI4 loopback diagnostic test */
 	if ((phba->sli_rev = LPFC_SLI_REV4) &&
 	    !(phba->hba_flag & HBA_FCOE_MODE) &&
@@ -1224,12 +1225,10 @@ lpfc_mbx_cmpl_local_config_link(struct lpfc_hba *phba, LPFC_MBOXQ_t *pmb)
 
 out:
 	lpfc_printf_vlog(vport, KERN_ERR, LOG_TRACE_EVENT,
-			 "0306 CONFIG_LINK mbxStatus error x%x "
-			 "HBA state x%x\n",
-			 pmb->u.mb.mbxStatus, vport->port_state);
-sparam_out:
-	mempool_free(pmb, phba->mbox_mem_pool);
+			 "0306 CONFIG_LINK mbxStatus error x%x HBA state x%x\n",
+			 status, vport->port_state);
 
+sparam_out:
 	lpfc_linkdown(phba);
 
 	lpfc_printf_vlog(vport, KERN_ERR, LOG_TRACE_EVENT,
-- 
2.29.2
