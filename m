From: Dan Carpenter <error27@gmail.com>
Date: Fri, 28 May 2010 10:33:15 +0000
Subject: [patch] sfi: returning freed pointer
Message-Id: <20100528103315.GV22515@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

We never actually use the return value of sfi_sysfs_install_table() but
it still seems wrong to return a freed pointer.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/sfi/sfi_core.c b/drivers/sfi/sfi_core.c
index 0051959..ceba593 100644
--- a/drivers/sfi/sfi_core.c
+++ b/drivers/sfi/sfi_core.c
@@ -441,8 +441,10 @@ struct sfi_table_attr __init *sfi_sysfs_install_table(u64 pa)
 
 	ret = sysfs_create_bin_file(tables_kobj,
 				  &tbl_attr->attr);
-	if (ret)
+	if (ret) {
 		kfree(tbl_attr);
+		tbl_attr = NULL;
+	}
 
 	sfi_unmap_table(th);
 	return tbl_attr;
