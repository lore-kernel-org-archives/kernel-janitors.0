From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 15 Aug 2013 05:55:41 +0000
Subject: [patch] target/pscsi: remove an unneeded check
Message-Id: <20130815055540.GE23580@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Nicholas A. Bellinger" <nab@linux-iscsi.org>
Cc: linux-scsi@vger.kernel.org, target-devel@vger.kernel.org, kernel-janitors@vger.kernel.org

blk_get_request() just returns NULL on error, it doesn't return an
ERR_PTR.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/target/target_core_pscsi.c b/drivers/target/target_core_pscsi.c
index e992b27..9170b36 100644
--- a/drivers/target/target_core_pscsi.c
+++ b/drivers/target/target_core_pscsi.c
@@ -1050,9 +1050,8 @@ pscsi_execute_cmd(struct se_cmd *cmd)
 		req = blk_get_request(pdv->pdv_sd->request_queue,
 				(data_direction = DMA_TO_DEVICE),
 				GFP_KERNEL);
-		if (!req || IS_ERR(req)) {
-			pr_err("PSCSI: blk_get_request() failed: %ld\n",
-					req ? IS_ERR(req) : -ENOMEM);
+		if (!req) {
+			pr_err("PSCSI: blk_get_request() failed\n");
 			ret = TCM_LOGICAL_UNIT_COMMUNICATION_FAILURE;
 			goto fail;
 		}
