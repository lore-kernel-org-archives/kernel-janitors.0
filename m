From: James Nelson <james4765@cwazy.co.uk>
Date: Tue, 25 Jan 2005 23:15:24 +0000
Subject: [KJ] [PATCH 46/53] savagefb: Clean up printk()'s in
Message-Id: <20050125231523.10418.15356.11157@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============4935394858133435=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============4935394858133435==

This patch adds KERN_ constants to all of the printk()'s that need them in
drivers/video/savage/savagefb.c

Signed-off-by: James Nelson <james4765@gmail.com>

diff -urN --exclude='*~' linux-2.6.11-rc2-mm1-original/drivers/video/savage/savagefb.c linux-2.6.11-rc2-mm1/drivers/video/savage/savagefb.c
--- linux-2.6.11-rc2-mm1-original/drivers/video/savage/savagefb.c	2005-01-24 17:15:49.000000000 -0500
+++ linux-2.6.11-rc2-mm1/drivers/video/savage/savagefb.c	2005-01-24 19:07:04.146257001 -0500
@@ -41,6 +41,8 @@
  *
  */
 
+#undef DEBUG
+
 #include <linux/config.h>
 #include <linux/module.h>
 #include <linux/kernel.h>
@@ -474,7 +476,7 @@
 	return 0;
 }
 
-#ifdef SAVAGEFB_DEBUG
+#ifdef DEBUG
 /* This function is used to debug, it prints out the contents of s3 regs */
 
 static void SavagePrintRegs(void)
@@ -483,27 +485,32 @@
 	int vgaCRIndex = 0x3d4;
 	int vgaCRReg = 0x3d5;
 
-	printk(KERN_DEBUG "SR    x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 xA xB xC xD xE "
-	       "xF" );
+	pr_debug("SR    x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 xA xB xC xD xE xF" );
 
 	for( i = 0; i < 0x70; i++ ) {
-		if( !(i % 16) )
-			printk(KERN_DEBUG "\nSR%xx ", i >> 4 );
+		if( !(i % 16) ) {
+			printk("\n");
+			pr_debug("SR%xx ", i >> 4 );
+		}
 		vga_out8( 0x3c4, i );
-		printk(KERN_DEBUG " %02x", vga_in8(0x3c5) );
+		printk(" %02x", vga_in8(0x3c5) );
 	}
+	printk("\n");
 
-	printk(KERN_DEBUG "\n\nCR    x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 xA xB xC "
-	       "xD xE xF" );
+	pr_debug("---BREAK---\n");
+	pr_debug("CR    x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 xA xB xC xD xE xF" );
 
 	for( i = 0; i < 0xB7; i++ ) {
-		if( !(i % 16) )
-			printk(KERN_DEBUG "\nCR%xx ", i >> 4 );
+		if( !(i % 16) ) {
+			printk("\n");
+			pr_debug("CR%xx ", i >> 4 );
+		}
 		vga_out8( vgaCRIndex, i );
-		printk(KERN_DEBUG " %02x", vga_in8(vgaCRReg) );
+		pr_debug(" %02x", vga_in8(vgaCRReg) );
 	}
+	printk("\n");
 
-	printk(KERN_DEBUG "\n\n");
+	pr_debug("---END---\n");
 }
 #endif
 
@@ -1489,7 +1496,7 @@
 
 	par->mmio.vbase = ioremap (par->mmio.pbase, par->mmio.len);
 	if (!par->mmio.vbase) {
-		printk ("savagefb: unable to map memory mapped IO\n");
+		printk (KERN_ERR "savagefb: unable to map memory mapped IO\n");
 		return -ENOMEM;
 	} else
 		printk (KERN_INFO "savagefb: mapped io at %p\n",
@@ -1537,7 +1544,7 @@
 	par->video.vbase = ioremap (par->video.pbase, par->video.len);
 
 	if (!par->video.vbase) {
-		printk ("savagefb: unable to map screen memory\n");
+		printk (KERN_ERR "savagefb: unable to map screen memory\n");
 		return -ENOMEM;
 	} else
 		printk (KERN_INFO "savagefb: mapped framebuffer at %p, "

--===============4935394858133435==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============4935394858133435==--
