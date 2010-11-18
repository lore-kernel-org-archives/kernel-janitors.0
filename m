From: Dan Carpenter <error27@gmail.com>
Date: Thu, 18 Nov 2010 04:18:43 +0000
Subject: [patch] [SCSI] libfc: unlocking wrong lock in fc_eh_abort()
Message-Id: <20101118041843.GN31724@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Robert Love <robert.w.love@intel.com>, Vasu Dev <vasu.dev@intel.com>
Cc: "James E.J. Bottomley" <James.Bottomley@suse.de>, devel@open-fcoe.org, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org

In commit 8b7ac2bb07bb "[SCSI] libfc: possible race could panic system
due to NULL fsp->cmd" we changed the lock which was used in this
function, but this path was missed.

Signed-off-by: Dan Carpenter <error27@gmail.com>
---
This is a static checker fix.  Compile tested only.

diff --git a/drivers/scsi/libfc/fc_fcp.c b/drivers/scsi/libfc/fc_fcp.c
index 2924363..b9ad74d 100644
--- a/drivers/scsi/libfc/fc_fcp.c
+++ b/drivers/scsi/libfc/fc_fcp.c
@@ -2004,7 +2004,7 @@ int fc_eh_abort(struct scsi_cmnd *sc_cmd)
 	fsp = CMD_SP(sc_cmd);
 	if (!fsp) {
 		/* command completed while scsi eh was setting up */
-		spin_unlock_irqrestore(lport->host->host_lock, flags);
+		spin_unlock_irqrestore(&si->scsi_queue_lock, flags);
 		return SUCCESS;
 	}
 	/* grab a ref so the fsp and sc_cmd cannot be relased from under us */
