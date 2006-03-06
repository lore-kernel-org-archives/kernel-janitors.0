From: "Darren Jenkins\\" <darrenrjenkins@gmail.com>
Date: Mon, 06 Mar 2006 11:57:27 +0000
Subject: [KJ][Patch] remove request_region from matroxfb_base.c
Message-Id: <1141646248.8201.15.camel@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============29477417578767628=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============29477417578767628==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

G'day list

matroxfb_base.c calles request_region() without checking it's return
value @ 1737.
After getting advice from Petr Vandrovec it seems that this memory
region isn't actually used in matroxfb_base.c, it was just reserved to
stop vesafb and matrox being loaded on the same head. After looking at
vesafb.c is seems that this doesn't work, as vesafb doesn't check the
return value of request_region either.
So the patch below removes the request_region call because it doesn't
actually do anything anymore.

Thanks again for your explanation Petr.

Signed-off-by: Darren Jenkins <darrenrjenkins@gmail.com>

--- linux-2.6.16-rc5/drivers/video/matrox/matroxfb_base.c.orig	2006-03-06 21:36:54.000000000 +1100
+++ linux-2.6.16-rc5/drivers/video/matrox/matroxfb_base.c	2006-03-06 22:42:17.000000000 +1100
@@ -1733,8 +1733,6 @@ static int initMatrox2(WPMINFO struct bo
 	}
 #endif	/* CONFIG_MTRR */
 
-	if (!ACCESS_FBINFO(devflags.novga))
-		request_region(0x3C0, 32, "matrox");
 	matroxfb_g450_connect(PMINFO2);
 	ACCESS_FBINFO(hw_switch->reset(PMINFO2));
 



--===============29477417578767628==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============29477417578767628==--
