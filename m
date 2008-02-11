From: Leonardo Potenza <lpotenza@inwind.it>
Date: Mon, 11 Feb 2008 21:10:17 +0000
Subject: [PATCH] block/genhd.c: compilation warning fix
Message-Id: <200802112210.17467.lpotenza@inwind.it>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: axboe@kernel.dk, linux-kernel@vger.kernel.org

From: Leonardo Potenza <lpotenza@inwind.it>

Added a check for the class_register() return value.

Signed-off-by: Leonardo Potenza <lpotenza@inwind.it>
---

The aim of this patch is to remove the following warning message:
block/genhd.c: In function 'genhd_device_init':
block/genhd.c:361: warning: ignoring return value of 'class_register', declared with attribute warn_unused_result

--- linux-2.6.orig/block/genhd.c
+++ linux-2.6/block/genhd.c
@@ -358,7 +358,12 @@ static struct kobject *base_probe(dev_t 
 
 static int __init genhd_device_init(void)
 {
-	class_register(&block_class);
+	int ret;
+
+	ret = class_register(&block_class);
+	if (ret != 0)
+		return ret;
+
 	bdev_map = kobj_map_init(base_probe, &block_class_lock);
 	blk_dev_init();
 
