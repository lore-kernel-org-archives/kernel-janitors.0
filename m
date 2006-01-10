From: Eric Sesterhenn / snakebyte <snakebyte@gmx.de>
Date: Tue, 10 Jan 2006 13:04:35 +0000
Subject: [KJ] [Patch] replace MODULE_PARM in net/fs_enet/fs_enet-main.c
Message-Id: <1136898275.23005.3.camel@alice>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============23664575156457568=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============23664575156457568==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi,

this patch replaces the MODULE_PARM usage
with module_param.

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.15-git5/drivers/net/fs_enet/fs_enet-main.c.orig	2006-01-10 14:00:05.000000000 +0100
+++ linux-2.6.15-git5/drivers/net/fs_enet/fs_enet-main.c	2006-01-10 14:00:22.000000000 +0100
@@ -58,7 +58,7 @@ MODULE_DESCRIPTION("Freescale Ethernet D
 MODULE_LICENSE("GPL");
 MODULE_VERSION(DRV_MODULE_VERSION);
 
-MODULE_PARM(fs_enet_debug, "i");
+module_param(fs_enet_debug, int, 0);
 MODULE_PARM_DESC(fs_enet_debug,
 		 "Freescale bitmapped debugging message enable value");
 



--===============23664575156457568==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============23664575156457568==--
