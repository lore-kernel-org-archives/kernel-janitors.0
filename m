From: James Nelson <james4765@cwazy.co.uk>
Date: Tue, 25 Jan 2005 23:14:03 +0000
Subject: [KJ] [PATCH 34/53] fb: Clean up printk()'s in drivers/video/modedb.c
Message-Id: <20050125231403.10418.64032.48604@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============34616455891941067=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============34616455891941067==

This patch adds KERN_ constants to all of the printk()'s that need them in
drivers/video/modedb.c

Signed-off-by: James Nelson <james4765@gmail.com>

diff -urN --exclude='*~' linux-2.6.11-rc2-mm1-original/drivers/video/modedb.c linux-2.6.11-rc2-mm1/drivers/video/modedb.c
--- linux-2.6.11-rc2-mm1-original/drivers/video/modedb.c	2005-01-24 17:15:49.000000000 -0500
+++ linux-2.6.11-rc2-mm1/drivers/video/modedb.c	2005-01-24 19:07:03.551258932 -0500
@@ -24,7 +24,7 @@
     ((v).xres == (x) && (v).yres == (y))
 
 #ifdef DEBUG
-#define DPRINTK(fmt, args...)	printk("modedb %s: " fmt, __FUNCTION__ , ## args)
+#define DPRINTK(fmt, args...)	pr_debug("modedb %s: " fmt, __FUNCTION__ , ## args)
 #else
 #define DPRINTK(fmt, args...)
 #endif

--===============34616455891941067==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============34616455891941067==--
