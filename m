From: Eric Sesterhenn / snakebyte <snakebyte@gmx.de>
Date: Fri, 16 Dec 2005 01:16:45 +0000
Subject: [KJ] [Patch] check unsigned < 0 in ieee1394/dv1394.c
Message-Id: <1134695805.15834.1.camel@alice>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============12508474367676525=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============12508474367676525==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi,

since channel is always used unsigned, i removed the 
check for < 0.

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.15-rc5-git5/drivers/ieee1394/dv1394.c.orig	2005-12-16 02:13:51.000000000 +0100
+++ linux-2.6.15-rc5-git5/drivers/ieee1394/dv1394.c	2005-12-16 02:14:28.000000000 +0100
@@ -929,7 +929,7 @@ static int do_dv1394_init(struct video_c
 		/* default SYT offset is 3 cycles */
 		init->syt_offset = 3;
 
-	if ( (init->channel > 63) || (init->channel < 0) )
+	if (init->channel > 63)
 		init->channel = 63;
 
 	chan_mask = (u64)1 << init->channel;



--===============12508474367676525==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============12508474367676525==--
