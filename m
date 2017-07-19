From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 19 Jul 2017 10:06:41 +0000
Subject: [PATCH] libata: array underflow in ata_find_dev()
Message-Id: <20170719100641.7ste3wo6ap2g2djv@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tejun Heo <tj@kernel.org>
Cc: linux-ide@vger.kernel.org, kernel-janitors@vger.kernel.org

My static checker complains that "devno" can be negative, meaning that
we read before the start of the loop.  I've looked at the code, and I
think the warning is right.  This come from /proc so it's root only or
it would be quite a quite a serious bug.  The call tree looks like this:

proc_scsi_write() <- gets id and channel from simple_strtoul()
-> scsi_add_single_device() <- calls shost->transportt->user_scan()
   -> ata_scsi_user_scan()
      -> ata_find_dev()

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/ata/libata-scsi.c b/drivers/ata/libata-scsi.c
index d462c5a3a7ef..44ba292f2cd7 100644
--- a/drivers/ata/libata-scsi.c
+++ b/drivers/ata/libata-scsi.c
@@ -3030,10 +3030,12 @@ static unsigned int atapi_xlat(struct ata_queued_cmd *qc)
 static struct ata_device *ata_find_dev(struct ata_port *ap, int devno)
 {
 	if (!sata_pmp_attached(ap)) {
-		if (likely(devno < ata_link_max_devices(&ap->link)))
+		if (likely(devno >= 0 &&
+			   devno < ata_link_max_devices(&ap->link)))
 			return &ap->link.device[devno];
 	} else {
-		if (likely(devno < ap->nr_pmp_links))
+		if (likely(devno >= 0 &&
+			   devno < ap->nr_pmp_links))
 			return &ap->pmp_link[devno].device[0];
 	}
 
