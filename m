From: Colin King <colin.king@canonical.com>
Date: Wed, 18 Nov 2020 13:37:44 +0000
Subject: [PATCH][next] scsi: lpfc: remove dead code on second !ndlp check
Message-Id: <20201118133744.461385-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: James Smart <james.smart@broadcom.com>, Dick Kennedy <dick.kennedy@broadcom.com>, "James E . J . Bottomley" <jejb@linux.ibm.com>, "Martin K . Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently there is a null check on the pointer ndlp that exits via
error path issue_ct_rsp_exit followed by another null check on the
same pointer that is almost identical to the previous null check
stanza and yet can never can be reached because the previous check
exited via issue_ct_rsp_exit. This is deadcode and can be removed.

Addresses-Coverity: ("Logically dead code")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/scsi/lpfc/lpfc_bsg.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/scsi/lpfc/lpfc_bsg.c b/drivers/scsi/lpfc/lpfc_bsg.c
index 35f4998504c1..41e3657c2d8d 100644
--- a/drivers/scsi/lpfc/lpfc_bsg.c
+++ b/drivers/scsi/lpfc/lpfc_bsg.c
@@ -1526,12 +1526,6 @@ lpfc_issue_ct_rsp(struct lpfc_hba *phba, struct bsg_job *job, uint32_t tag,
 			goto issue_ct_rsp_exit;
 		}
 
-		/* Check if the ndlp is active */
-		if (!ndlp) {
-			rc = IOCB_ERROR;
-			goto issue_ct_rsp_exit;
-		}
-
 		/* get a refernece count so the ndlp doesn't go away while
 		 * we respond
 		 */
-- 
2.28.0
