From: James Nelson <james4765@cwazy.co.uk>
Date: Tue, 25 Jan 2005 23:09:36 +0000
Subject: [KJ] [PATCH 8/53] radeonfb: Clean up printk()'s in
Message-Id: <20050125230931.10418.8886.86889@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============33321937361970799=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============33321937361970799==

This patch adds KERN_ constants to all of the printk()'s that need them in
drivers/video/aty/radeon_pm.c

Signed-off-by: James Nelson <james4765@gmail.com>

diff -urN --exclude='*~' linux-2.6.11-rc2-mm1-original/drivers/video/aty/radeon_pm.c linux-2.6.11-rc2-mm1/drivers/video/aty/radeon_pm.c
--- linux-2.6.11-rc2-mm1-original/drivers/video/aty/radeon_pm.c	2005-01-24 17:15:49.000000000 -0500
+++ linux-2.6.11-rc2-mm1/drivers/video/aty/radeon_pm.c	2005-01-24 19:07:02.453262495 -0500
@@ -2523,7 +2523,7 @@
 	if (state != PM_SUSPEND_MEM)
 		goto done;
 	if (susdisking) {
-		printk("suspending to disk but state = %d\n", state);
+		printk(KERN_NOTICE "suspending to disk but state = %d\n", state);
 		goto done;
 	}
 
@@ -2693,10 +2693,10 @@
 	rinfo->dynclk = dynclk;
 	if (dynclk == 1) {
 		radeon_pm_enable_dynamic_mode(rinfo);
-		printk("radeonfb: Dynamic Clock Power Management enabled\n");
+		pr_info("radeonfb: Dynamic Clock Power Management enabled\n");
 	} else if (dynclk == 0) {
 		radeon_pm_disable_dynamic_mode(rinfo);
-		printk("radeonfb: Dynamic Clock Power Management disabled\n");
+		pr_info("radeonfb: Dynamic Clock Power Management disabled\n");
 	}
 
 	/* Check if we can power manage on suspend/resume. We can do

--===============33321937361970799==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============33321937361970799==--
