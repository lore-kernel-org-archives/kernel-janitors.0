From: Eric Sesterhenn / snakebyte <snakebyte@gmx.de>
Date: Tue, 10 Jan 2006 12:16:03 +0000
Subject: [KJ] [Patch] replace MODULE_PARM in tulip/uli526x.c
Message-Id: <1136895363.22634.1.camel@alice>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============66088585009733114=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============66088585009733114==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi,

this patch replaces the MODULE_PARM usage in uli526x.c
with module_param.

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.15-git5/drivers/net/tulip/uli526x.c.orig	2006-01-10 13:10:41.000000000 +0100
+++ linux-2.6.15-git5/drivers/net/tulip/uli526x.c	2006-01-10 13:11:58.000000000 +0100
@@ -1689,9 +1689,9 @@ MODULE_AUTHOR("Peer Chen, peer.chen@uli.
 MODULE_DESCRIPTION("ULi M5261/M5263 fast ethernet driver");
 MODULE_LICENSE("GPL");
 
-MODULE_PARM(debug, "i");
-MODULE_PARM(mode, "i");
-MODULE_PARM(cr6set, "i");
+module_param(debug, int, 0644);
+module_param(mode, int, 0);
+module_param(cr6set, int, 0);
 MODULE_PARM_DESC(debug, "ULi M5261/M5263 enable debugging (0-1)");
 MODULE_PARM_DESC(mode, "ULi M5261/M5263: Bit 0: 10/100Mbps, bit 2: duplex, bit 8: HomePNA");
 



--===============66088585009733114==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============66088585009733114==--
