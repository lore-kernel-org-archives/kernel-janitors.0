From: James Nelson <james4765@cwazy.co.uk>
Date: Tue, 25 Jan 2005 23:14:09 +0000
Subject: [KJ] [PATCH 35/53] neofb: Clean up printk()'s in
Message-Id: <20050125231409.10418.30793.34486@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============031499587284425701=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============031499587284425701==

This patch adds KERN_ constants to all of the printk()'s that need them in
drivers/video/neofb.c

Signed-off-by: James Nelson <james4765@gmail.com>

diff -urN --exclude='*~' linux-2.6.11-rc2-mm1-original/drivers/video/neofb.c linux-2.6.11-rc2-mm1/drivers/video/neofb.c
--- linux-2.6.11-rc2-mm1-original/drivers/video/neofb.c	2005-01-24 17:15:49.000000000 -0500
+++ linux-2.6.11-rc2-mm1/drivers/video/neofb.c	2005-01-24 19:07:03.552258929 -0500
@@ -252,7 +252,7 @@
 	par->VCLK3Denominator = d_best;
 
 #ifdef NEOFB_DEBUG
-	printk("neoVCLK: f:%d NumLow=%d NumHi=%d Den=%d Df=%d\n",
+	printk(KERN_DEBUG "neoVCLK: f:%d NumLow=%d NumHi=%d Den=%d Df=%d\n",
 	       f_target >> 12,
 	       par->VCLK3NumeratorLow,
 	       par->VCLK3NumeratorHigh,
@@ -1696,13 +1696,13 @@
 
 	if (!request_mem_region
 	    (info->fix.mmio_start, MMIO_SIZE, "memory mapped I/O")) {
-		printk("neofb: memory mapped IO in use\n");
+		printk(KERN_ERR "neofb: memory mapped IO in use\n");
 		return -EBUSY;
 	}
 
 	par->mmio_vbase = ioremap(info->fix.mmio_start, MMIO_SIZE);
 	if (!par->mmio_vbase) {
-		printk("neofb: unable to map memory mapped IO\n");
+		printk(KERN_ERR "neofb: unable to map memory mapped IO\n");
 		release_mem_region(info->fix.mmio_start,
 				   info->fix.mmio_len);
 		return -ENOMEM;
@@ -1737,14 +1737,14 @@
 
 	if (!request_mem_region(info->fix.smem_start, info->fix.smem_len,
 				"frame buffer")) {
-		printk("neofb: frame buffer in use\n");
+		printk(KERN_WARNING "neofb: frame buffer in use\n");
 		return -EBUSY;
 	}
 
 	info->screen_base =
 	    ioremap(info->fix.smem_start, info->fix.smem_len);
 	if (!info->screen_base) {
-		printk("neofb: unable to map screen memory\n");
+		printk(KERN_ERR "neofb: unable to map screen memory\n");
 		release_mem_region(info->fix.smem_start,
 				   info->fix.smem_len);
 		return -ENOMEM;

--===============031499587284425701==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============031499587284425701==--
