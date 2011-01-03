From: Dan Carpenter <error27@gmail.com>
Date: Mon, 03 Jan 2011 05:48:33 +0000
Subject: [patch] [SCSI] scsi_dh: potential null dereference in
Message-Id: <20110103054833.GT1886@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "James E.J. Bottomley" <James.Bottomley@suse.de>
Cc: Mike Snitzer <snitzer@redhat.com>, Menny Hamburger <Menny_Hamburger@Dell.com>, Babu Moger <babu.moger@lsi.com>, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org

We assumed "sdev" could be NULL ealier, so lets check it here as well.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/scsi/device_handler/scsi_dh.c b/drivers/scsi/device_handler/scsi_dh.c
index b837c5b..ff340e3 100644
--- a/drivers/scsi/device_handler/scsi_dh.c
+++ b/drivers/scsi/device_handler/scsi_dh.c
@@ -446,7 +446,7 @@ int scsi_dh_activate(struct request_queue *q, activate_complete fn, void *data)
 	    sdev->sdev_state = SDEV_CANCEL ||
 	    sdev->sdev_state = SDEV_DEL)
 		err = SCSI_DH_NOSYS;
-	if (sdev->sdev_state = SDEV_OFFLINE)
+	if (sdev && sdev->sdev_state = SDEV_OFFLINE)
 		err = SCSI_DH_DEV_OFFLINED;
 	spin_unlock_irqrestore(q->queue_lock, flags);
 
