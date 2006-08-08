From: Alexander Bodnarashik <boda2004@mail.ru>
Date: Tue, 08 Aug 2006 10:03:37 +0000
Subject: [KJ] [PATCH] include/asm-frv/*.h: printk("SOMETEXT"....) ->
Message-Id: <44D86179.2060706@mail.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------090404070107050406070503"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format.
--------------090404070107050406070503
Content-Type: text/plain; charset=KOI8-R; format=flowed
Content-Transfer-Encoding: 7bit

I've tried to cleanup some code inside "include/asm-frv" folder. Hope i understand the meaning of KERN_* constants correctly.

Signed-off-by: Alexander Bodnarashik <boda2004@mail.ru>


--------------090404070107050406070503
Content-Type: text/x-patch;
 name="asm-frv.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="asm-frv.patch"

diff --git a/include/asm-frv/math-emu.h b/include/asm-frv/math-emu.h
index 0c8f731..c450309 100644
--- a/include/asm-frv/math-emu.h
+++ b/include/asm-frv/math-emu.h
@@ -117,9 +117,9 @@ extern unsigned int fp_debugprint;
 	static int __count = 3;				\
 							\
 	if (__count > 0) {				\
-		printk("You just hit an unimplemented "	\
+		printk(KERN_WARNING "You just hit an unimplemented "	\
 		       "fpu instruction (%s)\n", str);	\
-		printk("Please report this to ....\n");	\
+		printk(KERN_WARNING "Please report this to ....\n");	\
 		__count--;				\
 	}						\
 })
diff --git a/include/asm-frv/pgtable.h b/include/asm-frv/pgtable.h
index 7af7485..ff341a3 100644
--- a/include/asm-frv/pgtable.h
+++ b/include/asm-frv/pgtable.h
@@ -156,13 +156,13 @@ extern unsigned long empty_zero_page;
 extern pgd_t swapper_pg_dir[PTRS_PER_PGD];
 
 #define pte_ERROR(e) \
-	printk("%s:%d: bad pte %08lx.\n", __FILE__, __LINE__, (e).pte)
+	printk(KERN_ERR "%s:%d: bad pte %08lx.\n", __FILE__, __LINE__, (e).pte)
 #define pmd_ERROR(e) \
-	printk("%s:%d: bad pmd %08lx.\n", __FILE__, __LINE__, pmd_val(e))
+	printk(KERN_ERR "%s:%d: bad pmd %08lx.\n", __FILE__, __LINE__, pmd_val(e))
 #define pud_ERROR(e) \
-	printk("%s:%d: bad pud %08lx.\n", __FILE__, __LINE__, pmd_val(pud_val(e)))
+	printk(KERN_ERR "%s:%d: bad pud %08lx.\n", __FILE__, __LINE__, pmd_val(pud_val(e)))
 #define pgd_ERROR(e) \
-	printk("%s:%d: bad pgd %08lx.\n", __FILE__, __LINE__, pmd_val(pud_val(pgd_val(e))))
+	printk(KERN_ERR "%s:%d: bad pgd %08lx.\n", __FILE__, __LINE__, pmd_val(pud_val(pgd_val(e))))
 
 /*
  * Certain architectures need to do special things when PTEs

--------------090404070107050406070503
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--------------090404070107050406070503--
