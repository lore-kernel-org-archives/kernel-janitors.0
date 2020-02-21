From: Colin King <colin.king@canonical.com>
Date: Fri, 21 Feb 2020 15:48:41 +0000
Subject: [PATCH][next] scsi: lpfc: fix spelling mistake "Notication" -> "Notification"
Message-Id: <20200221154841.77791-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: James Smart <james.smart@broadcom.com>, Dick Kennedy <dick.kennedy@broadcom.com>, "James E . J . Bottomley" <jejb@linux.ibm.com>, "Martin K . Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in a lpfc_printf_vlog info messgae. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/scsi/lpfc/lpfc_els.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/scsi/lpfc/lpfc_els.c b/drivers/scsi/lpfc/lpfc_els.c
index a712f15bc88c..80d1e661b0d4 100644
--- a/drivers/scsi/lpfc/lpfc_els.c
+++ b/drivers/scsi/lpfc/lpfc_els.c
@@ -3128,7 +3128,7 @@ lpfc_cmpl_els_disc_cmd(struct lpfc_hba *phba, struct lpfc_iocbq *cmdiocb,
 		for (i = 0; i < ELS_RDF_REG_TAG_CNT &&
 			    i < be32_to_cpu(prdf->reg_d1.reg_desc.count); i++)
 			lpfc_printf_vlog(vport, KERN_INFO, LOG_ELS,
-				 "4677 Fabric RDF Notication Grant Data: "
+				 "4677 Fabric RDF Notification Grant Data: "
 				 "0x%08x\n",
 				 be32_to_cpu(
 					prdf->reg_d1.desc_tags[i]));
-- 
2.25.0
