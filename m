From: Stefan Sperling <stefan@binarchy.net>
Date: Tue, 09 Nov 2004 23:36:59 +0000
Subject: [KJ] [PATCH] convert wavelan.p.h to module_param
Message-Id: <20041109233659.GA12555@dice.seeling33.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============56825076489615878=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============56825076489615878==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline



Replaces MODULE_PARM with module_param calls in wavelan.p.h.

--- drivers/net/wireless/wavelan.p.h.orig	2004-11-09 20:40:22.130902904 +0100
+++ drivers/net/wireless/wavelan.p.h	2004-11-10 00:03:39.024693208 +0100
@@ -704,12 +704,12 @@ static unsigned short	iobase[]	=
 static int	io[4];
 static int	irq[4];
 static char	name[4][IFNAMSIZ];
-MODULE_PARM(io, "1-4i");
-MODULE_PARM(irq, "1-4i");
-MODULE_PARM(name, "1-4c" __MODULE_STRING(IFNAMSIZ));
+module_param_array(io, int, NULL, 0);
+module_param_array(irq, int, NULL, 0);
+module_param_array(name, charp, NULL, 0);
 MODULE_PARM_DESC(io, "WaveLAN I/O base address(es),required");
 MODULE_PARM_DESC(irq, "WaveLAN IRQ number(s)");
-MODULE_PARM_DESC(name, "WaveLAN interface neme(s)");
+MODULE_PARM_DESC(name, "WaveLAN interface name(s)");
 #endif	/* MODULE */
 
 #endif	/* WAVELAN_P_H */


--===============56825076489615878==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============56825076489615878==--
