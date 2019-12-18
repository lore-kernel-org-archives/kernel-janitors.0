From: Colin King <colin.king@canonical.com>
Date: Wed, 18 Dec 2019 08:43:01 +0000
Subject: [PATCH] scsi: lpfc: fix spelling mistakes of asynchronous
Message-Id: <20191218084301.627555-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170526101137.14282-1-colin.king@canonical.com>
In-Reply-To: <20170526101137.14282-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: James Smart <james.smart@broadcom.com>, Dick Kennedy <dick.kennedy@broadcom.com>, "James E . J . Bottomley" <jejb@linux.ibm.com>, "Martin K . Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There are spelling mistakes of asynchronous in a lpfc_printf_log
message and comments. Fix these.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/scsi/lpfc/lpfc_init.c |  2 +-
 drivers/scsi/lpfc/lpfc_sli.c  | 10 +++++-----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/scsi/lpfc/lpfc_init.c b/drivers/scsi/lpfc/lpfc_init.c
index 6298b1729098..6a04fdb3fbf2 100644
--- a/drivers/scsi/lpfc/lpfc_init.c
+++ b/drivers/scsi/lpfc/lpfc_init.c
@@ -5883,7 +5883,7 @@ void lpfc_sli4_async_event_proc(struct lpfc_hba *phba)
 			break;
 		default:
 			lpfc_printf_log(phba, KERN_ERR, LOG_SLI,
-					"1804 Invalid asynchrous event code: "
+					"1804 Invalid asynchronous event code: "
 					"x%x\n", bf_get(lpfc_trailer_code,
 					&cq_event->cqe.mcqe_cmpl));
 			break;
diff --git a/drivers/scsi/lpfc/lpfc_sli.c b/drivers/scsi/lpfc/lpfc_sli.c
index c82b5792da98..625c046ac4ef 100644
--- a/drivers/scsi/lpfc/lpfc_sli.c
+++ b/drivers/scsi/lpfc/lpfc_sli.c
@@ -8555,7 +8555,7 @@ lpfc_sli4_async_mbox_unblock(struct lpfc_hba *phba)
 	psli->sli_flag &= ~LPFC_SLI_ASYNC_MBX_BLK;
 	spin_unlock_irq(&phba->hbalock);
 
-	/* wake up worker thread to post asynchronlous mailbox command */
+	/* wake up worker thread to post asynchronous mailbox command */
 	lpfc_worker_wake_up(phba);
 }
 
@@ -8823,7 +8823,7 @@ lpfc_sli_issue_mbox_s4(struct lpfc_hba *phba, LPFC_MBOXQ_t *mboxq,
 		return rc;
 	}
 
-	/* Now, interrupt mode asynchrous mailbox command */
+	/* Now, interrupt mode asynchronous mailbox command */
 	rc = lpfc_mbox_cmd_check(phba, mboxq);
 	if (rc) {
 		lpfc_printf_log(phba, KERN_ERR, LOG_MBOX | LOG_SLI,
@@ -13112,11 +13112,11 @@ lpfc_cq_event_setup(struct lpfc_hba *phba, void *entry, int size)
 }
 
 /**
- * lpfc_sli4_sp_handle_async_event - Handle an asynchroous event
+ * lpfc_sli4_sp_handle_async_event - Handle an asynchronous event
  * @phba: Pointer to HBA context object.
  * @cqe: Pointer to mailbox completion queue entry.
  *
- * This routine process a mailbox completion queue entry with asynchrous
+ * This routine process a mailbox completion queue entry with asynchronous
  * event.
  *
  * Return: true if work posted to worker thread, otherwise false.
@@ -13270,7 +13270,7 @@ lpfc_sli4_sp_handle_mbox_event(struct lpfc_hba *phba, struct lpfc_mcqe *mcqe)
  * @cqe: Pointer to mailbox completion queue entry.
  *
  * This routine process a mailbox completion queue entry, it invokes the
- * proper mailbox complete handling or asynchrous event handling routine
+ * proper mailbox complete handling or asynchronous event handling routine
  * according to the MCQE's async bit.
  *
  * Return: true if work posted to worker thread, otherwise false.
-- 
2.24.0
