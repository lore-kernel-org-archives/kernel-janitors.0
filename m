From: Colin King <colin.king@canonical.com>
Date: Fri, 15 Jan 2021 09:58:24 +0000
Subject: [PATCH][next] scsi: pm80xx: clean up indentation of a code block
Message-Id: <20210115095824.9170-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jack Wang <jinpu.wang@cloud.ionos.com>, "James E . J . Bottomley" <jejb@linux.ibm.com>, "Martin K . Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

A block of code is indented one level too deeply, clean this
up.

Addresses-Coverity: ("Indentation does not match nesting level")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/scsi/pm8001/pm80xx_hwi.c | 34 ++++++++++++++------------------
 1 file changed, 15 insertions(+), 19 deletions(-)

diff --git a/drivers/scsi/pm8001/pm80xx_hwi.c b/drivers/scsi/pm8001/pm80xx_hwi.c
index e7fef42b4f6c..6fd206abc9fc 100644
--- a/drivers/scsi/pm8001/pm80xx_hwi.c
+++ b/drivers/scsi/pm8001/pm80xx_hwi.c
@@ -358,26 +358,22 @@ ssize_t pm80xx_get_fatal_dump(struct device *cdev,
 					MEMBASE_II_SHIFT_REGISTER,
 					pm8001_ha->fatal_forensic_shift_offset);
 		}
-			/* Read the next block of the debug data.*/
-			length_to_read = pm8001_mr32(fatal_table_address,
-			MPI_FATAL_EDUMP_TABLE_ACCUM_LEN) -
-			pm8001_ha->forensic_preserved_accumulated_transfer;
-			if (length_to_read != 0x0) {
-				pm8001_ha->forensic_fatal_step = 0;
-				goto moreData;
-			} else {
-				pm8001_ha->forensic_info.data_buf.direct_data +-				sprintf(
-				pm8001_ha->forensic_info.data_buf.direct_data,
+		/* Read the next block of the debug data.*/
+		length_to_read = pm8001_mr32(fatal_table_address,
+		MPI_FATAL_EDUMP_TABLE_ACCUM_LEN) -
+		pm8001_ha->forensic_preserved_accumulated_transfer;
+		if (length_to_read != 0x0) {
+			pm8001_ha->forensic_fatal_step = 0;
+			goto moreData;
+		} else {
+			pm8001_ha->forensic_info.data_buf.direct_data ++			sprintf(pm8001_ha->forensic_info.data_buf.direct_data,
 				"%08x ", 4);
-				pm8001_ha->forensic_info.data_buf.read_len
-								= 0xFFFFFFFF;
-				pm8001_ha->forensic_info.data_buf.direct_len
-								=  0;
-				pm8001_ha->forensic_info.data_buf.direct_offset
-								= 0;
-				pm8001_ha->forensic_info.data_buf.read_len = 0;
-			}
+			pm8001_ha->forensic_info.data_buf.read_len = 0xFFFFFFFF;
+			pm8001_ha->forensic_info.data_buf.direct_len =  0;
+			pm8001_ha->forensic_info.data_buf.direct_offset = 0;
+			pm8001_ha->forensic_info.data_buf.read_len = 0;
+		}
 	}
 	offset = (int)((char *)pm8001_ha->forensic_info.data_buf.direct_data
 			- (char *)buf);
-- 
2.29.2
