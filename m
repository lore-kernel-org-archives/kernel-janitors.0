From: Eric Sesterhenn / snakebyte <snakebyte@gmx.de>
Date: Sun, 08 Jan 2006 23:33:21 +0000
Subject: [KJ] [PATCH] fix MODULE_PARAM in video/stifb.c
Message-Id: <1136763201.7325.1.camel@alice>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============27661060804573578=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============27661060804573578==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi,

this patch changes MODULE_PARM usage to
module_param

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.15-eric/drivers/video/stifb.c.orig	2006-01-09 00:29:53.000000000 +0100
+++ linux-2.6.15-eric/drivers/video/stifb.c	2006-01-09 00:30:16.000000000 +0100
@@ -1489,6 +1489,6 @@ MODULE_AUTHOR("Helge Deller <deller@gmx.
 MODULE_DESCRIPTION("Framebuffer driver for HP's NGLE series graphics cards in HP PARISC machines");
 MODULE_LICENSE("GPL v2");
 
-MODULE_PARM(bpp, "i");
+module_param(bpp, int, 0);
 MODULE_PARM_DESC(mem, "Bits per pixel (default: 8)");
 



--===============27661060804573578==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============27661060804573578==--
