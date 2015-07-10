From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Fri, 10 Jul 2015 05:18:10 +0000
Subject: [PATCH] arcmsr: Fix a potential data corruption issue
Message-Id: <1436505490-9640-1-git-send-email-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: JBottomley@odin.com
Cc: linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Resetting rqbuffer or wqbuffer must be done within a critial section
in order to avoir potential data corruption.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
This change is *untested* because I don't have the corresponding hardware.
However, it should'nt have any evil side effect (just a few lines of code
moved from outside to within a spin_lock)

This just a "guess" based on the other uses of the 2 buffers within the
code.
It is also inspired on how things are done in arcmsr_hba.c
(see line #2390)

So please ignore if not relevant.
---
 drivers/scsi/arcmsr/arcmsr_attr.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/scsi/arcmsr/arcmsr_attr.c b/drivers/scsi/arcmsr/arcmsr_attr.c
index 9c86481..2ad970d 100644
--- a/drivers/scsi/arcmsr/arcmsr_attr.c
+++ b/drivers/scsi/arcmsr/arcmsr_attr.c
@@ -171,22 +171,21 @@ static ssize_t arcmsr_sysfs_iop_message_clear(struct file *filp,
 		return -EACCES;
 
 	arcmsr_clear_iop2drv_rqueue_buffer(acb);
-	acb->acb_flags |-		(ACB_F_MESSAGE_WQBUFFER_CLEARED
-		| ACB_F_MESSAGE_RQBUFFER_CLEARED
-		| ACB_F_MESSAGE_WQBUFFER_READED);
 	spin_lock_irqsave(&acb->rqbuffer_lock, flags);
+	acb->acb_flags |= ACB_F_MESSAGE_RQBUFFER_CLEARED;
 	acb->rqbuf_getIndex = 0;
 	acb->rqbuf_putIndex = 0;
+	pQbuffer = acb->rqbuffer;
+	memset(pQbuffer, 0, sizeof (struct QBUFFER));
 	spin_unlock_irqrestore(&acb->rqbuffer_lock, flags);
 	spin_lock_irqsave(&acb->wqbuffer_lock, flags);
+	acb->acb_flags |= (ACB_F_MESSAGE_WQBUFFER_CLEARED |
+			   ACB_F_MESSAGE_WQBUFFER_READED);
 	acb->wqbuf_getIndex = 0;
 	acb->wqbuf_putIndex = 0;
-	spin_unlock_irqrestore(&acb->wqbuffer_lock, flags);
-	pQbuffer = acb->rqbuffer;
-	memset(pQbuffer, 0, sizeof (struct QBUFFER));
 	pQbuffer = acb->wqbuffer;
 	memset(pQbuffer, 0, sizeof (struct QBUFFER));
+	spin_unlock_irqrestore(&acb->wqbuffer_lock, flags);
 	return 1;
 }
 
-- 
2.1.4

