From: Eric Sesterhenn / snakebyte <snakebyte@gmx.de>
Date: Fri, 06 Jan 2006 11:19:25 +0000
Subject: [KJ] [Patch 2/9] Cleanup MODULE_PARM in atarilance.c
Message-Id: <1136546366.13172.21.camel@alice>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============15525232280694912=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============15525232280694912==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi,

this patch changes MODULE_PARM usage to
module_param

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.15-git2/drivers/net/atarilance.c.orig	2006-01-06 12:08:51.000000000 +0100
+++ linux-2.6.15-git2/drivers/net/atarilance.c	2006-01-06 12:09:04.000000000 +0100
@@ -78,7 +78,7 @@ static int lance_debug = LANCE_DEBUG;
 #else
 static int lance_debug = 1;
 #endif
-MODULE_PARM(lance_debug, "i");
+module_param(lance_debug, int, 0644);
 MODULE_PARM_DESC(lance_debug, "atarilance debug level (0-3)");
 MODULE_LICENSE("GPL");
 



--===============15525232280694912==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============15525232280694912==--
