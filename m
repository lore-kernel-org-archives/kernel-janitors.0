From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 19 Jul 2013 05:49:38 +0000
Subject: [patch] mtd: use correct error codes in debugfs_create()
Message-Id: <20130719054938.GC9729@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Woodhouse <dwmw2@infradead.org>
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>, kernel-janitors@vger.kernel.org, Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, Akinobu Mita <akinobu.mita@gmail.com>

The test here is reversed.  It should be that if "dent" is a valid error
code then we use it, otherwise if it is NULL then use -ENODEV.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/mtd/ubi/debug.c b/drivers/mtd/ubi/debug.c
index 63cb1d7..3916782 100644
--- a/drivers/mtd/ubi/debug.c
+++ b/drivers/mtd/ubi/debug.c
@@ -236,7 +236,7 @@ int ubi_debugfs_init(void)
 
 	dfs_rootdir = debugfs_create_dir("ubi", NULL);
 	if (IS_ERR_OR_NULL(dfs_rootdir)) {
-		int err = dfs_rootdir ? -ENODEV : PTR_ERR(dfs_rootdir);
+		int err = dfs_rootdir ? PTR_ERR(dfs_rootdir) : -ENODEV;
 
 		ubi_err("cannot create \"ubi\" debugfs directory, error %d\n",
 			err);
diff --git a/drivers/mtd/nand/nandsim.c b/drivers/mtd/nand/nandsim.c
index cb38f3d..f06863a 100644
--- a/drivers/mtd/nand/nandsim.c
+++ b/drivers/mtd/nand/nandsim.c
@@ -530,7 +530,7 @@ static int nandsim_debugfs_create(struct nandsim *dev)
 
 	dent = debugfs_create_dir("nandsim", NULL);
 	if (IS_ERR_OR_NULL(dent)) {
-		int err = dent ? -ENODEV : PTR_ERR(dent);
+		int err = dent ? PTR_ERR(dent) : -ENODEV;
 
 		NS_ERR("cannot create \"nandsim\" debugfs directory, err %d\n",
 			err);
