From: Eric Sesterhenn / snakebyte <snakebyte@gmx.de>
Date: Wed, 04 Jan 2006 23:50:14 +0000
Subject: [KJ] [PATCH 3/4] Remove MODULE_PARM in media/video/saa711x.c
Message-Id: <1136418614.10387.16.camel@localhost>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============77409782064568078=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1136418608.10387.13.camel@localhost>
In-Reply-To: <1136418608.10387.13.camel@localhost>
To: kernel-janitors@vger.kernel.org

--===============77409782064568078==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi,

this changes MODULE_PARM usage saa711x.c to module_param

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.15-eric/drivers/media/video/saa711x.c.orig	2006-01-05 00:28:21.000000000 +0100
+++ linux-2.6.15-eric/drivers/media/video/saa711x.c	2006-01-05 00:29:01.000000000 +0100
@@ -52,7 +52,7 @@ MODULE_LICENSE("GPL");
 #include <linux/video_decoder.h>
 
 static int debug = 0;
-MODULE_PARM(debug, "i");
+module_param(debug, int, 0644);
 MODULE_PARM_DESC(debug, " Set the default Debug level.  Default: 0 (Off) - (0-1)");
 
 



--===============77409782064568078==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============77409782064568078==--
