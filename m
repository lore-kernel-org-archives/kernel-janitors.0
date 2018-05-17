From: Colin King <colin.king@canonical.com>
Date: Thu, 17 May 2018 07:57:38 +0000
Subject: [PATCH] scsi: snic: fix a couple of spelling mistakes: "COMPLETE"
Message-Id: <20180517075738.22821-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Karan Tilak Kumar <kartilak@cisco.com>, Sesidhar Baddela <sebaddel@cisco.com>, "James E . J . Bottomley" <jejb@linux.vnet.ibm.com>, "Martin K . Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to spelling mistakes/typos:
"SNIC_IOREQ_ABTS_COMPELTE" -> "SNIC_IOREQ_ABTS_COMPLETE"
"SNIC_IOREQ_LR_COMPELTE"   -> "SNIC_IOREQ_LR_COMPLETE"
"SNIC_IOREQ_CMD_COMPELTE"  -> "SNIC_IOREQ_CMD_COMPLETE"

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/scsi/snic/snic_scsi.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/scsi/snic/snic_scsi.c b/drivers/scsi/snic/snic_scsi.c
index d8a376b7882d..d9b2e46424aa 100644
--- a/drivers/scsi/snic/snic_scsi.c
+++ b/drivers/scsi/snic/snic_scsi.c
@@ -47,10 +47,10 @@ static const char * const snic_req_state_str[] = {
 	[SNIC_IOREQ_NOT_INITED]	= "SNIC_IOREQ_NOT_INITED",
 	[SNIC_IOREQ_PENDING]	= "SNIC_IOREQ_PENDING",
 	[SNIC_IOREQ_ABTS_PENDING] = "SNIC_IOREQ_ABTS_PENDING",
-	[SNIC_IOREQ_ABTS_COMPLETE] = "SNIC_IOREQ_ABTS_COMPELTE",
+	[SNIC_IOREQ_ABTS_COMPLETE] = "SNIC_IOREQ_ABTS_COMPLETE",
 	[SNIC_IOREQ_LR_PENDING]	= "SNIC_IOREQ_LR_PENDING",
-	[SNIC_IOREQ_LR_COMPLETE] = "SNIC_IOREQ_LR_COMPELTE",
-	[SNIC_IOREQ_COMPLETE]	= "SNIC_IOREQ_CMD_COMPELTE",
+	[SNIC_IOREQ_LR_COMPLETE] = "SNIC_IOREQ_LR_COMPLETE",
+	[SNIC_IOREQ_COMPLETE]	= "SNIC_IOREQ_CMD_COMPLETE",
 };
 
 /* snic cmd status strings */
-- 
2.17.0

