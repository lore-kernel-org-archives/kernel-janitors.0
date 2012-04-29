From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sun, 29 Apr 2012 19:44:03 +0000
Subject: [PATCH] drivers/scsi/lpfc/lpfc_sli.c: add missing jumps to mempool_free
Message-Id: <1335728643-19970-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: James Smart <james.smart@emulex.com>
Cc: kernel-janitors@vger.kernel.org, "James E.J. Bottomley" <JBottomley@parallels.com>, linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>

It appears that mempool_free should be performed on these failures as on
the other exits from the containing functions.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/scsi/lpfc/lpfc_sli.c |   24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/drivers/scsi/lpfc/lpfc_sli.c b/drivers/scsi/lpfc/lpfc_sli.c
index dbaf5b9..7284e9e 100644
--- a/drivers/scsi/lpfc/lpfc_sli.c
+++ b/drivers/scsi/lpfc/lpfc_sli.c
@@ -12046,8 +12046,10 @@ lpfc_cq_create(struct lpfc_hba *phba, struct lpfc_queue *cq,
 		lpfc_printf_log(phba, KERN_ERR, LOG_SLI,
 				"0361 Unsupported CQ count. (%d)\n",
 				cq->entry_count);
-		if (cq->entry_count < 256)
-			return -EINVAL;
+		if (cq->entry_count < 256) {
+			status = -EINVAL;
+			goto out;
+		}
 		/* otherwise default to smallest count (drop through) */
 	case 256:
 		bf_set(lpfc_cq_context_count, &cq_create->u.request.context,
@@ -12238,8 +12240,10 @@ lpfc_mq_create(struct lpfc_hba *phba, struct lpfc_queue *mq,
 		lpfc_printf_log(phba, KERN_ERR, LOG_SLI,
 				"0362 Unsupported MQ count. (%d)\n",
 				mq->entry_count);
-		if (mq->entry_count < 16)
-			return -EINVAL;
+		if (mq->entry_count < 16) {
+			status = -EINVAL;
+			goto out;
+		}
 		/* otherwise default to smallest count (drop through) */
 	case 16:
 		bf_set(lpfc_mq_context_ring_size,
@@ -12528,8 +12532,10 @@ lpfc_rq_create(struct lpfc_hba *phba, struct lpfc_queue *hrq,
 			lpfc_printf_log(phba, KERN_ERR, LOG_SLI,
 					"2535 Unsupported RQ count. (%d)\n",
 					hrq->entry_count);
-			if (hrq->entry_count < 512)
-				return -EINVAL;
+			if (hrq->entry_count < 512) {
+				status = -EINVAL;
+				goto out;
+			}
 			/* otherwise default to smallest count (drop through) */
 		case 512:
 			bf_set(lpfc_rq_context_rqe_count,
@@ -12609,8 +12615,10 @@ lpfc_rq_create(struct lpfc_hba *phba, struct lpfc_queue *hrq,
 			lpfc_printf_log(phba, KERN_ERR, LOG_SLI,
 					"2536 Unsupported RQ count. (%d)\n",
 					drq->entry_count);
-			if (drq->entry_count < 512)
-				return -EINVAL;
+			if (drq->entry_count < 512) {
+				status = -EINVAL;
+				goto out;
+			}
 			/* otherwise default to smallest count (drop through) */
 		case 512:
 			bf_set(lpfc_rq_context_rqe_count,

