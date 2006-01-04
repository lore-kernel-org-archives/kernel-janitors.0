From: Eric Sesterhenn / snakebyte <snakebyte@gmx.de>
Date: Wed, 04 Jan 2006 23:49:56 +0000
Subject: [KJ] [PATCH 1/4] Remove MODULE_PARM in media/video/arv.c
Message-Id: <1136418597.10387.11.camel@localhost>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============33488345609273235=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============33488345609273235==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi,

this changes MODULE_PARM usage in arv.c to module_param

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.15-eric/drivers/media/video/arv.c.orig	2006-01-05 00:26:40.000000000 +0100
+++ linux-2.6.15-eric/drivers/media/video/arv.c	2006-01-05 00:27:45.000000000 +0100
@@ -129,9 +129,9 @@ static unsigned char	yuv[MAX_AR_FRAME_BY
 static int freq = DEFAULT_FREQ;	/* BCLK: available 50 or 70 (MHz) */
 static int vga = 0;		/* default mode(0:QVGA mode, other:VGA mode) */
 static int vga_interlace = 0;	/* 0 is normal mode for, else interlace mode */
-MODULE_PARM(freq, "i");
-MODULE_PARM(vga, "i");
-MODULE_PARM(vga_interlace, "i");
+module_param(freq, int, 0);
+module_param(vga, int, 0);
+module_param(vga_interlace, int, 0);
 
 static int ar_initialize(struct video_device *dev);
 



--===============33488345609273235==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============33488345609273235==--
