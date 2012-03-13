From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 13 Mar 2012 17:21:19 +0000
Subject: [patch] tcm_qla2xxx: checking for NULL instead of IS_ERR()
Message-Id: <20120313172119.GE31808@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Vasquez <andrew.vasquez@qlogic.com>, Nicholas Bellinger <nab@linux-iscsi.org>
Cc: linux-driver@qlogic.com, "James E.J. Bottomley" <JBottomley@parallels.com>, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org

target_fabric_configfs_init() never returns NULLs, only ERR_PTRs.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/scsi/qla2xxx/tcm_qla2xxx.c b/drivers/scsi/qla2xxx/tcm_qla2xxx.c
index dcbcedc..08cf507 100644
--- a/drivers/scsi/qla2xxx/tcm_qla2xxx.c
+++ b/drivers/scsi/qla2xxx/tcm_qla2xxx.c
@@ -1885,9 +1885,9 @@ static int tcm_qla2xxx_register_configfs(void)
 	 * Register the top level struct config_item_type for NPIV with TCM core
 	 */
 	npiv_fabric = target_fabric_configfs_init(THIS_MODULE, "qla2xxx_npiv");
-	if (!npiv_fabric) {
+	if (IS_ERR(npiv_fabric)) {
 		pr_err("target_fabric_configfs_init() failed\n");
-		ret = -ENOMEM;
+		ret = PTR_ERR(npiv_fabric);
 		goto out_fabric;
 	}
 	/*
