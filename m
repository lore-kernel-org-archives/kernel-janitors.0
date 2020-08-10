From: Colin King <colin.king@canonical.com>
Date: Mon, 10 Aug 2020 10:12:38 +0000
Subject: [PATCH] lpfc: fix spelling mistake "Cant" -> "Can't"
Message-Id: <20200810101238.61787-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: James Smart <james.smart@broadcom.com>, Dick Kennedy <dick.kennedy@broadcom.com>, "James E . J . Bottomley" <jejb@linux.ibm.com>, linux-scsi@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in an error message. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/scsi/lpfc/lpfc_debugfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/scsi/lpfc/lpfc_debugfs.c b/drivers/scsi/lpfc/lpfc_debugfs.c
index ae0a8252128c..d6c07eeedd69 100644
--- a/drivers/scsi/lpfc/lpfc_debugfs.c
+++ b/drivers/scsi/lpfc/lpfc_debugfs.c
@@ -5944,7 +5944,7 @@ lpfc_debugfs_initialize(struct lpfc_vport *vport)
 					    phba, &lpfc_debugfs_op_lockstat);
 		if (!phba->debug_lockstat) {
 			lpfc_printf_vlog(vport, KERN_ERR, LOG_INIT,
-					 "4610 Cant create debugfs lockstat\n");
+					 "4610 Can't create debugfs lockstat\n");
 			goto debug_failed;
 		}
 #endif
-- 
2.27.0
