From: Thomas Meyer <thomas@m3y3r.de>
Date: Fri, 05 Aug 2011 15:41:43 +0000
Subject: [PATCH] [SCSI] lpfc: GFP_KERNEL malloc with lock held
Message-Id: <1312558906.5589.6.camel@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Thomas Meyer <thomas@m3y3r.de>

 Find functions that refer to GFP_KERNEL but are called with locks held.
 The proposed change of converting the GFP_KERNEL is not necessarily the
 correct one.  It may be desired to unlock the lock, or to not call the
 function under the lock in the first place.

 The semantic patch that makes this output is available
 in scripts/coccinelle/locks/call_kern.cocci.

 More information about semantic patching is available at
 http://coccinelle.lip6.fr/

Signed-off-by: Thomas Meyer <thomas@m3y3r.de>
---

__lpfc_set_rrq_active: This function is called with hbalock held and
interrupts disabled.

diff -u -p a/drivers/scsi/lpfc/lpfc_sli.c b/drivers/scsi/lpfc/lpfc_sli.c
--- a/drivers/scsi/lpfc/lpfc_sli.c 2011-07-30 21:45:25.982285760 +0200
+++ b/drivers/scsi/lpfc/lpfc_sli.c 2011-08-02 10:10:20.333918852 +0200
@@ -557,7 +557,7 @@ __lpfc_set_rrq_active(struct lpfc_hba *p
 	if (test_and_set_bit(xritag, ndlp->active_rrqs.xri_bitmap))
 		goto out;
 
-	rrq = mempool_alloc(phba->rrq_pool, GFP_KERNEL);
+	rrq = mempool_alloc(phba->rrq_pool, GFP_ATOMIC);
 	if (rrq) {
 		rrq->send_rrq = send_rrq;
 		rrq->xritag = xritag;


