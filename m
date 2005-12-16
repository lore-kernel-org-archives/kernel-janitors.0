From: Eric Sesterhenn / snakebyte <snakebyte@gmx.de>
Date: Fri, 16 Dec 2005 11:54:01 +0000
Subject: [KJ] [Patch] check unsigned < 0 in media/video/hexium_orion.c
Message-Id: <1134734041.8536.5.camel@alice>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============09592405721054198=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1134733947.8536.2.camel@alice>
In-Reply-To: <1134733947.8536.2.camel@alice>
To: kernel-janitors@vger.kernel.org

--===============09592405721054198==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi,

same as the hexium_gemini patch, index is unsigned and
used only as an array index, so it should be safe to
remove the check

Signed-of-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.15-rc5-git5/drivers/media/video/hexium_orion.c.orig	2005-12-16 12:45:46.000000000 +0100
+++ linux-2.6.15-rc5-git5/drivers/media/video/hexium_orion.c	2005-12-16 12:46:06.000000000 +0100
@@ -384,7 +384,7 @@ static int hexium_ioctl(struct saa7146_f
 			struct v4l2_input *i = arg;
 			DEB_EE(("VIDIOC_ENUMINPUT %d.\n", i->index));
 
-			if (i->index < 0 || i->index >= HEXIUM_INPUTS) {
+			if (i->index >= HEXIUM_INPUTS) {
 				return -EINVAL;
 			}
 



--===============09592405721054198==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============09592405721054198==--
