From: James Nelson <james4765@cwazy.co.uk>
Date: Sun, 30 Jan 2005 13:25:35 +0000
Subject: [KJ] [PATCH 44/53][RESEND 2] rivafb: Clean up printk()'s in
Message-Id: <20050130132532.6054.37868.50984@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============75456356290654325=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============75456356290654325==

This patch adds KERN_ constants to all of the printk()'s that need them in
drivers/video/riva/fbdev.c - resent after reworking and moving the debug #defines

Signed-off-by: James Nelson <james4765@gmail.com>

diff -Nurp --exclude='*~' linux-2.6.11-rc2-mm2-original/drivers/video/riva/fbdev.c linux-2.6.11-rc2-mm2/drivers/video/riva/fbdev.c
--- linux-2.6.11-rc2-mm2-original/drivers/video/riva/fbdev.c	2005-01-29 19:02:41.000000000 -0500
+++ linux-2.6.11-rc2-mm2/drivers/video/riva/fbdev.c	2005-01-30 08:20:09.000000000 -0500
@@ -29,6 +29,10 @@
  *	doublescan modes are broken
  */
 
+#ifdef CONFIG_FB_RIVA_DEBUG
+#  define DEBUG
+#endif /* CONFIG_FB_RIVA_DEBUG */
+
 #include <linux/config.h>
 #include <linux/module.h>
 #include <linux/kernel.h>
@@ -67,19 +71,17 @@
  * various helpful macros and constants
  *
  * ------------------------------------------------------------------------- */
-#ifdef CONFIG_FB_RIVA_DEBUG
-#define NVTRACE          printk
-#else
-#define NVTRACE          if(0) printk
-#endif
 
+#define PFX "rivafb: "
+
+#define NVTRACE(fmt, args...) pr_debug(PFX fmt, ##args)
 #define NVTRACE_ENTER(...)  NVTRACE("%s START\n", __FUNCTION__)
 #define NVTRACE_LEAVE(...)  NVTRACE("%s END\n", __FUNCTION__)
 
 #ifdef CONFIG_FB_RIVA_DEBUG
 #define assert(expr) \
 	if(!(expr)) { \
-	printk( "Assertion failed! %s,%s,%s,line=%d\n",\
+	pr_debug(PFX "Assertion failed! %s,%s,%s,line=%d\n",\
 	#expr,__FILE__,__FUNCTION__,__LINE__); \
 	BUG(); \
 	}
@@ -87,8 +89,6 @@
 #define assert(expr)
 #endif
 
-#define PFX "rivafb: "
-
 /* macro that allows you to set overflow bits */
 #define SetBitField(value,from,to) SetBF(to,GetBF(value,from))
 #define SetBit(n)		(1<<(n))
@@ -1780,7 +1780,7 @@ static int __devinit riva_get_EDID_i2c(s
 	for (i = 0; i < par->bus; i++) {
 		riva_probe_i2c_connector(par, i+1, &par->EDID);
 		if (par->EDID && !fb_parse_edid(par->EDID, &var)) {
-			printk(PFX "Found EDID Block from BUS %i\n", i);
+			pr_info(PFX "Found EDID Block from BUS %i\n", i);
 			break;
 		}
 	}
@@ -1829,10 +1829,10 @@ static void __devinit riva_get_EDID(stru
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

--===============75456356290654325==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============75456356290654325==--
