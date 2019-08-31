From: Colin King <colin.king@canonical.com>
Date: Sat, 31 Aug 2019 07:39:03 +0000
Subject: [PATCH][smartpqi-next] scsi: smartpqi: clean up indentation of a statement
Message-Id: <20190831073903.7834-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Don Brace <don.brace@microsemi.com>, "James E . J . Bottomley" <jejb@linux.ibm.com>, "Martin K . Petersen" <martin.petersen@oracle.com>, esc.storagedev@microsemi.com, linux-scsi@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a statement that is indented one level too deeply, remove
the tab, re-join broken line and remove some empty lines.

Addresses-Coverity: ("Indentation does not match nesting")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/scsi/smartpqi/smartpqi_init.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/scsi/smartpqi/smartpqi_init.c b/drivers/scsi/smartpqi/smartpqi_init.c
index ea5409bebf57..652d48224942 100644
--- a/drivers/scsi/smartpqi/smartpqi_init.c
+++ b/drivers/scsi/smartpqi/smartpqi_init.c
@@ -2175,10 +2175,7 @@ static int pqi_update_scsi_devices(struct pqi_ctrl_info *ctrl_info)
 					device->aio_handle  						phys_lun_ext_entry->aio_handle;
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
