From: Stefan Sperling <stefan@binarchy.net>
Date: Tue, 09 Nov 2004 21:33:52 +0000
Subject: [KJ] [PATCH] convert netwave_cs wireless driver to module_param
Message-Id: <20041109213352.GE9496@dice.seeling33.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org


Replaces MODULE_PARM with module_param calls in netwave_cs wireless driver.

--- drivers/net/wireless/netwave_cs.c.orig	2004-11-09 20:40:22.004922056 +0=
100
+++ drivers/net/wireless/netwave_cs.c	2004-11-08 23:08:32.000000000 +0100
@@ -161,7 +161,7 @@ static const unsigned int txConfLoop   =20
 #ifdef PCMCIA_DEBUG
 static int pc_debug =3D PCMCIA_DEBUG;
-MODULE_PARM(pc_debug, "i");
+module_param(pc_debug, int, 0644);
 #define DEBUG(n, args...) if (pc_debug>(n)) printk(KERN_DEBUG args)
 static char *version  "netwave_cs.c 0.3.0 Thu Jul 17 14:36:02 1997 (John M=
arkus Bj=F8rndalen)\n";
@@ -195,11 +195,11 @@ static int mem_speed;
 static u_int irq_mask =3D 0xdeb8;
 static int irq_list[4] =3D { -1 };
=20
-MODULE_PARM(domain, "i");
-MODULE_PARM(scramble_key, "i");
-MODULE_PARM(mem_speed, "i");
-MODULE_PARM(irq_mask, "i");
-MODULE_PARM(irq_list, "1-4i");
+module_param(domain, uint, 0644);
+module_param(scramble_key, uint, 0644);
+module_param(mem_speed, int, 0444);
+module_param(irq_mask, uint, 0444);
+module_param_array(irq_list, int, NULL, 0444);
=20
 /*=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D*/
=20
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
