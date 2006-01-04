From: Eric Sesterhenn / snakebyte <snakebyte@gmx.de>
Date: Wed, 04 Jan 2006 23:50:02 +0000
Subject: [KJ] [PATCH 2/4] Remove MODULE_PARM in media/video/planb.c
Message-Id: <1136418602.10387.12.camel@localhost>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============67168422344342815=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============67168422344342815==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi,

this changes MODULE_PARM usage in planb.c to module_param

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.15-eric/drivers/media/video/planb.c.orig	2006-01-05 00:31:18.000000000 +0100
+++ linux-2.6.15-eric/drivers/media/video/planb.c	2006-01-05 00:32:20.000000000 +0100
@@ -76,9 +76,9 @@ static volatile struct planb_registers *
 static int def_norm = PLANB_DEF_NORM;	/* default norm */
 static int video_nr = -1;
 
-MODULE_PARM(def_norm, "i");
+module_param(def_norm, int, 0);
 MODULE_PARM_DESC(def_norm, "Default startup norm (0=PAL, 1=NTSC, 2=SECAM)");
-MODULE_PARM(video_nr,"i");
+module_param(video_nr, int, 0);
 MODULE_LICENSE("GPL");
 
 



--===============67168422344342815==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============67168422344342815==--
