From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 16 Dec 2015 11:07:46 +0000
Subject: [patch] qla2xxx: fix a timeout loop
Message-Id: <20151216110746.GB21018@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: qla2xxx-upstream@qlogic.com, Atul Deshmukh <atul.deshmukh@qlogic.com>
Cc: "James E.J. Bottomley" <JBottomley@odin.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org

After the loop we test for "if (!retries) " as a failure, but actually
the post-op here will end with retries set to -1.  I have fixed this by
using a pre-op instead.

Fixes: 7ec0effd30bb ('[SCSI] qla2xxx: Add support for ISP8044.')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/scsi/qla2xxx/qla_nx2.c b/drivers/scsi/qla2xxx/qla_nx2.c
index 007192d..66d629e 100644
--- a/drivers/scsi/qla2xxx/qla_nx2.c
+++ b/drivers/scsi/qla2xxx/qla_nx2.c
@@ -3491,7 +3491,7 @@ qla8044_poll_flash_status_reg(struct scsi_qla_host *vha)
 	int retries = QLA8044_FLASH_READ_RETRY_COUNT;
 	int ret_val = QLA_SUCCESS;
 
-	while (retries--) {
+	while (--retries) {
 		ret_val = qla8044_rd_reg_indirect(vha, QLA8044_FLASH_STATUS,
 		    &flash_status);
 		if (ret_val) {
