From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 23 Aug 2018 13:56:33 +0000
Subject: [PATCH] scsi: lpfc: remove an unnecessary NULL check
Message-Id: <20180823135633.5qcevijtcalx76u6@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Smatch complains about this code:

    drivers/scsi/lpfc/lpfc_scsi.c:1053 lpfc_get_scsi_buf_s4()
    warn: variable dereferenced before check 'lpfc_cmd' (see line 1039)

Fortunately the NULL check isn't required so I have removed it.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/scsi/lpfc/lpfc_scsi.c b/drivers/scsi/lpfc/lpfc_scsi.c
index 5c7858e735c9..ef20d37e44db 100644
--- a/drivers/scsi/lpfc/lpfc_scsi.c
+++ b/drivers/scsi/lpfc/lpfc_scsi.c
@@ -1050,7 +1050,7 @@ lpfc_get_scsi_buf_s4(struct lpfc_hba *phba, struct lpfc_nodelist *ndlp)
 	if (!found)
 		return NULL;
 
-	if (lpfc_ndlp_check_qdepth(phba, ndlp) && lpfc_cmd) {
+	if (lpfc_ndlp_check_qdepth(phba, ndlp)) {
 		atomic_inc(&ndlp->cmd_pending);
 		lpfc_cmd->flags |= LPFC_SBUF_BUMP_QDEPTH;
 	}
