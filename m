From: Eric Sesterhenn <snakebyte@gmx.de>
Date: Fri, 24 Mar 2006 09:58:04 +0000
Subject: [KJ] [Patch] convert mtd/chips/cfi* to symbol_put functions
Message-Id: <1143194284.14088.2.camel@alice>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============91842021953150166=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============91842021953150166==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi,

since there are no flames yet for the other patch, i try
my luck again. I am happy about comments, but am afk
for the next week so it might take some time to reply.

This patch converts the cfi modules to the symbol_*
api.

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

diff -ruN linux-2.6.16-git6/drivers/mtd/chips/cfi_cmdset_0001.c linux-2.6.16-git6.new/drivers/mtd/chips/cfi_cmdset_0001.c
--- linux-2.6.16-git6/drivers/mtd/chips/cfi_cmdset_0001.c	2006-03-20 06:53:29.000000000 +0100
+++ linux-2.6.16-git6.new/drivers/mtd/chips/cfi_cmdset_0001.c	2006-03-24 10:40:48.000000000 +0100
@@ -332,11 +332,11 @@
 }
 
 /* This routine is made available to other mtd code via
- * inter_module_register.  It must only be accessed through
- * inter_module_get which will bump the use count of this module.  The
+ * EXPORT_SYMBOL.  It must only be accessed through
+ * symbol_get which will bump the use count of this module.  The
  * addresses passed back in cfi are valid as long as the use count of
- * this module is non-zero, i.e. between inter_module_get and
- * inter_module_put.  Keith Owens <kaos@ocs.com.au> 29 Oct 2000.
+ * this module is non-zero, i.e. between symbol_get and
+ * symbol_put.  Keith Owens <kaos@ocs.com.au> 29 Oct 2000.
  */
 struct mtd_info *cfi_cmdset_0001(struct map_info *map, int primary)
 {
@@ -2445,23 +2445,15 @@
 	kfree(mtd->eraseregions);
 }
 
-static char im_name_0001[] = "cfi_cmdset_0001";
-static char im_name_0003[] = "cfi_cmdset_0003";
-static char im_name_0200[] = "cfi_cmdset_0200";
+EXPORT_SYMBOL(cfi_cmdset_0001);
 
 static int __init cfi_intelext_init(void)
 {
-	inter_module_register(im_name_0001, THIS_MODULE, &cfi_cmdset_0001);
-	inter_module_register(im_name_0003, THIS_MODULE, &cfi_cmdset_0001);
-	inter_module_register(im_name_0200, THIS_MODULE, &cfi_cmdset_0001);
 	return 0;
 }
 
 static void __exit cfi_intelext_exit(void)
 {
-	inter_module_unregister(im_name_0001);
-	inter_module_unregister(im_name_0003);
-	inter_module_unregister(im_name_0200);
 }
 
 module_init(cfi_intelext_init);
diff -ruN linux-2.6.16-git6/drivers/mtd/chips/cfi_cmdset_0002.c linux-2.6.16-git6.new/drivers/mtd/chips/cfi_cmdset_0002.c
--- linux-2.6.16-git6/drivers/mtd/chips/cfi_cmdset_0002.c	2006-03-20 06:53:29.000000000 +0100
+++ linux-2.6.16-git6.new/drivers/mtd/chips/cfi_cmdset_0002.c	2006-03-24 10:41:07.000000000 +0100
@@ -1758,19 +1758,16 @@
 	kfree(mtd->eraseregions);
 }
 
-static char im_name[]="cfi_cmdset_0002";
-
+EXPORT_SYMBOL(cfi_cmdset_0002);
 
 static int __init cfi_amdstd_init(void)
 {
-	inter_module_register(im_name, THIS_MODULE, &cfi_cmdset_0002);
 	return 0;
 }
 
 
 static void __exit cfi_amdstd_exit(void)
 {
-	inter_module_unregister(im_name);
 }
 
 
diff -ruN linux-2.6.16-git6/drivers/mtd/chips/cfi_cmdset_0020.c linux-2.6.16-git6.new/drivers/mtd/chips/cfi_cmdset_0020.c
--- linux-2.6.16-git6/drivers/mtd/chips/cfi_cmdset_0020.c	2006-03-20 06:53:29.000000000 +0100
+++ linux-2.6.16-git6.new/drivers/mtd/chips/cfi_cmdset_0020.c	2006-03-24 10:41:16.000000000 +0100
@@ -108,11 +108,11 @@
 #endif
 
 /* This routine is made available to other mtd code via
- * inter_module_register.  It must only be accessed through
- * inter_module_get which will bump the use count of this module.  The
+ * EXPORT_SYMBOL.  It must only be accessed through
+ * symbol_get which will bump the use count of this module.  The
  * addresses passed back in cfi are valid as long as the use count of
- * this module is non-zero, i.e. between inter_module_get and
- * inter_module_put.  Keith Owens <kaos@ocs.com.au> 29 Oct 2000.
+ * this module is non-zero, i.e. between symbol_get and
+ * symbol_put.  Keith Owens <kaos@ocs.com.au> 29 Oct 2000.
  */
 struct mtd_info *cfi_cmdset_0020(struct map_info *map, int primary)
 {
@@ -1410,17 +1410,15 @@
 	kfree(cfi);
 }
 
-static char im_name[]="cfi_cmdset_0020";
+EXPORT_SYMBOL(cfi_cmdset_0020);
 
 static int __init cfi_staa_init(void)
 {
-	inter_module_register(im_name, THIS_MODULE, &cfi_cmdset_0020);
 	return 0;
 }
 
 static void __exit cfi_staa_exit(void)
 {
-	inter_module_unregister(im_name);
 }
 
 module_init(cfi_staa_init);
diff -ruN linux-2.6.16-git6/drivers/mtd/chips/gen_probe.c linux-2.6.16-git6.new/drivers/mtd/chips/gen_probe.c
--- linux-2.6.16-git6/drivers/mtd/chips/gen_probe.c	2006-03-20 06:53:29.000000000 +0100
+++ linux-2.6.16-git6.new/drivers/mtd/chips/gen_probe.c	2006-03-24 10:40:07.000000000 +0100
@@ -200,14 +200,17 @@
 
 	sprintf(probename, "cfi_cmdset_%4.4X", type);
 
-	probe_function = inter_module_get_request(probename, probename);
+	if (!request_module(probename))
+			return NULL;
+			
+	probe_function = symbol_get(probename);
 
 	if (probe_function) {
 		struct mtd_info *mtd;
 
 		mtd = (*probe_function)(map, primary);
 		/* If it was happy, it'll have increased its own use count */
-		inter_module_put(probename);
+		symbol_put(probename);
 		return mtd;
 	}
 #endif



--===============91842021953150166==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============91842021953150166==--
