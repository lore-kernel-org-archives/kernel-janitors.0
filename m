From: James Nelson <james4765@cwazy.co.uk>
Date: Tue, 25 Jan 2005 23:12:29 +0000
Subject: [KJ] [PATCH 25/53] i810fb: Clean up printk()'s in
Message-Id: <20050125231222.10418.23312.44591@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============0018195717593787464=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============0018195717593787464==

This patch adds KERN_ constants to all of the printk()'s that need them in
drivers/video/i810/i810_accel.c

Signed-off-by: James Nelson <james4765@gmail.com>

diff -urN --exclude='*~' linux-2.6.11-rc2-mm1-original/drivers/video/i810/i810_accel.c linux-2.6.11-rc2-mm1/drivers/video/i810/i810_accel.c
--- linux-2.6.11-rc2-mm1-original/drivers/video/i810/i810_accel.c	2005-01-24 17:15:49.000000000 -0500
+++ linux-2.6.11-rc2-mm1/drivers/video/i810/i810_accel.c	2005-01-24 19:07:03.198260078 -0500
@@ -34,7 +34,8 @@
 /* BLT Engine Routines */
 static inline void i810_report_error(u8 __iomem *mmio)
 {
-	printk("IIR     : 0x%04x\n"
+	printk(KERN_ERR
+	       "IIR     : 0x%04x\n"
 	       "EIR     : 0x%04x\n"
 	       "PGTBL_ER: 0x%04x\n"
 	       "IPEIR   : 0x%04x\n"
@@ -71,7 +72,7 @@
 			return 0;	
 		}
 	}
-	printk("ringbuffer lockup!!!\n");
+	printk(KERN_ERR "ringbuffer lockup!!!\n");
 	i810_report_error(mmio); 
 	par->dev_flags |= LOCKUP;
 	info->pixmap.scan_align = 1;
@@ -98,8 +99,8 @@
 	while((i810_readw(INSTDONE, mmio) & 0x7B) != 0x7B && --count); 
 	if (count) return 0;
 
-	printk("accel engine lockup!!!\n");
-	printk("INSTDONE: 0x%04x\n", i810_readl(INSTDONE, mmio));
+	printk(KERN_ERR "accel engine lockup!!!\n");
+	printk(KERN_ERR "INSTDONE: 0x%04x\n", i810_readl(INSTDONE, mmio));
 	i810_report_error(mmio); 
 	par->dev_flags |= LOCKUP;
 	info->pixmap.scan_align = 1;

--===============0018195717593787464==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============0018195717593787464==--
