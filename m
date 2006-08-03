From: Neil Horman <nhorman@tuxdriver.com>
Date: Thu, 03 Aug 2006 19:18:28 +0000
Subject: [KJ] [KJ PATCH] sh: fix proc file removal for superh store queue
Message-Id: <20060803191828.GA5004@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Patch to balance proc file creation and removal for superh store queue module.
Currently a failure in module load, or a module unload leaves a proc file
registered, causing an oops in the event the proc file is read.  This patch
corrects that.

Thanks & Regards
Neil

Signed-off-by: Neil Horman <nhorman@tuxdriver.com>


 sq.c |   11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)


diff --git a/arch/sh/kernel/cpu/sh4/sq.c b/arch/sh/kernel/cpu/sh4/sq.c
index 781dbb1..18b092c 100644
--- a/arch/sh/kernel/cpu/sh4/sq.c
+++ b/arch/sh/kernel/cpu/sh4/sq.c
@@ -421,18 +421,27 @@ static struct miscdevice sq_dev = {
 
 static int __init sq_api_init(void)
 {
+	int ret;
 	printk(KERN_NOTICE "sq: Registering store queue API.\n");
 
 #ifdef CONFIG_PROC_FS
 	create_proc_read_entry("sq_mapping", 0, 0, sq_mapping_read_proc, 0);
 #endif
 
-	return misc_register(&sq_dev);
+	ret = misc_register(&sq_dev);
+#ifdef CONFIG_PROC_FS
+	if (ret) 
+		remove_proc_entry("sq_mapping", NULL);
+#endif
+	return ret;
 }
 
 static void __exit sq_api_exit(void)
 {
 	misc_deregister(&sq_dev);
+#ifdef CONFIG_PROC_FS
+	remove_proc_entry("sq_mapping", NULL);
+#endif
 }
 
 module_init(sq_api_init);
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
