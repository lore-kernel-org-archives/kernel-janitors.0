From: Eric Sesterhenn / snakebyte <snakebyte@gmx.de>
Date: Wed, 04 Jan 2006 17:36:38 +0000
Subject: [KJ] [PATCH] Remove MODULE_PARM from riscom8.c
Message-Id: <1136396198.6672.1.camel@localhost>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============98850744124004852=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============98850744124004852==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi,

this changes MODULE_PARM usage to module_param
in the riscom8 driver.

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.15-eric/drivers/char/riscom8.c.orig	2006-01-04 18:32:31.000000000 +0100
+++ linux-2.6.15-eric/drivers/char/riscom8.c	2006-01-04 18:34:18.000000000 +0100
@@ -1757,10 +1757,10 @@ static int iobase;
 static int iobase1;
 static int iobase2;
 static int iobase3;
-MODULE_PARM(iobase, "i");
-MODULE_PARM(iobase1, "i");
-MODULE_PARM(iobase2, "i");
-MODULE_PARM(iobase3, "i");
+module_param(iobase, int, 0);
+module_param(iobase1, int, 0);
+module_param(iobase2, int, 0);
+module_param(iobase3, int, 0);
 
 MODULE_LICENSE("GPL");
 #endif /* MODULE */



--===============98850744124004852==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============98850744124004852==--
