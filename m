From: James Nelson <james4765@cwazy.co.uk>
Date: Wed, 26 Jan 2005 01:45:09 +0000
Subject: [KJ] [PATCH 34/53][RESEND] fb: Clean up printk()'s in
Message-Id: <20050126014508.10751.53372.67692@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============40171392087418845=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============40171392087418845==

This patch adds KERN_ constants to all of the printk()'s that need them in
drivers/video/modedb.c - resent after removing the whole #ifdef block

Signed-off-by: James Nelson <james4765@gmail.com>

diff -urN --exclude='*~' linux-2.6.11-rc2-mm1-original/drivers/video/modedb.c linux-2.6.11-rc2-mm1/drivers/video/modedb.c
--- linux-2.6.11-rc2-mm1-original/drivers/video/modedb.c	2005-01-24 17:15:49.000000000 -0500
+++ linux-2.6.11-rc2-mm1/drivers/video/modedb.c	2005-01-25 20:39:49.296864559 -0500
@@ -23,11 +23,7 @@
 #define res_matches(v, x, y) \
     ((v).xres == (x) && (v).yres == (y))
 
-#ifdef DEBUG
-#define DPRINTK(fmt, args...)	printk("modedb %s: " fmt, __FUNCTION__ , ## args)
-#else
-#define DPRINTK(fmt, args...)
-#endif
+#define DPRINTK(fmt, args...)	pr_debug("modedb %s: " fmt, __FUNCTION__ , ## args)
 
 const char *global_mode_option;
 

--===============40171392087418845==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============40171392087418845==--
