From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 19 Jun 2013 14:49:04 +0000
Subject: [patch] FMC: NULL dereference on allocation failure
Message-Id: <20130619144904.GA10484@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alessandro Rubini <rubini@gnudd.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

If we don't allocate "arr" then the cleanup path will dereference it and
oops.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/fmc/fmc-sdb.c b/drivers/fmc/fmc-sdb.c
index 74fb326..79adc39 100644
--- a/drivers/fmc/fmc-sdb.c
+++ b/drivers/fmc/fmc-sdb.c
@@ -46,16 +46,17 @@ static struct sdb_array *__fmc_scan_sdb_tree(struct fmc_device *fmc,
 	onew = __sdb_rd(fmc, sdb_addr + 4, convert);
 	n = __be16_to_cpu(*(uint16_t *)&onew);
 	arr = kzalloc(sizeof(*arr), GFP_KERNEL);
-	if (arr) {
-		arr->record = kzalloc(sizeof(arr->record[0]) * n, GFP_KERNEL);
-		arr->subtree = kzalloc(sizeof(arr->subtree[0]) * n, GFP_KERNEL);
-	}
-	if (!arr || !arr->record || !arr->subtree) {
+	if (!arr)
+		return ERR_PTR(-ENOMEM);
+	arr->record = kzalloc(sizeof(arr->record[0]) * n, GFP_KERNEL);
+	arr->subtree = kzalloc(sizeof(arr->subtree[0]) * n, GFP_KERNEL);
+	if (!arr->record || !arr->subtree) {
 		kfree(arr->record);
 		kfree(arr->subtree);
 		kfree(arr);
 		return ERR_PTR(-ENOMEM);
 	}
+
 	arr->len = n;
 	arr->level = level;
 	arr->fmc = fmc;
