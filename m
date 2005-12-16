From: Eric Sesterhenn / snakebyte <snakebyte@gmx.de>
Date: Fri, 16 Dec 2005 12:15:04 +0000
Subject: [KJ] check unsigned < 0 in media/video/msp3400.c
Message-Id: <1134735304.8780.1.camel@alice>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============30995887337338646=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============30995887337338646==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi,

yet another patch, index is unsigned and used as
an array index, so it should be safe to remove
the comparison.

Signed-of-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.15-rc5-git5/drivers/media/video/msp3400.c.orig	2005-12-16 12:49:17.000000000 +0100
+++ linux-2.6.15-rc5-git5/drivers/media/video/msp3400.c	2005-12-16 12:49:23.000000000 +0100
@@ -2164,7 +2164,7 @@ static int msp_command(struct i2c_client
 	{
 		struct v4l2_audioout *a=(struct v4l2_audioout *)arg;
 
-		if (a->index<0||a->index>2)
+		if (a->index>2)
 			return -EINVAL;
 
 		if (a->index==2) {



--===============30995887337338646==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============30995887337338646==--
