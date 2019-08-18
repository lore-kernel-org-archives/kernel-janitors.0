From: Colin King <colin.king@canonical.com>
Date: Sun, 18 Aug 2019 18:46:49 +0000
Subject: [PATCH] staging: rts5208: remove redundant assignment to retval
Message-Id: <20190818184649.13828-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Variable retval is initialized to a value that is never read and it
is re-assigned later. The initialization is redundant and can be
removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/staging/rts5208/ms.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rts5208/ms.c b/drivers/staging/rts5208/ms.c
index 1128eec3bd08..e853fa9cc950 100644
--- a/drivers/staging/rts5208/ms.c
+++ b/drivers/staging/rts5208/ms.c
@@ -3842,7 +3842,7 @@ int mg_set_leaf_id(struct scsi_cmnd *srb, struct rtsx_chip *chip)
 
 int mg_get_local_EKB(struct scsi_cmnd *srb, struct rtsx_chip *chip)
 {
-	int retval = STATUS_FAIL;
+	int retval;
 	int bufflen;
 	unsigned int lun = SCSI_LUN(srb);
 	u8 *buf = NULL;
-- 
2.20.1
