From: Eric Sesterhenn / snakebyte <snakebyte@gmx.de>
Date: Tue, 10 Jan 2006 13:06:22 +0000
Subject: [KJ] [Patch] replace MODULE_PARM innet/ne-h8300.c
Message-Id: <1136898382.23005.5.camel@alice>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============15997756587688938=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============15997756587688938==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi,

this patch replaces the MODULE_PARM usage in uli526x.c
with module_param.

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.15-git5/drivers/net/ne-h8300.c.orig	2006-01-10 13:57:25.000000000 +0100
+++ linux-2.6.15-git5/drivers/net/ne-h8300.c	2006-01-10 13:59:25.000000000 +0100
@@ -600,9 +600,9 @@ static int io[MAX_NE_CARDS];
 static int irq[MAX_NE_CARDS];
 static int bad[MAX_NE_CARDS];	/* 0xbad = bad sig or no reset ack */
 
-MODULE_PARM(io, "1-" __MODULE_STRING(MAX_NE_CARDS) "i");
-MODULE_PARM(irq, "1-" __MODULE_STRING(MAX_NE_CARDS) "i");
-MODULE_PARM(bad, "1-" __MODULE_STRING(MAX_NE_CARDS) "i");
+module_param_array(io, int, NULL, 0);
+module_param_array(irq, int, NULL, 0);
+module_param_array(bad, int, NULL, 0);
 MODULE_PARM_DESC(io, "I/O base address(es)");
 MODULE_PARM_DESC(irq, "IRQ number(s)");
 MODULE_DESCRIPTION("H8/300 NE2000 Ethernet driver");



--===============15997756587688938==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============15997756587688938==--
