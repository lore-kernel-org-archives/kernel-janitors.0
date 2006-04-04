From: Eric Sesterhenn <snakebyte@gmx.de>
Date: Tue, 04 Apr 2006 16:39:29 +0000
Subject: Re: [KJ] [Patch] convert mtd/devices/doc* to symbol_put functions
Message-Id: <1144168769.11325.7.camel@alice>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============41009355192747865=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1143145391.23038.3.camel@alice>
In-Reply-To: <1143145391.23038.3.camel@alice>
To: kernel-janitors@vger.kernel.org

--===============41009355192747865==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, 2006-03-24 at 13:35 +0300, Alexey Dobriyan wrote:
> On Thu, Mar 23, 2006 at 09:23:11PM +0100, Eric Sesterhenn wrote:
> > this is an attemt at converting the doc mtd drivers from
> > inter_module_* functions to symbol_*
> > Compile tested with allyes and allmodconfig.
> > Please comment, even if it looks halfways sane,
> 
> Exporting static functions is something interesting.

Second attempt to convert doc* mtd drivers to the
symbol_* api. compile tested with allyes and allmod
config on i386

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>


diff -up linux-2.6.17-rc1.orig/drivers/mtd/devices/doc2000.c linux-2.6.17-rc1/drivers/mtd/devices/doc2000.c
--- linux-2.6.17-rc1.orig/drivers/mtd/devices/doc2000.c	2006-04-03 19:27:29.000000000 +0200
+++ linux-2.6.17-rc1/drivers/mtd/devices/doc2000.c	2006-04-04 10:46:17.000000000 +0200
@@ -520,13 +520,13 @@ static int DoC2k_is_alias(struct DiskOnC
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
-static void DoC2k_init(struct mtd_info *mtd)
+void DoC2k_init(struct mtd_info *mtd)
 {
 	struct DiskOnChip *this = mtd->priv;
 	struct DiskOnChip *old = NULL;
@@ -623,6 +623,7 @@ static void DoC2k_init(struct mtd_info *
 		return;
 	}
 }
+EXPORT_SYMBOL(DoC2k_init);
 
 static int doc_read(struct mtd_info *mtd, loff_t from, size_t len,
 		    size_t * retlen, u_char * buf)
@@ -1279,7 +1280,6 @@ static int doc_erase(struct mtd_info *mt
 
 static int __init init_doc2000(void)
 {
-       inter_module_register(im_name, THIS_MODULE, &DoC2k_init);
        return 0;
 }
 
@@ -1298,7 +1298,6 @@ static void __exit cleanup_doc2000(void)
 		kfree(this->chips);
 		kfree(mtd);
 	}
-	inter_module_unregister(im_name);
 }
 
 module_exit(cleanup_doc2000);
Only in linux-2.6.17-rc1/drivers/mtd/devices/: doc2000.c.orig
diff -up linux-2.6.17-rc1.orig/drivers/mtd/devices/doc2001.c linux-2.6.17-rc1/drivers/mtd/devices/doc2001.c
--- linux-2.6.17-rc1.orig/drivers/mtd/devices/doc2001.c	2006-04-03 19:27:29.000000000 +0200
+++ linux-2.6.17-rc1/drivers/mtd/devices/doc2001.c	2006-04-04 10:46:29.000000000 +0200
@@ -327,13 +327,13 @@ static int DoCMil_is_alias(struct DiskOn
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
-static void DoCMil_init(struct mtd_info *mtd)
+void DoCMil_init(struct mtd_info *mtd)
 {
 	struct DiskOnChip *this = mtd->priv;
 	struct DiskOnChip *old = NULL;
@@ -401,6 +401,7 @@ static void DoCMil_init(struct mtd_info 
 		return;
 	}
 }
+EXPORT_SYMBOL(DoCMil_init);
 
 static int doc_read (struct mtd_info *mtd, loff_t from, size_t len,
 		     size_t *retlen, u_char *buf)
@@ -858,7 +859,6 @@ int doc_erase (struct mtd_info *mtd, str
 
 static int __init init_doc2001(void)
 {
-	inter_module_register(im_name, THIS_MODULE, &DoCMil_init);
 	return 0;
 }
 
@@ -877,7 +877,6 @@ static void __exit cleanup_doc2001(void)
 		kfree(this->chips);
 		kfree(mtd);
 	}
-	inter_module_unregister(im_name);
 }
 
 module_exit(cleanup_doc2001);
diff -up linux-2.6.17-rc1.orig/drivers/mtd/devices/doc2001plus.c linux-2.6.17-rc1/drivers/mtd/devices/doc2001plus.c
--- linux-2.6.17-rc1.orig/drivers/mtd/devices/doc2001plus.c	2006-04-03 19:27:29.000000000 +0200
+++ linux-2.6.17-rc1/drivers/mtd/devices/doc2001plus.c	2006-04-04 10:46:45.000000000 +0200
@@ -450,13 +450,13 @@ static int DoCMilPlus_is_alias(struct Di
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
-static void DoCMilPlus_init(struct mtd_info *mtd)
+void DoCMilPlus_init(struct mtd_info *mtd)
 {
 	struct DiskOnChip *this = mtd->priv;
 	struct DiskOnChip *old = NULL;
@@ -524,6 +524,7 @@ static void DoCMilPlus_init(struct mtd_i
 		return;
 	}
 }
+EXPORT_SYMBOL(DoCMilPlus_init);
 
 #if 0
 static int doc_dumpblk(struct mtd_info *mtd, loff_t from)
@@ -1124,7 +1125,6 @@ int doc_erase(struct mtd_info *mtd, stru
 
 static int __init init_doc2001plus(void)
 {
-	inter_module_register(im_name, THIS_MODULE, &DoCMilPlus_init);
 	return 0;
 }
 
@@ -1143,7 +1143,6 @@ static void __exit cleanup_doc2001plus(v
 		kfree(this->chips);
 		kfree(mtd);
 	}
-	inter_module_unregister(im_name);
 }
 
 module_exit(cleanup_doc2001plus);
diff -up linux-2.6.17-rc1.orig/drivers/mtd/devices/docprobe.c linux-2.6.17-rc1/drivers/mtd/devices/docprobe.c
--- linux-2.6.17-rc1.orig/drivers/mtd/devices/docprobe.c	2006-04-03 19:27:29.000000000 +0200
+++ linux-2.6.17-rc1/drivers/mtd/devices/docprobe.c	2006-04-03 19:32:19.000000000 +0200
@@ -307,14 +307,19 @@ static void __init DoC_Probe(unsigned lo
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



--===============41009355192747865==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============41009355192747865==--
