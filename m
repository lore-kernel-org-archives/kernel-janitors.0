From: Eric Sesterhenn / snakebyte <snakebyte@gmx.de>
Date: Wed, 04 Jan 2006 19:14:51 +0000
Subject: [KJ] [PATCH] remove MODULE_PARM from mtd/maps/pcmciamtd.c
Message-Id: <1136402091.7600.1.camel@localhost>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============34465685991018713=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============34465685991018713==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi,

this patch removes MODULE_PARM usage from pcmciamtd.c

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>


--- linux-2.6.15-eric/drivers/mtd/maps/pcmciamtd.c.orig	2006-01-04 20:08:18.000000000 +0100
+++ linux-2.6.15-eric/drivers/mtd/maps/pcmciamtd.c	2006-01-04 20:12:26.000000000 +0100
@@ -28,7 +28,7 @@
 
 #ifdef CONFIG_MTD_DEBUG
 static int debug = CONFIG_MTD_DEBUG_VERBOSE;
-MODULE_PARM(debug, "i");
+module_param(debug, int, 0644);
 MODULE_PARM_DESC(debug, "Set Debug Level 0=quiet, 5=noisy");
 #undef DEBUG
 #define DEBUG(n, format, arg...) \
@@ -92,17 +92,17 @@ static int mem_type;
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Simon Evans <spse@secret.org.uk>");
 MODULE_DESCRIPTION(DRIVER_DESC);
-MODULE_PARM(bankwidth, "i");
+module_param(bankwidth, int, 0);
 MODULE_PARM_DESC(bankwidth, "Set bankwidth (1=8 bit, 2=16 bit, default=2)");
-MODULE_PARM(mem_speed, "i");
+module_param(mem_speed, int, 0);
 MODULE_PARM_DESC(mem_speed, "Set memory access speed in ns");
-MODULE_PARM(force_size, "i");
+module_param(force_size, int, 0);
 MODULE_PARM_DESC(force_size, "Force size of card in MiB (1-64)");
-MODULE_PARM(setvpp, "i");
+module_param(setvpp, int, 0);
 MODULE_PARM_DESC(setvpp, "Set Vpp (0=Never, 1=On writes, 2=Always on, default=0)");
-MODULE_PARM(vpp, "i");
+module_param(vpp, int, 0);
 MODULE_PARM_DESC(vpp, "Vpp value in 1/10ths eg 33=3.3V 120=12V (Dangerous)");
-MODULE_PARM(mem_type, "i");
+module_param(mem_type, int, 0);
 MODULE_PARM_DESC(mem_type, "Set Memory type (0=Flash, 1=RAM, 2=ROM, default=0)");
 
 



--===============34465685991018713==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============34465685991018713==--
