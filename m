From: Eric Sesterhenn / snakebyte <snakebyte@gmx.de>
Date: Fri, 16 Dec 2005 13:38:05 +0000
Subject: [KJ] [Patch] Check unsigned < 0 in media/video/mxb.c
Message-Id: <1134740285.9464.1.camel@alice>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============68062261827451698=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1134733947.8536.2.camel@alice>
In-Reply-To: <1134733947.8536.2.camel@alice>
To: kernel-janitors@vger.kernel.org

--===============68062261827451698==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi,

index is unsigned and seems to be used only as an
array index, so it should be safe to remove the
two comparisons.

Signed-of-by: Eric Sesterhenn <snakebyte@gmx.de>


--- linux-2.6.15-rc5-git2/drivers/media/video/mxb.c.orig	2005-12-16 14:34:10.000000000 +0100
+++ linux-2.6.15-rc5-git2/drivers/media/video/mxb.c	2005-12-16 14:34:37.000000000 +0100
@@ -521,7 +521,7 @@ static int mxb_ioctl(struct saa7146_fh *
 		struct v4l2_input *i = arg;
 		
 		DEB_EE(("VIDIOC_ENUMINPUT %d.\n",i->index));
-		if( i->index < 0 || i->index >= MXB_INPUTS) {
+		if( i->index >= MXB_INPUTS) {
 			return -EINVAL;
 		}
 		memcpy(i, &mxb_inputs[i->index], sizeof(struct v4l2_input));
@@ -889,7 +889,7 @@ static int mxb_ioctl(struct saa7146_fh *
 	{
 		struct v4l2_audio *a = arg;
 
-		if( a->index < 0 || a->index > MXB_INPUTS ) {
+		if( a->index > MXB_INPUTS ) {
 	 		DEB_D(("VIDIOC_G_AUDIO %d out of range.\n",a->index));
 			return -EINVAL;
 		}



--===============68062261827451698==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============68062261827451698==--
