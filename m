From: Eric Sesterhenn / snakebyte <snakebyte@gmx.de>
Date: Fri, 16 Dec 2005 11:52:26 +0000
Subject: [KJ] [Patch] Check unsigned < 0 in media/video/hexium_gemini.c
Message-Id: <1134733947.8536.2.camel@alice>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============54197028404802561=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============54197028404802561==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi,

this fixes another icc warning. index is unsigned and only
used as an array index, so it should be safe to remove
the comparison.

Signed-of-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.15-rc5-git5/drivers/media/video/hexium_gemini.c.orig	2005-12-16 12:44:37.000000000 +0100
+++ linux-2.6.15-rc5-git5/drivers/media/video/hexium_gemini.c	2005-12-16 12:44:57.000000000 +0100
@@ -320,7 +320,7 @@ static int hexium_ioctl(struct saa7146_f
 			struct v4l2_input *i = arg;
 			DEB_EE(("VIDIOC_ENUMINPUT %d.\n", i->index));
 
-			if (i->index < 0 || i->index >= HEXIUM_INPUTS) {
+			if (i->index >= HEXIUM_INPUTS) {
 				return -EINVAL;
 			}
 



--===============54197028404802561==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============54197028404802561==--
