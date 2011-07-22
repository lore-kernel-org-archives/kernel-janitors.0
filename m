From: Noah Watkins <noahwatkins@gmail.com>
Date: Fri, 22 Jul 2011 17:04:05 +0000
Subject: [PATCH 2/2] zram: make global var "num_devices" use unique name
Message-Id: <CAB2gnbXfztJ-31-VFLMU1E0YPjVWsVnxmf+i6yFG+AHWPbTAWw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

The global variable "num_devices" is too general to be
global. This patch switches the name to be "zram_num_devices".

Signed-off-by: Noah Watkins <noahwatkins@gmail.com>

diff --git a/drivers/staging/zram/zram_drv.c b/drivers/staging/zram/zram_drv.c
index 11e7e92..ec66b0a 100644
--- a/drivers/staging/zram/zram_drv.c
+++ b/drivers/staging/zram/zram_drv.c
@@ -40,7 +40,7 @@ static int zram_major;
 struct zram *zram_devices;

 /* Module params (documentation at end) */
-unsigned int num_devices;
+unsigned int zram_num_devices;

 static void zram_stat_inc(u32 *v)
 {
@@ -780,9 +780,9 @@ static int __init zram_init(void)
 {
 	int ret, dev_id;

-	if (num_devices > max_num_devices) {
+	if (zram_num_devices > max_num_devices) {
 		pr_warning("Invalid value for num_devices: %u\n",
-				num_devices);
+				zram_num_devices);
 		ret = -EINVAL;
 		goto out;
 	}
@@ -794,20 +794,20 @@ static int __init zram_init(void)
 		goto out;
 	}

-	if (!num_devices) {
+	if (!zram_num_devices) {
 		pr_info("num_devices not specified. Using default: 1\n");
-		num_devices = 1;
+		zram_num_devices = 1;
 	}

 	/* Allocate the device array and initialize each one */
-	pr_info("Creating %u devices ...\n", num_devices);
-	zram_devices = kzalloc(num_devices * sizeof(struct zram), GFP_KERNEL);
+	pr_info("Creating %u devices ...\n", zram_num_devices);
+	zram_devices = kzalloc(zram_num_devices * sizeof(struct zram), GFP_KERNEL);
 	if (!zram_devices) {
 		ret = -ENOMEM;
 		goto unregister;
 	}

-	for (dev_id = 0; dev_id < num_devices; dev_id++) {
+	for (dev_id = 0; dev_id < zram_num_devices; dev_id++) {
 		ret = create_device(&zram_devices[dev_id], dev_id);
 		if (ret)
 			goto free_devices;
@@ -830,7 +830,7 @@ static void __exit zram_exit(void)
 	int i;
 	struct zram *zram;

-	for (i = 0; i < num_devices; i++) {
+	for (i = 0; i < zram_num_devices; i++) {
 		zram = &zram_devices[i];

 		destroy_device(zram);
@@ -844,8 +844,8 @@ static void __exit zram_exit(void)
 	pr_debug("Cleanup done!\n");
 }

-module_param(num_devices, uint, 0);
-MODULE_PARM_DESC(num_devices, "Number of zram devices");
+module_param(zram_num_devices, uint, 0);
+MODULE_PARM_DESC(zram_num_devices, "Number of zram devices");

 module_init(zram_init);
 module_exit(zram_exit);
diff --git a/drivers/staging/zram/zram_drv.h b/drivers/staging/zram/zram_drv.h
index 0e4b540..59b01d6 100644
--- a/drivers/staging/zram/zram_drv.h
+++ b/drivers/staging/zram/zram_drv.h
@@ -124,7 +124,7 @@ struct zram {
 };

 extern struct zram *zram_devices;
-extern unsigned int num_devices;
+extern unsigned int zram_num_devices;
 #ifdef CONFIG_SYSFS
 extern struct attribute_group zram_disk_attr_group;
 #endif
diff --git a/drivers/staging/zram/zram_sysfs.c
b/drivers/staging/zram/zram_sysfs.c
index 0f001e8..df1f9dc 100644
--- a/drivers/staging/zram/zram_sysfs.c
+++ b/drivers/staging/zram/zram_sysfs.c
@@ -34,7 +34,7 @@ static struct zram *dev_to_zram(struct device *dev)
 	int i;
 	struct zram *zram = NULL;

-	for (i = 0; i < num_devices; i++) {
+	for (i = 0; i < zram_num_devices; i++) {
 		zram = &zram_devices[i];
 		if (disk_to_dev(zram->disk) = dev)
 			break;
-- 
1.7.5.4
