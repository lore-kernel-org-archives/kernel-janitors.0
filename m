From: Eric Sesterhenn / snakebyte <snakebyte@gmx.de>
Date: Wed, 04 Jan 2006 23:50:08 +0000
Subject: [KJ] [PATCH 3/4] Remove MODULE_PARM in media/video/saa6588.c
Message-Id: <1136418608.10387.13.camel@localhost>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============14541103524874277=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============14541103524874277==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi,

this changes MODULE_PARM usage saa6588.c to module_param

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>


--- linux-2.6.15-eric/drivers/media/video/saa6588.c.orig	2006-01-05 00:29:30.000000000 +0100
+++ linux-2.6.15-eric/drivers/media/video/saa6588.c	2006-01-05 00:30:46.000000000 +0100
@@ -50,15 +50,15 @@ static unsigned int rbds = 0;
 static unsigned int plvl = 0;
 static unsigned int bufblocks = 100;
 
-MODULE_PARM(debug, "i");
+module_param(debug, int, 0644);
 MODULE_PARM_DESC(debug, "enable debug messages");
-MODULE_PARM(xtal, "i");
+module_param(xtal, int, 0);
 MODULE_PARM_DESC(xtal, "select oscillator frequency (0..3), default 0");
-MODULE_PARM(rbds, "i");
+module_param(rbds, int, 0);
 MODULE_PARM_DESC(rbds, "select mode, 0=RDS, 1=RBDS, default 0");
-MODULE_PARM(plvl, "i");
+module_param(plvl, int, 0);
 MODULE_PARM_DESC(plvl, "select pause level (0..3), default 0");
-MODULE_PARM(bufblocks, "i");
+module_param(bufblocks, int, 0);
 MODULE_PARM_DESC(bufblocks, "number of buffered blocks, default 100");
 
 MODULE_DESCRIPTION("v4l2 driver module for SAA6588 RDS decoder");



--===============14541103524874277==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============14541103524874277==--
