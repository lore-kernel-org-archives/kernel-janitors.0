From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 30 Jul 2012 08:16:35 +0000
Subject: [patch 1/2] [SCSI] ipr: missing unlock before a return
Message-Id: <20120730081635.GE15702@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Brian King <brking@us.ibm.com>
Cc: "James E.J. Bottomley" <JBottomley@parallels.com>, linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

We recently changed the locking in this function, but this return was
missed.  It needs an unlock and the IRQs need to be restored.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Applies to linux-next.

diff --git a/drivers/scsi/ipr.c b/drivers/scsi/ipr.c
index 07b14ba..7a5ccb2c 100644
--- a/drivers/scsi/ipr.c
+++ b/drivers/scsi/ipr.c
@@ -5874,8 +5874,11 @@ static int ipr_queuecommand(struct Scsi_Host *shost,
 		goto err_nodev;
 	}
 
-	if (ipr_is_gata(res) && res->sata_port)
-		return ata_sas_queuecmd(scsi_cmd, res->sata_port->ap);
+	if (ipr_is_gata(res) && res->sata_port) {
+		rc = ata_sas_queuecmd(scsi_cmd, res->sata_port->ap);
+		spin_unlock_irqrestore(shost->host_lock, lock_flags);
+		return rc;
+	}
 
 	ipr_cmd = __ipr_get_free_ipr_cmnd(ioa_cfg);
 	spin_unlock_irqrestore(shost->host_lock, lock_flags);
