From: Eric Sesterhenn / snakebyte <snakebyte@gmx.de>
Date: Fri, 06 Jan 2006 11:20:06 +0000
Subject: [KJ] [Patch 8/9] Cleanup MODULE_PARM in ni5010.c
Message-Id: <1136546406.13172.31.camel@alice>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============7034618821473364=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============7034618821473364==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi,

this patch changes MODULE_PARM usage to
module_param

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.15-git2/drivers/net/ni5010.c.orig	2006-01-06 12:07:30.000000000 +0100
+++ linux-2.6.15-git2/drivers/net/ni5010.c	2006-01-06 12:07:50.000000000 +0100
@@ -766,8 +766,8 @@ static void ni5010_show_registers(struct
 #ifdef MODULE
 static struct net_device *dev_ni5010;
 
-MODULE_PARM(io, "i");
-MODULE_PARM(irq, "i");
+module_param(io, int, 0);
+module_param(irq, int, 0);
 MODULE_PARM_DESC(io, "ni5010 I/O base address");
 MODULE_PARM_DESC(irq, "ni5010 IRQ number");
 



--===============7034618821473364==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============7034618821473364==--
