From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 26 Aug 2020 11:37:59 +0000
Subject: [PATCH] memory: emif: Remove bogus debugfs error handling
Message-Id: <20200826113759.GF393664@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Santosh Shilimkar <ssantosh@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Callers are generally not supposed to check the return values from
debugfs functions.  Debugfs functions never return NULL so this error
handling will never trigger.  (Historically debugfs functions used to
return a mix of NULL and error pointers but it was eventually deemed too
complicated for something which wasn't intended to be used in normal
situations).

Delete all the error handling.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/memory/emif.c | 33 +++++----------------------------
 1 file changed, 5 insertions(+), 28 deletions(-)

diff --git a/drivers/memory/emif.c b/drivers/memory/emif.c
index bb6a71d26798..5c4d8319c9cf 100644
--- a/drivers/memory/emif.c
+++ b/drivers/memory/emif.c
@@ -163,35 +163,12 @@ static const struct file_operations emif_mr4_fops = {
 
 static int __init_or_module emif_debugfs_init(struct emif_data *emif)
 {
-	struct dentry	*dentry;
-	int		ret;
-
-	dentry = debugfs_create_dir(dev_name(emif->dev), NULL);
-	if (!dentry) {
-		ret = -ENOMEM;
-		goto err0;
-	}
-	emif->debugfs_root = dentry;
-
-	dentry = debugfs_create_file("regcache_dump", S_IRUGO,
-			emif->debugfs_root, emif, &emif_regdump_fops);
-	if (!dentry) {
-		ret = -ENOMEM;
-		goto err1;
-	}
-
-	dentry = debugfs_create_file("mr4", S_IRUGO,
-			emif->debugfs_root, emif, &emif_mr4_fops);
-	if (!dentry) {
-		ret = -ENOMEM;
-		goto err1;
-	}
-
+	emif->debugfs_root = debugfs_create_dir(dev_name(emif->dev), NULL);
+	debugfs_create_file("regcache_dump", S_IRUGO, emif->debugfs_root, emif,
+			    &emif_regdump_fops);
+	debugfs_create_file("mr4", S_IRUGO, emif->debugfs_root, emif,
+			    &emif_mr4_fops);
 	return 0;
-err1:
-	debugfs_remove_recursive(emif->debugfs_root);
-err0:
-	return ret;
 }
 
 static void __exit emif_debugfs_exit(struct emif_data *emif)
-- 
2.28.0
