From: Eric Sesterhenn / snakebyte <snakebyte@gmx.de>
Date: Fri, 06 Jan 2006 11:20:01 +0000
Subject: [KJ] [Patch 7/9] Cleanup MODULE_PARM in meth.c
Message-Id: <1136546401.13172.30.camel@alice>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============66423243539299026=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============66423243539299026==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi,

this patch changes MODULE_PARM usage to
module_param

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.15-git2/drivers/net/meth.c.orig	2006-01-06 12:02:46.000000000 +0100
+++ linux-2.6.15-git2/drivers/net/meth.c	2006-01-06 12:03:10.000000000 +0100
@@ -62,7 +62,7 @@ MODULE_DESCRIPTION("SGI O2 Builtin Fast 
 
 #ifdef HAVE_TX_TIMEOUT
 static int timeout = TX_TIMEOUT;
-MODULE_PARM(timeout, "i");
+module_param(timeout, int, 0);
 #endif
 
 /*



--===============66423243539299026==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============66423243539299026==--
