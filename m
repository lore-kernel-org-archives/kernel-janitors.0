From: Eric Sesterhenn / snakebyte <snakebyte@gmx.de>
Date: Wed, 14 Dec 2005 20:12:36 +0000
Subject: [KJ] [Patch] check u32 < 0 in media/video/dpc7146.c
Message-Id: <1134591156.7600.1.camel@alice>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============6275328681425616=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============6275328681425616==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi,

another check < 0. i->index is u32 and since it is used
as an index for an array it should stay that way. I just
removed the check.

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>


--- linux-2.6.15-rc5-git2/drivers/media/video/dpc7146.c.orig	2005-12-14 21:09:03.000000000 +0100
+++ linux-2.6.15-rc5-git2/drivers/media/video/dpc7146.c	2005-12-14 21:09:10.000000000 +0100
@@ -266,7 +266,7 @@ static int dpc_ioctl(struct saa7146_fh *
 		struct v4l2_input *i = arg;
 		DEB_EE(("VIDIOC_ENUMINPUT %d.\n",i->index));
 		
-		if( i->index < 0 || i->index >= DPC_INPUTS) {
+		if( i->index >= DPC_INPUTS) {
 			return -EINVAL;
 		}
 		



--===============6275328681425616==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============6275328681425616==--
