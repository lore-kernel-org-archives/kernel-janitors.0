From: Eric Sesterhenn <snakebyte@gmx.de>
Date: Thu, 23 Mar 2006 20:23:11 +0000
Subject: [KJ] [Patch] convert mtd/devices/doc* to symbol_put functions
Message-Id: <1143145391.23038.3.camel@alice>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============28815755087485662=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============28815755087485662==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi,

this is an attemt at converting the doc mtd drivers from
inter_module_* functions to symbol_*
Compile tested with allyes and allmodconfig.
Please comment, even if it looks halfways sane, so i know
i can start working on mtd/chips/cfi* which is the last
module using this stuff in the kernel.

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

diff -ruN linux-2.6.16-git6/drivers/mtd/devices/doc2000.c linux-2.6.16-git6.new/drivers/mtd/devices/doc2000.c
--- linux-2.6.16-git6/drivers/mtd/devices/doc2000.c	2006-03-20 06:53:29.000000000 +0100
+++ linux-2.6.16-git6.new/drivers/mtd/devices/doc2000.c	2006-03-23 20:59:51.000000000 +0100
@@ -519,11 +519,11 @@
 static const char im_name[] = "DoC2k_init";
 
 /* This routine is made available to other mtd code via
- * inter_module_register.  It must only be accessed through
- * inter_module_get which will bump the use count of this module.  The
+ * EXPORT_SYMBOL.  It must only be accessed through
+ * symbol_get which will bump the use count of this module.  The
  * addresses passed back in mtd are valid as long as the use count of
- * this module is non-zero, i.e. between inter_module_get and
- * inter_module_put.  Keith Owens <kaos@ocs.com.au> 29 Oct 2000.
+ * this module is non-zero, i.e. between symbol_get and
+ * symbol_put.  Keith Owens <kaos@ocs.com.au> 29 Oct 2000.
  */
 static void DoC2k_init(struct mtd_info *mtd)
 {
@@ -622,6 +622,7 @@
 		return;
 	}
 }
+EXPORT_SYMBOL(DoC2k_init);
 
 static int doc_read(struct mtd_info *mtd, loff_t from, size_t len,
 		    size_t * retlen, u_char * buf)
@@ -1278,7 +1279,6 @@
 
 static int __init init_doc2000(void)
 {
-       inter_module_register(im_name, THIS_MODULE, &DoC2k_init);
        return 0;
 }
 
@@ -1297,7 +1297,6 @@
 		kfree(this->chips);
 		kfree(mtd);
 	}
-	inter_module_unregister(im_name);
 }
 
 module_exit(cleanup_doc2000);
Files linux-2.6.16-git6/drivers/mtd/devices/.doc2000.c.swp and linux-2.6.16-git6.new/drivers/mtd/devices/.doc2000.c.swp differ
diff -ruN linux-2.6.16-git6/drivers/mtd/devices/doc2001.c linux-2.6.16-git6.new/drivers/mtd/devices/doc2001.c
--- linux-2.6.16-git6/drivers/mtd/devices/doc2001.c	2006-03-20 06:53:29.000000000 +0100
+++ linux-2.6.16-git6.new/drivers/mtd/devices/doc2001.c	2006-03-23 21:00:24.000000000 +0100
@@ -327,11 +327,11 @@
 static const char im_name[] = "DoCMil_init";
 
 /* This routine is made available to other mtd code via
- * inter_module_register.  It must only be accessed through
- * inter_module_get which will bump the use count of this module.  The
+ * EXPORT_SYMBOL.  It must only be accessed through
+ * symbol_get which will bump the use count of this module.  The
  * addresses passed back in mtd are valid as long as the use count of
- * this module is non-zero, i.e. between inter_module_get and
- * inter_module_put.  Keith Owens <kaos@ocs.com.au> 29 Oct 2000.
+ * this module is non-zero, i.e. between symbol_get and
+ * symbol_put.  Keith Owens <kaos@ocs.com.au> 29 Oct 2000.
  */
 static void DoCMil_init(struct mtd_info *mtd)
 {
@@ -401,6 +401,7 @@
 		return;
 	}
 }
+EXPORT_SYMBOL(DoCMil_init);
 
 static int doc_read (struct mtd_info *mtd, loff_t from, size_t len,
 		     size_t *retlen, u_char *buf)
@@ -858,7 +859,6 @@
 
 static int __init init_doc2001(void)
 {
-	inter_module_register(im_name, THIS_MODULE, &DoCMil_init);
 	return 0;
 }
 
@@ -877,7 +877,6 @@
 		kfree(this->chips);
 		kfree(mtd);
 	}
-	inter_module_unregister(im_name);
 }
 
 module_exit(cleanup_doc2001);
diff -ruN linux-2.6.16-git6/drivers/mtd/devices/doc2001plus.c linux-2.6.16-git6.new/drivers/mtd/devices/doc2001plus.c
--- linux-2.6.16-git6/drivers/mtd/devices/doc2001plus.c	2006-03-20 06:53:29.000000000 +0100
+++ linux-2.6.16-git6.new/drivers/mtd/devices/doc2001plus.c	2006-03-23 21:01:10.000000000 +0100
@@ -450,11 +450,11 @@
 static const char im_name[] = "DoCMilPlus_init";
 
 /* This routine is made available to other mtd code via
- * inter_module_register.  It must only be accessed through
- * inter_module_get which will bump the use count of this module.  The
+ * EXPORT_SYMBOL.  It must only be accessed through
+ * symbol_get which will bump the use count of this module.  The
  * addresses passed back in mtd are valid as long as the use count of
- * this module is non-zero, i.e. between inter_module_get and
- * inter_module_put.  Keith Owens <kaos@ocs.com.au> 29 Oct 2000.
+ * this module is non-zero, i.e. between symbol_get and
+ * symbol_put.  Keith Owens <kaos@ocs.com.au> 29 Oct 2000.
  */
 static void DoCMilPlus_init(struct mtd_info *mtd)
 {
@@ -524,6 +524,7 @@
 		return;
 	}
 }
+EXPORT_SYMBOL(DoCMilPlus_init);
 
 #if 0
 static int doc_dumpblk(struct mtd_info *mtd, loff_t from)
@@ -1124,7 +1125,6 @@
 
 static int __init init_doc2001plus(void)
 {
-	inter_module_register(im_name, THIS_MODULE, &DoCMilPlus_init);
 	return 0;
 }
 
@@ -1143,7 +1143,6 @@
 		kfree(this->chips);
 		kfree(mtd);
 	}
-	inter_module_unregister(im_name);
 }
 
 module_exit(cleanup_doc2001plus);
diff -ruN linux-2.6.16-git6/drivers/mtd/devices/docprobe.c linux-2.6.16-git6.new/drivers/mtd/devices/docprobe.c
--- linux-2.6.16-git6/drivers/mtd/devices/docprobe.c	2006-03-20 06:53:29.000000000 +0100
+++ linux-2.6.16-git6.new/drivers/mtd/devices/docprobe.c	2006-03-23 20:51:17.000000000 +0100
@@ -307,14 +307,19 @@
 			break;
 		}
 
-		if (im_funcname)
-			initroutine = inter_module_get_request(im_funcname, im_modname);
-
+		if (im_funcname) {
+			if (!request_module("%s", im_modname))
+				goto fail;
+			
+			initroutine = symbol_get(im_funcname);
+		}
+		
 		if (initroutine) {
 			(*initroutine)(mtd);
-			inter_module_put(im_funcname);
+			symbol_put(im_funcname);
 			return;
 		}
+fail:
 		printk(KERN_NOTICE "Cannot find driver for DiskOnChip %s at 0x%lX\n", name, physadr);
 		kfree(mtd);
 	}



--===============28815755087485662==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============28815755087485662==--
