From: James Nelson <james4765@cwazy.co.uk>
Date: Wed, 26 Jan 2005 01:52:24 +0000
Subject: [KJ] [PATCH 44/53][RESEND] rivafb: Clean up printk()'s in
Message-Id: <20050126015223.10762.97098.83764@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============90235936187310517=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============90235936187310517==

This patch adds KERN_ constants to all of the printk()'s that need them in
drivers/video/riva/fbdev.c - resent after reworking the debug #defines

Signed-off-by: James Nelson <james4765@gmail.com>

diff -urN --exclude='*~' linux-2.6.11-rc2-mm1-original/drivers/video/riva/fbdev.c linux-2.6.11-rc2-mm1/drivers/video/riva/fbdev.c
--- linux-2.6.11-rc2-mm1-original/drivers/video/riva/fbdev.c	2005-01-24 17:15:49.000000000 -0500
+++ linux-2.6.11-rc2-mm1/drivers/video/riva/fbdev.c	2005-01-25 20:49:29.534947199 -0500
@@ -68,18 +68,17 @@
  *
  * ------------------------------------------------------------------------- */
 #ifdef CONFIG_FB_RIVA_DEBUG
-#define NVTRACE          printk
-#else
-#define NVTRACE          if(0) printk
+#define DEBUG
 #endif
 
+#define NVTRACE          pr_debug
 #define NVTRACE_ENTER(...)  NVTRACE("%s START\n", __FUNCTION__)
 #define NVTRACE_LEAVE(...)  NVTRACE("%s END\n", __FUNCTION__)
 
 #ifdef CONFIG_FB_RIVA_DEBUG
 #define assert(expr) \
 	if(!(expr)) { \
-	printk( "Assertion failed! %s,%s,%s,line=%d\n",\
+	pr_debug( "Assertion failed! %s,%s,%s,line=%d\n",\
 	#expr,__FILE__,__FUNCTION__,__LINE__); \
 	BUG(); \
 	}
@@ -1780,7 +1779,7 @@
 	for (i = 0; i < par->bus; i++) {
 		riva_probe_i2c_connector(par, i+1, &par->EDID);
 		if (par->EDID && !fb_parse_edid(par->EDID, &var)) {
-			printk(PFX "Found EDID Block from BUS %i\n", i);
+			pr_info(PFX "Found EDID Block from BUS %i\n", i);
 			break;
 		}
 	}
@@ -1829,10 +1828,10 @@
 	NVTRACE_ENTER();
 #ifdef CONFIG_PPC_OF
 	if (!riva_get_EDID_OF(info, pdev))
-		printk(PFX "could not retrieve EDID from OF\n");
+		pr_info(PFX "could not retrieve EDID from OF\n");
 #elif CONFIG_FB_RIVA_I2C
 	if (!riva_get_EDID_i2c(info))
-		printk(PFX "could not retrieve EDID from DDC/I2C\n");
+		pr_info(PFX "could not retrieve EDID from DDC/I2C\n");
 #endif
 	NVTRACE_LEAVE();
 }

--===============90235936187310517==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============90235936187310517==--
