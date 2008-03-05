From: Jon Schindler <jkschind@gmail.com>
Date: Wed, 05 Mar 2008 05:49:12 +0000
Subject: [PATCH 2/11] /drivers/block/ps2esdi.c replaced init_module&cleanup_module
Message-Id: <47CE3458.3010906@watson.wustl.edu>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, trivial@kernel.org, Andrew Morton <akpm@linux-foundation.org>

Replaced init_module and cleanup_module with static functions and module_init/module_exit.

Signed-off-by: Jon Schindler <jkschind@gmail.com>
---
diff --git a/drivers/block/ps2esdi.c b/drivers/block/ps2esdi.c
index 3c796e2..edcd150 100644
--- a/drivers/block/ps2esdi.c
+++ b/drivers/block/ps2esdi.c
@@ -135,7 +135,7 @@ static struct block_device_operations ps2esdi_fops  
 static struct gendisk *ps2esdi_gendisk[2];
 
-/* initialization routine called by ll_rw_blk.c   */
+/* initialization routine used when compiled into kernel   */
 static int __init ps2esdi_init(void)
 {
 
@@ -180,7 +180,10 @@ module_param_array(head, int, NULL, 0);
 module_param_array(sect, int, NULL, 0);
 MODULE_LICENSE("GPL");
 
-int init_module(void) {
+/* extra work needs to be done in addition to ps2esdi_init
+ * when compiled as a module */
+static int __init ps2esdi_init_module(void)
+{
 	int drive;
 
 	for(drive = 0; drive < MAX_HD; drive++) {
@@ -198,9 +201,10 @@ int init_module(void) {
 	}
 	return ps2esdi_init();
 }
+module_init(ps2esdi_init_module);
 
-void
-cleanup_module(void) {
+static void __exit ps2esdi_cleanup_module(void)
+{
 	int i;
 	if(ps2esdi_slot) {
 		mca_mark_as_unused(ps2esdi_slot);
@@ -216,6 +220,8 @@ cleanup_module(void) {
 		put_disk(ps2esdi_gendisk[i]);
 	}
 }
+module_exit(ps2esdi_cleanup_module);
+
 #endif /* MODULE */
 
 /* handles boot time command line parameters */
