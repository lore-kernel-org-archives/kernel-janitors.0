From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 17 Apr 2012 06:29:46 +0000
Subject: [patch] sbp-target: checking for NULL instead of IS_ERR()
Message-Id: <20120417062946.GB26756@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

target_fabric_configfs_init() never returns NULL, it only returns
ERR_PTRs.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/target/sbp/sbp_target.c b/drivers/target/sbp/sbp_target.c
index 37c6098..d605971 100644
--- a/drivers/target/sbp/sbp_target.c
+++ b/drivers/target/sbp/sbp_target.c
@@ -2559,9 +2559,9 @@ static int sbp_register_configfs(void)
 	int ret;
 
 	fabric = target_fabric_configfs_init(THIS_MODULE, "sbp");
-	if (!fabric) {
+	if (IS_ERR(fabric)) {
 		pr_err("target_fabric_configfs_init() failed\n");
-		return -ENOMEM;
+		return PTR_ERR(fabric);
 	}
 
 	fabric->tf_ops = sbp_ops;
