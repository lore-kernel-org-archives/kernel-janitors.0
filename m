From: James Nelson <james4765@cwazy.co.uk>
Date: Tue, 25 Jan 2005 23:15:05 +0000
Subject: [KJ] [PATCH 43/53] retz3fb: Clean up printk()'s in
Message-Id: <20050125231504.10418.29128.91070@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============75599389641065706=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============75599389641065706==

This patch adds KERN_ constants to all of the printk()'s that need them in
drivers/video/retz3fb.c

Signed-off-by: James Nelson <james4765@gmail.com>

diff -urN --exclude='*~' linux-2.6.11-rc2-mm1-original/drivers/video/retz3fb.c linux-2.6.11-rc2-mm1/drivers/video/retz3fb.c
--- linux-2.6.11-rc2-mm1-original/drivers/video/retz3fb.c	2005-01-24 17:15:49.000000000 -0500
+++ linux-2.6.11-rc2-mm1/drivers/video/retz3fb.c	2005-01-24 19:07:03.909257770 -0500
@@ -20,6 +20,8 @@
  * for more details.
  */
 
+#undef DEBUG
+
 #include <linux/module.h>
 #include <linux/kernel.h>
 #include <linux/errno.h>
@@ -44,9 +46,6 @@
 
 #include "retz3fb.h"
 
-/* #define DEBUG if(1) */
-#define DEBUG if(0)
-
 /*
  * Reserve space for one pattern line.
  *
@@ -125,6 +124,7 @@
 
 static char retz3fb_name[16] = "RetinaZ3";
 
+#define DBG(fmt, args...) pr_debug("%s %s: " fmt, retz3fb_name, __FUNCTION__ , ## args)
 
 /*
  * A small info on how to convert XFree86 timing values into fb
@@ -455,25 +455,25 @@
 
 #if 0 /* testing */
 
-	printk("HBS: %i\n", data.h_bstart);
-	printk("HSS: %i\n", data.h_sstart);
-	printk("HSE: %i\n", data.h_sstop);
-	printk("HBE: %i\n", data.h_bstop);
-	printk("HT: %i\n", data.h_total);
-
-	printk("hsync: %i\n", hsync);
-	printk("hfront: %i\n", hfront);
-	printk("hback: %i\n", hback);
-
-	printk("VBS: %i\n", data.v_bstart);
-	printk("VSS: %i\n", data.v_sstart);
-	printk("VSE: %i\n", data.v_sstop);
-	printk("VBE: %i\n", data.v_bstop);
-	printk("VT: %i\n", data.v_total);
-
-	printk("vsync: %i\n", vsync);
-	printk("vfront: %i\n", vfront);
-	printk("vback: %i\n", vback);
+	DBG("HBS: %i\n", data.h_bstart);
+	DBG("HSS: %i\n", data.h_sstart);
+	DBG("HSE: %i\n", data.h_sstop);
+	DBG("HBE: %i\n", data.h_bstop);
+	DBG("HT: %i\n", data.h_total);
+
+	DBG("hsync: %i\n", hsync);
+	DBG("hfront: %i\n", hfront);
+	DBG("hback: %i\n", hback);
+
+	DBG("VBS: %i\n", data.v_bstart);
+	DBG("VSS: %i\n", data.v_sstart);
+	DBG("VSE: %i\n", data.v_sstop);
+	DBG("VBE: %i\n", data.v_bstop);
+	DBG("VT: %i\n", data.v_total);
+
+	DBG("vsync: %i\n", vsync);
+	DBG("vfront: %i\n", vfront);
+	DBG("vback: %i\n", vback);
 #endif
 
 	if (data.v_total >= 1024)
@@ -548,28 +548,28 @@
 	crt_w(regs, CRT_END_VER_RETR, (data.v_sstop & 0x0f) | 0x20);
 
 	/* Zuerst zu schreibende Werte nur per printk ausgeben */
-	DEBUG printk("CRT_HOR_TOTAL: %ld\n", data.h_total);
+	DBG("CRT_HOR_TOTAL: %ld\n", data.h_total);
 	crt_w(regs, CRT_HOR_TOTAL, data.h_total & 0xff);
 
-	DEBUG printk("CRT_HOR_DISP_ENA_END: %ld\n", data.h_dispend);
+	DBG("CRT_HOR_DISP_ENA_END: %ld\n", data.h_dispend);
 	crt_w(regs, CRT_HOR_DISP_ENA_END, (data.h_dispend) & 0xff);
 
-	DEBUG printk("CRT_START_HOR_BLANK: %ld\n", data.h_bstart);
+	DBG("CRT_START_HOR_BLANK: %ld\n", data.h_bstart);
 	crt_w(regs, CRT_START_HOR_BLANK, data.h_bstart & 0xff);
 
-	DEBUG printk("CRT_END_HOR_BLANK: 128+%ld\n", data.h_bstop % 32);
+	DBG("CRT_END_HOR_BLANK: 128+%ld\n", data.h_bstop % 32);
 	crt_w(regs, CRT_END_HOR_BLANK,  0x80 | (data.h_bstop & 0x1f));
 
-	DEBUG printk("CRT_START_HOR_RETR: %ld\n", data.h_sstart);
+	DBG("CRT_START_HOR_RETR: %ld\n", data.h_sstart);
 	crt_w(regs, CRT_START_HOR_RETR, data.h_sstart & 0xff);
 
 	tmp = (data.h_sstop & 0x1f);
 	if (data.h_bstop & 0x20)
 		tmp |= 0x80;
-	DEBUG printk("CRT_END_HOR_RETR: %d\n", tmp);
+	DBG("CRT_END_HOR_RETR: %d\n", tmp);
 	crt_w(regs, CRT_END_HOR_RETR, tmp);
 
-	DEBUG printk("CRT_VER_TOTAL: %ld\n", data.v_total & 0xff);
+	DBG("CRT_VER_TOTAL: %ld\n", data.v_total & 0xff);
 	crt_w(regs, CRT_VER_TOTAL, (data.v_total & 0xff));
 
 	tmp = 0x10;  /* LineCompare bit #9 */
@@ -587,7 +587,7 @@
 		tmp |= 0x40;
 	if (data.v_sstart & 512)
 		tmp |= 0x80;
-	DEBUG printk("CRT_OVERFLOW: %d\n", tmp);
+	DBG("CRT_OVERFLOW: %d\n", tmp);
 	crt_w(regs, CRT_OVERFLOW, tmp);
 
 	crt_w(regs, CRT_PRESET_ROW_SCAN, 0x00); /* not CL !!! */
@@ -597,7 +597,7 @@
 		tmp |= 0x20;
 	if (var->vmode & FB_VMODE_DOUBLE)
 		tmp |= 0x80;
- 	DEBUG printk("CRT_MAX_SCAN_LINE: %d\n", tmp);
+ 	DBG("CRT_MAX_SCAN_LINE: %d\n", tmp);
 	crt_w(regs, CRT_MAX_SCAN_LINE, tmp);
 
 	crt_w(regs, CRT_CURSOR_START, 0x00);
@@ -609,30 +609,30 @@
 	crt_w(regs, CRT_CURSOR_LOC_HIGH, 0x00);
 	crt_w(regs, CRT_CURSOR_LOC_LOW, 0x00);
 
- 	DEBUG printk("CRT_START_VER_RETR: %ld\n", data.v_sstart & 0xff);
+ 	DBG("CRT_START_VER_RETR: %ld\n", data.v_sstart & 0xff);
 	crt_w(regs, CRT_START_VER_RETR, (data.v_sstart & 0xff));
 
 #if 1
 	/* 5 refresh cycles per scanline */
-	DEBUG printk("CRT_END_VER_RETR: 64+32+%ld\n", data.v_sstop % 16);
+	DBG("CRT_END_VER_RETR: 64+32+%ld\n", data.v_sstop % 16);
 	crt_w(regs, CRT_END_VER_RETR, ((data.v_sstop & 0x0f) | 0x40 | 0x20));
 #else
-	DEBUG printk("CRT_END_VER_RETR: 128+32+%ld\n", data.v_sstop % 16);
+	DBG("CRT_END_VER_RETR: 128+32+%ld\n", data.v_sstop % 16);
 	crt_w(regs, CRT_END_VER_RETR, ((data.v_sstop & 0x0f) | 128 | 32));
 #endif
-	DEBUG printk("CRT_VER_DISP_ENA_END: %ld\n", data.v_dispend & 0xff);
+	DBG("CRT_VER_DISP_ENA_END: %ld\n", data.v_dispend & 0xff);
 	crt_w(regs, CRT_VER_DISP_ENA_END, (data.v_dispend & 0xff));
 
-	DEBUG printk("CRT_START_VER_BLANK: %ld\n", data.v_bstart & 0xff);
+	DBG("CRT_START_VER_BLANK: %ld\n", data.v_bstart & 0xff);
 	crt_w(regs, CRT_START_VER_BLANK, (data.v_bstart & 0xff));
 
-	DEBUG printk("CRT_END_VER_BLANK: %ld\n", data.v_bstop & 0xff);
+	DBG("CRT_END_VER_BLANK: %ld\n", data.v_bstop & 0xff);
 	crt_w(regs, CRT_END_VER_BLANK, (data.v_bstop & 0xff));
 
-	DEBUG printk("CRT_MODE_CONTROL: 0xe3\n");
+	DBG("CRT_MODE_CONTROL: 0xe3\n");
 	crt_w(regs, CRT_MODE_CONTROL, 0xe3);
 
-	DEBUG printk("CRT_LINE_COMPARE: 0xff\n");
+	DBG("CRT_LINE_COMPARE: 0xff\n");
 	crt_w(regs, CRT_LINE_COMPARE, 0xff);
 
 	tmp = (var->xres_virtual / 8) * (bpp / 8);
@@ -651,7 +651,7 @@
 		tmp |= 0x08;
 	if (var->vmode & FB_VMODE_INTERLACED)
 		tmp |= 0x10;
- 	DEBUG printk("CRT_EXT_HOR_TIMING1: %d\n", tmp);
+ 	DBG("CRT_EXT_HOR_TIMING1: %d\n", tmp);
 	crt_w(regs, CRT_EXT_HOR_TIMING1, tmp);
 
 	tmp = 0x00;
@@ -671,7 +671,7 @@
 	tmp |= ((data.h_bstop & 0xc0) >> 2);
 	tmp |= ((data.h_sstop & 0x60) << 1);
 	crt_w(regs, CRT_EXT_HOR_TIMING2, tmp);
- 	DEBUG printk("CRT_EXT_HOR_TIMING2: %d\n", tmp);
+ 	DBG("CRT_EXT_HOR_TIMING2: %d\n", tmp);
 
 	tmp = 0x10;			/* Line compare bit 10 */
 	if (data.v_total & 0x400)
@@ -686,7 +686,7 @@
 	if (data.v_sstop & 0x10)
 		tmp |= 0x80;
 	crt_w(regs, CRT_EXT_VER_TIMING, tmp);
- 	DEBUG printk("CRT_EXT_VER_TIMING: %d\n", tmp);
+ 	DBG("CRT_EXT_VER_TIMING: %d\n", tmp);
 
 	crt_w(regs, CRT_MONITOR_POWER, 0x00);
 

--===============75599389641065706==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============75599389641065706==--
