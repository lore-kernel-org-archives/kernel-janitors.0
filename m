From: James Nelson <james4765@cwazy.co.uk>
Date: Tue, 25 Jan 2005 23:16:11 +0000
Subject: [KJ] [PATCH 53/53] tridentfb: Clean up printk()'s in
Message-Id: <20050125231610.10418.9025.34276@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============86853959691995097=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============86853959691995097==

This patch adds KERN_ constants to all of the printk()'s that need them in
include/video/trident.h

Signed-off-by: James Nelson <james4765@gmail.com>

diff -urN --exclude='*~' linux-2.6.11-rc2-mm1-original/include/video/trident.h linux-2.6.11-rc2-mm1/include/video/trident.h
--- linux-2.6.11-rc2-mm1-original/include/video/trident.h	2005-01-24 17:15:49.000000000 -0500
+++ linux-2.6.11-rc2-mm1/include/video/trident.h	2005-01-24 19:07:04.467255960 -0500
@@ -9,7 +9,7 @@
 #define debug(f,a...)
 #endif
 
-#define output(f, a...) printk("tridentfb: " f, ## a)
+#define output(f, a...) pr_info("tridentfb: " f, ## a)
 
 #define Kb	(1024)
 #define Mb	(Kb*Kb)

--===============86853959691995097==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============86853959691995097==--
