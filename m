From: James Nelson <james4765@cwazy.co.uk>
Date: Sun, 30 Jan 2005 13:12:12 +0000
Subject: [KJ] [PATCH 25/53][RESEND] i810fb: Clean up printk()'s in
Message-Id: <20050130131212.6019.49956.67679@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============55841971859413309=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============55841971859413309==

This patch adds KERN_ constants to all of the printk()'s that need them in
drivers/video/i810/i810_accel.c - resent after adding constants to all lines of
a multi-line printk() call.

Signed-off-by: James Nelson <james4765@gmail.com>

diff -Nurp --exclude='*~' linux-2.6.11-rc2-mm2-original/drivers/video/i810/i810_accel.c linux-2.6.11-rc2-mm2/drivers/video/i810/i810_accel.c
--- linux-2.6.11-rc2-mm2-original/drivers/video/i810/i810_accel.c	2005-01-29 19:02:41.000000000 -0500
+++ linux-2.6.11-rc2-mm2/drivers/video/i810/i810_accel.c	2005-01-30 08:03:38.590805540 -0500
@@ -34,16 +34,16 @@ extern void flush_cache(void);
 /* BLT Engine Routines */
 static inline void i810_report_error(u8 __iomem *mmio)
 {
-	printk("IIR     : 0x%04x\n"
-	       "EIR     : 0x%04x\n"
-	       "PGTBL_ER: 0x%04x\n"
-	       "IPEIR   : 0x%04x\n"
-	       "IPEHR   : 0x%04x\n",
-	       i810_readw(IIR, mmio),
-	       i810_readb(EIR, mmio),
-	       i810_readl(PGTBL_ER, mmio),
-	       i810_readl(IPEIR, mmio), 
-	       i810_readl(IPEHR, mmio));
+	printk( KERN_ERR "IIR     : 0x%04x\n"
+		KERN_ERR "EIR     : 0x%04x\n"
+		KERN_ERR "PGTBL_ER: 0x%04x\n"
+		KERN_ERR "IPEIR   : 0x%04x\n"
+		KERN_ERR "IPEHR   : 0x%04x\n",
+		i810_readw(IIR, mmio),
+		i810_readb(EIR, mmio),
+		i810_readl(PGTBL_ER, mmio),
+		i810_readl(IPEIR, mmio), 
+		i810_readl(IPEHR, mmio));
 }
 
 /**
@@ -71,7 +71,7 @@ static inline int wait_for_space(struct 
 			return 0;	
 		}
 	}
-	printk("ringbuffer lockup!!!\n");
+	printk(KERN_ERR "ringbuffer lockup!!!\n");
 	i810_report_error(mmio); 
 	par->dev_flags |= LOCKUP;
 	info->pixmap.scan_align = 1;
@@ -98,8 +98,8 @@ static inline int wait_for_engine_idle(s
 	while((i810_readw(INSTDONE, mmio) & 0x7B) != 0x7B && --count); 
 	if (count) return 0;
 
-	printk("accel engine lockup!!!\n");
-	printk("INSTDONE: 0x%04x\n", i810_readl(INSTDONE, mmio));
+	printk(KERN_ERR "accel engine lockup!!!\n");
+	printk(KERN_ERR "INSTDONE: 0x%04x\n", i810_readl(INSTDONE, mmio));
 	i810_report_error(mmio); 
 	par->dev_flags |= LOCKUP;
 	info->pixmap.scan_align = 1;

--===============55841971859413309==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============55841971859413309==--
