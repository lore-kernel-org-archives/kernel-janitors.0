From: Colin King <colin.king@canonical.com>
Date: Thu, 26 Sep 2019 11:57:16 +0000
Subject: [PATCH] scsi: csiostor: clean up indentation issue
Message-Id: <20190926115716.3698-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "James E . J . Bottomley" <jejb@linux.ibm.com>, "Martin K . Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The goto statement is indented incorrectly, remove the extraneous tab.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/scsi/csiostor/csio_mb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/scsi/csiostor/csio_mb.c b/drivers/scsi/csiostor/csio_mb.c
index 6f13673d6aa0..94810b19e747 100644
--- a/drivers/scsi/csiostor/csio_mb.c
+++ b/drivers/scsi/csiostor/csio_mb.c
@@ -1210,7 +1210,7 @@ csio_mb_issue(struct csio_hw *hw, struct csio_mb *mbp)
 		   !csio_is_hw_intr_enabled(hw)) {
 		csio_err(hw, "Cannot issue mailbox in interrupt mode 0x%x\n",
 			 *((uint8_t *)mbp->mb));
-			goto error_out;
+		goto error_out;
 	}
 
 	if (mbm->mcurrent != NULL) {
-- 
2.20.1
