From: Stefan Sperling <stefan@binarchy.net>
Date: Tue, 09 Nov 2004 21:40:42 +0000
Subject: [KJ] [PATCH] convert wavelan_cs wireless driver to module_param
Message-Id: <20041109214042.GJ9496@dice.seeling33.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============63906477492432834=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============63906477492432834==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


Replaces MODULE_PARM with module_param calls in wavelan_cs wireless driver.

--- drivers/net/wireless/wavelan.p.h.orig	2004-11-09 20:40:22.130902904 +0100
+++ drivers/net/wireless/wavelan.p.h	2004-11-08 23:13:21.000000000 +0100
@@ -704,12 +704,12 @@ static unsigned short	iobase[]	=
 static int	io[4];
 static int	irq[4];
 static char	name[4][IFNAMSIZ];
-MODULE_PARM(io, "1-4i");
-MODULE_PARM(irq, "1-4i");
-MODULE_PARM(name, "1-4c" __MODULE_STRING(IFNAMSIZ));
+module_param_array(io, int, NULL, 0444);
+module_param_array(irq, int, NULL, 0444);
+module_param_array(name, charp, NULL, 0444);
 MODULE_PARM_DESC(io, "WaveLAN I/O base address(es),required");
 MODULE_PARM_DESC(irq, "WaveLAN IRQ number(s)");
-MODULE_PARM_DESC(name, "WaveLAN interface neme(s)");
+MODULE_PARM_DESC(name, "WaveLAN interface name(s)");
 #endif	/* MODULE */
 
 #endif	/* WAVELAN_P_H */
--- drivers/net/wireless/wavelan_cs.p.h.orig	2004-11-09 20:40:22.123903968 +0100
+++ drivers/net/wireless/wavelan_cs.p.h	2004-11-08 23:11:02.000000000 +0100
@@ -803,14 +803,14 @@ static int 	irq_list[4] = { -1 };
 static int	mem_speed = 0;
 
 /* New module interface */
-MODULE_PARM(irq_mask, "i");
-MODULE_PARM(irq_list, "1-4i");
-MODULE_PARM(mem_speed, "i");
+module_param(irq_mask, int, 0444);
+module_param_array(irq_list, int, NULL, 0444);
+module_param(mem_speed, int, 0444);
 
 #ifdef WAVELAN_ROAMING		/* Conditional compile, see above in options */
 /* Enable roaming mode ? No ! Please keep this to 0 */
 static int	do_roaming = 0;
-MODULE_PARM(do_roaming, "i");
+module_param(do_roaming, bool, 0444);
 #endif	/* WAVELAN_ROAMING */
 
 MODULE_LICENSE("GPL");

--===============63906477492432834==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============63906477492432834==--
