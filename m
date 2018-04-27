From: Colin King <colin.king@canonical.com>
Date: Fri, 27 Apr 2018 19:15:52 +0000
Subject: [PATCH] scsi: esas2r: fix spelling mistake: "asynchromous" -> "asynchronous"
Message-Id: <20180427191552.17502-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bradley Grove <linuxdrivers@attotech.com>, "James E . J . Bottomley" <jejb@linux.vnet.ibm.com>, "Martin K . Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to spelling mistake in module description text

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/scsi/esas2r/esas2r_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/scsi/esas2r/esas2r_main.c b/drivers/scsi/esas2r/esas2r_main.c
index e07eac5be087..c07118617d89 100644
--- a/drivers/scsi/esas2r/esas2r_main.c
+++ b/drivers/scsi/esas2r/esas2r_main.c
@@ -283,7 +283,7 @@ MODULE_PARM_DESC(num_requests,
 int num_ae_requests = 4;
 module_param(num_ae_requests, int, 0);
 MODULE_PARM_DESC(num_ae_requests,
-		 "Number of VDA asynchromous event requests.  Default 4.");
+		 "Number of VDA asynchronous event requests.  Default 4.");
 
 int cmd_per_lun = ESAS2R_DEFAULT_CMD_PER_LUN;
 module_param(cmd_per_lun, int, 0);
-- 
2.17.0

