From: James Nelson <james4765@cwazy.co.uk>
Date: Tue, 25 Jan 2005 23:09:25 +0000
Subject: [KJ] [PATCH 7/53] radeonfb: Clean up printk()'s in
Message-Id: <20050125230920.10418.33421.94248@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============54087525934975855=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============54087525934975855==

This patch adds KERN_ constants to all of the printk()'s that need them in
drivers/video/aty/radeon_monitor.c

Signed-off-by: James Nelson <james4765@gmail.com>

diff -urN --exclude='*~' linux-2.6.11-rc2-mm1-original/drivers/video/aty/radeon_monitor.c linux-2.6.11-rc2-mm1/drivers/video/aty/radeon_monitor.c
--- linux-2.6.11-rc2-mm1-original/drivers/video/aty/radeon_monitor.c	2005-01-24 17:15:49.000000000 -0500
+++ linux-2.6.11-rc2-mm1/drivers/video/aty/radeon_monitor.c	2005-01-24 19:07:02.368262771 -0500
@@ -178,10 +178,10 @@
 	for(i=0; i<24; i++)
 		stmp[i] = BIOS_IN8(tmp+i+1);
 	stmp[24] = 0;
-	printk("radeonfb: panel ID string: %s\n", stmp);
+	pr_info("radeonfb: panel ID string: %s\n", stmp);
 	rinfo->panel_info.xres = BIOS_IN16(tmp + 25);
 	rinfo->panel_info.yres = BIOS_IN16(tmp + 27);
-	printk("radeonfb: detected LVDS panel size from BIOS: %dx%d\n",
+	pr_info("radeonfb: detected LVDS panel size from BIOS: %dx%d\n",
 		rinfo->panel_info.xres, rinfo->panel_info.yres);
 
 	rinfo->panel_info.pwr_delay = BIOS_IN16(tmp + 44);
@@ -561,7 +561,7 @@
 		    ((rinfo->bios_seg && (INREG(BIOS_4_SCRATCH) & 4))
 		     || (INREG(LVDS_GEN_CNTL) & LVDS_ON))) {
 			rinfo->mon1_type = MT_LCD;
-			printk("Non-DDC laptop panel detected\n");
+			pr_info("Non-DDC laptop panel detected\n");
 		}
 		if (rinfo->mon1_type == MT_NONE)
 			rinfo->mon1_type = radeon_crt_is_connected(rinfo, rinfo->reversed_DAC);

--===============54087525934975855==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============54087525934975855==--
