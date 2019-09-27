From: Colin King <colin.king@canonical.com>
Date: Fri, 27 Sep 2019 09:58:40 +0000
Subject: [PATCH] scsi: smartpqi: clean up an indentation issue
Message-Id: <20190927095840.26377-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Don Brace <don.brace@microsemi.com>, "James E . J . Bottomley" <jejb@linux.ibm.com>, "Martin K . Petersen" <martin.petersen@oracle.com>, esc.storagedev@microsemi.com, linux-scsi@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There are some statements that are indented too deeply, remove
the extraneous tabs and rejoin split lines.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/scsi/smartpqi/smartpqi_init.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/scsi/smartpqi/smartpqi_init.c b/drivers/scsi/smartpqi/smartpqi_init.c
index ea5409bebf57..be496d63aea3 100644
--- a/drivers/scsi/smartpqi/smartpqi_init.c
+++ b/drivers/scsi/smartpqi/smartpqi_init.c
@@ -2172,13 +2172,10 @@ static int pqi_update_scsi_devices(struct pqi_ctrl_info *ctrl_info)
 				REPORT_PHYS_LUN_DEV_FLAG_AIO_ENABLED) &&
 				phys_lun_ext_entry->aio_handle) {
 				device->aio_enabled = true;
-					device->aio_handle -						phys_lun_ext_entry->aio_handle;
+				device->aio_handle +					phys_lun_ext_entry->aio_handle;
 			}
-
-				pqi_get_physical_disk_info(ctrl_info,
-					device, id_phys);
-
+			pqi_get_physical_disk_info(ctrl_info, device, id_phys);
 		} else {
 			memcpy(device->volume_id, log_lun_ext_entry->volume_id,
 				sizeof(device->volume_id));
-- 
2.20.1
