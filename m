From: Colin King <colin.king@canonical.com>
Date: Wed, 29 Apr 2020 15:40:55 +0000
Subject: [PATCH] scsi: pm80xx: remove redundant assignments to status
Message-Id: <20200429154055.286617-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jack Wang <jinpu.wang@cloud.ionos.com>, "James E . J . Bottomley" <jejb@linux.ibm.com>, "Martin K . Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable status is being assigned with a value that is never read
hence the assignment is redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/scsi/pm8001/pm80xx_hwi.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/scsi/pm8001/pm80xx_hwi.c b/drivers/scsi/pm8001/pm80xx_hwi.c
index 4d205ebaee87..f5e36375a68f 100644
--- a/drivers/scsi/pm8001/pm80xx_hwi.c
+++ b/drivers/scsi/pm8001/pm80xx_hwi.c
@@ -235,7 +235,6 @@ ssize_t pm80xx_get_fatal_dump(struct device *cdev,
 			pm8001_ha->forensic_fatal_step = 1;
 			pm8001_ha->fatal_forensic_shift_offset = 0;
 			pm8001_ha->forensic_last_offset	= 0;
-			status = 0;
 			offset = (int)
 			((char *)pm8001_ha->forensic_info.data_buf.direct_data
 			- (char *)buf);
@@ -258,7 +257,6 @@ ssize_t pm80xx_get_fatal_dump(struct device *cdev,
 					forensic_info.data_buf.direct_data,
 					"%08x ", *(temp + index));
 			}
-			status = 0;
 			offset = (int)
 			((char *)pm8001_ha->forensic_info.data_buf.direct_data
 			- (char *)buf);
@@ -285,7 +283,6 @@ ssize_t pm80xx_get_fatal_dump(struct device *cdev,
 		pm8001_cw32(pm8001_ha, 0, MEMBASE_II_SHIFT_REGISTER,
 			pm8001_ha->fatal_forensic_shift_offset);
 		pm8001_ha->fatal_bar_loc = 0;
-		status = 0;
 		offset = (int)
 			((char *)pm8001_ha->forensic_info.data_buf.direct_data
 			- (char *)buf);
-- 
2.25.1
