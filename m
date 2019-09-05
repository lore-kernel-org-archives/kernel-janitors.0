From: Colin King <colin.king@canonical.com>
Date: Thu, 05 Sep 2019 13:50:17 +0000
Subject: [PATCH] scsi: mvsas: remove redundant assignment to variable rc
Message-Id: <20190905135017.23772-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "James E . J . Bottomley" <jejb@linux.ibm.com>, "Martin K . Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable rc is being initialized with a value that is never read
and is being re-assigned a little later on. The assignment is
redundant and hence can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/scsi/mvsas/mv_sas.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/scsi/mvsas/mv_sas.c b/drivers/scsi/mvsas/mv_sas.c
index 3e0b8ebe257f..a920eced92ec 100644
--- a/drivers/scsi/mvsas/mv_sas.c
+++ b/drivers/scsi/mvsas/mv_sas.c
@@ -1541,7 +1541,7 @@ int mvs_abort_task(struct sas_task *task)
 
 int mvs_abort_task_set(struct domain_device *dev, u8 *lun)
 {
-	int rc = TMF_RESP_FUNC_FAILED;
+	int rc;
 	struct mvs_tmf_task tmf_task;
 
 	tmf_task.tmf = TMF_ABORT_TASK_SET;
-- 
2.20.1
