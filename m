From: Julia Lawall <julia@diku.dk>
Date: Mon, 29 Mar 2010 15:35:42 +0000
Subject: [PATCH 8/12] drivers/scsi/lpfc: Unlock the lock that was locked
Message-Id: <Pine.LNX.4.64.1003291735250.21896@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: James Smart <james.smart@emulex.com>, "James E.J. Bottomley" <James.Bottomley@suse.de>, linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

The lock taken was in the ct_ev_lock field, not the hbalock field.

A simplified version of the semantic patch that finds this problem is as
follows: (http://coccinelle.lip6.fr/)

// <smpl>
@r exists@
expression E1;
identifier f;
@@

f (...) { <+...
* spin_lock_irqsave (E1,...);
... when != E1
* return ...;
...+> }
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/scsi/lpfc/lpfc_bsg.c        |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/scsi/lpfc/lpfc_bsg.c b/drivers/scsi/lpfc/lpfc_bsg.c
index 692c29f..992efb1 100644
--- a/drivers/scsi/lpfc/lpfc_bsg.c
+++ b/drivers/scsi/lpfc/lpfc_bsg.c
@@ -432,7 +432,7 @@ lpfc_bsg_rport_els_cmp(struct lpfc_hba *phba,
 	dd_data = cmdiocbq->context1;
 	/* normal completion and timeout crossed paths, already done */
 	if (!dd_data) {
-		spin_unlock_irqrestore(&phba->hbalock, flags);
+		spin_unlock_irqrestore(&phba->ct_ev_lock, flags);
 		return;
 	}
 
@@ -1195,7 +1195,7 @@ lpfc_issue_ct_rsp_cmp(struct lpfc_hba *phba,
 	dd_data = cmdiocbq->context1;
 	/* normal completion and timeout crossed paths, already done */
 	if (!dd_data) {
-		spin_unlock_irqrestore(&phba->hbalock, flags);
+		spin_unlock_irqrestore(&phba->ct_ev_lock, flags);
 		return;
 	}
 
