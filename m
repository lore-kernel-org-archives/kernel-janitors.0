From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 21 Feb 2017 18:46:37 +0000
Subject: [patch] scsi_dh_emc: return success in clariion_std_inquiry()
Message-Id: <20170221183050.GB28595@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "James E.J. Bottomley" <jejb@linux.vnet.ibm.com>, Hannes Reinecke <hare@suse.de>
Cc: "Martin K. Petersen" <martin.petersen@oracle.com>, Jens Axboe <axboe@fb.com>, Johannes Thumshirn <jthumshirn@suse.de>, Shaun Tancheff <shaun.tancheff@seagate.com>, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org

We accidentally return an uninitialized variable on success.

Fixes: b6ff1b14cdf4 ("[SCSI] scsi_dh: Update EMC handler")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/scsi/device_handler/scsi_dh_emc.c b/drivers/scsi/device_handler/scsi_dh_emc.c
index 4a7679f6c73d..f1578832ec7a 100644
--- a/drivers/scsi/device_handler/scsi_dh_emc.c
+++ b/drivers/scsi/device_handler/scsi_dh_emc.c
@@ -358,7 +358,7 @@ static int clariion_prep_fn(struct scsi_device *sdev, struct request *req)
 static int clariion_std_inquiry(struct scsi_device *sdev,
 				struct clariion_dh_data *csdev)
 {
-	int err;
+	int err = SCSI_DH_OK;
 	char *sp_model;
 
 	sp_model = parse_sp_model(sdev, sdev->inquiry);
