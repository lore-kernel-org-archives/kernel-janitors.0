From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Wed, 28 Jul 2004 17:50:59 +0000
Subject: [Kernel-janitors] [PATCH] video/radeon_base: replace MS_TO_HZ()
Message-Id: <20040728175059.GH1935@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============16186741581590902=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============16186741581590902==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I would appreciate any comments from the janitors list. 

Applys-to: 2.6.7

Description: Replace MS_TO_HZ() with msecs_to_jiffies().

Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>


--- linux-vanilla/drivers/video/aty/radeon_base.c	2004-06-15 22:19:10.000000000 -0700
+++ linux-dev/drivers/video/aty/radeon_base.c	2004-07-28 10:32:25.000000000 -0700
@@ -61,6 +61,7 @@
 #include <linux/tty.h>
 #include <linux/slab.h>
 #include <linux/delay.h>
+#include <linux/time.h>
 #include <linux/fb.h>
 #include <linux/ioport.h>
 #include <linux/init.h>
@@ -1279,7 +1280,7 @@ static void radeon_write_mode (struct ra
 					OUTREG(LVDS_GEN_CNTL, mode->lvds_gen_cntl | LVDS_BLON);
 				rinfo->pending_lvds_gen_cntl = mode->lvds_gen_cntl;
 				mod_timer(&rinfo->lvds_timer,
-					  jiffies + MS_TO_HZ(rinfo->panel_info.pwr_delay));
+					  jiffies + msecs_to_jiffies(rinfo->panel_info.pwr_delay));
 			}
 		}
 	}

--===============16186741581590902==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============16186741581590902==--
