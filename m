From: Eric Sesterhenn / snakebyte <snakebyte@gmx.de>
Date: Fri, 06 Jan 2006 11:20:13 +0000
Subject: [KJ] [Patch 9/9] Cleanup MODULE_PARM in sun3lance.c
Message-Id: <1136546413.13172.32.camel@alice>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============25522394626087697=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============25522394626087697==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi, 

this patch changes MODULE_PARM usage to
module_param

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.15-git2/drivers/net/sun3lance.c.orig	2006-01-06 12:08:16.000000000 +0100
+++ linux-2.6.15-git2/drivers/net/sun3lance.c	2006-01-06 12:08:35.000000000 +0100
@@ -71,7 +71,7 @@ static int lance_debug = LANCE_DEBUG;
 #else
 static int lance_debug = 1;
 #endif
-MODULE_PARM(lance_debug, "i");
+module_param(lance_debug, int, 0644);
 MODULE_PARM_DESC(lance_debug, "SUN3 Lance debug level (0-3)");
 MODULE_LICENSE("GPL");
 



--===============25522394626087697==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============25522394626087697==--
