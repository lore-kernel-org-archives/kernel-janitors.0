From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 08 Feb 2012 09:25:04 +0000
Subject: [patch] pps: checking for NULL instead of IS_ERR()
Message-Id: <20120208092504.GD6554@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rodolfo Giometti <giometti@enneenne.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

class_create() never returns NULLs only ERR_PTRs.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/pps/pps.c b/drivers/pps/pps.c
index 2baadd2..98fbe62 100644
--- a/drivers/pps/pps.c
+++ b/drivers/pps/pps.c
@@ -369,9 +369,9 @@ static int __init pps_init(void)
 	int err;
 
 	pps_class = class_create(THIS_MODULE, "pps");
-	if (!pps_class) {
+	if (IS_ERR(pps_class)) {
 		pr_err("failed to allocate class\n");
-		return -ENOMEM;
+		return PTR_ERR(pps_class);
 	}
 	pps_class->dev_attrs = pps_attrs;
 
