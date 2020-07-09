From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 09 Jul 2020 10:49:19 +0000
Subject: [PATCH] scsi: lpfc: Fix a condition in lpfc_dmp_dbg()
Message-Id: <20200709104919.GD20875@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: James Smart <james.smart@broadcom.com>, Dick Kennedy <dick.kennedy@broadcom.com>
Cc: "James E.J. Bottomley" <jejb@linux.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org

These variables are unsigned so the result of the subtraction is also
unsigned and thus can't be negative.  Change it to a comparison and
remove the subtraction.

Fixes: 372c187b8a70 ("scsi: lpfc: Add an internal trace log buffer")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/scsi/lpfc/lpfc_init.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/scsi/lpfc/lpfc_init.c b/drivers/scsi/lpfc/lpfc_init.c
index 7285b0114837..2bb2c96e7784 100644
--- a/drivers/scsi/lpfc/lpfc_init.c
+++ b/drivers/scsi/lpfc/lpfc_init.c
@@ -14152,7 +14152,7 @@ void lpfc_dmp_dbg(struct lpfc_hba *phba)
 		if ((start_idx + dbg_cnt) > (DBG_LOG_SZ - 1)) {
 			temp_idx = (start_idx + dbg_cnt) % DBG_LOG_SZ;
 		} else {
-			if ((start_idx - dbg_cnt) < 0) {
+			if (start_idx > dbg_cnt) {
 				start_idx = DBG_LOG_SZ - (dbg_cnt - start_idx);
 				temp_idx = 0;
 			} else {
-- 
2.27.0
