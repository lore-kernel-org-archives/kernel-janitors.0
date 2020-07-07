From: Colin King <colin.king@canonical.com>
Date: Tue, 07 Jul 2020 15:00:18 +0000
Subject: [PATCH][next] scsi: lpfc: fix inconsistent indenting
Message-Id: <20200707150018.823350-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: James Smart <james.smart@broadcom.com>, Dick Kennedy <dick.kennedy@broadcom.com>, "James E . J . Bottomley" <jejb@linux.ibm.com>, "Martin K . Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Fix smatch warning:
drivers/scsi/lpfc/lpfc_sli.c:15156 lpfc_cq_poll_hdler() warn: inconsistent
indenting

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/scsi/lpfc/lpfc_sli.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/scsi/lpfc/lpfc_sli.c b/drivers/scsi/lpfc/lpfc_sli.c
index e17675381cb8..92fc6527e7ee 100644
--- a/drivers/scsi/lpfc/lpfc_sli.c
+++ b/drivers/scsi/lpfc/lpfc_sli.c
@@ -15153,7 +15153,7 @@ static int lpfc_cq_poll_hdler(struct irq_poll *iop, int budget)
 {
 	struct lpfc_queue *cq = container_of(iop, struct lpfc_queue, iop);
 
-	 __lpfc_sli4_hba_process_cq(cq, LPFC_IRQ_POLL);
+	__lpfc_sli4_hba_process_cq(cq, LPFC_IRQ_POLL);
 
 	return 1;
 }
-- 
2.27.0
