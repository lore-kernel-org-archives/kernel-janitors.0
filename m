From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 23 Nov 2018 07:14:42 +0000
Subject: [PATCH 1/2] i3c: fix an error code in i3c_master_add_i3c_dev_locked()
Message-Id: <20181123071324.iwmbay2yrbiocisf@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

We should return "ret" as-is.  The "newdev" variable is a valid pointer.

Fixes: 3a379bbcea0a ("i3c: Add core I3C infrastructure")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/i3c/master.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index 0ea7bb045fad..bda4b9613e53 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -1823,10 +1823,8 @@ int i3c_master_add_i3c_dev_locked(struct i3c_master_controller *master,
 		return PTR_ERR(newdev);
 
 	ret = i3c_master_attach_i3c_dev(master, newdev);
-	if (ret) {
-		ret = PTR_ERR(newdev);
+	if (ret)
 		goto err_free_dev;
-	}
 
 	ret = i3c_master_retrieve_dev_info(newdev);
 	if (ret)
-- 
2.11.0
