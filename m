From: jlamanna@gmail.com
Date: Tue, 04 Jan 2005 23:17:58 +0000
Subject: [KJ] [PATCH] [RESEND] [24/29] stradis.c - vfree() checking cleanups
Message-Id: <auto-000001227508@appliedminds.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============20467485463349888=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============20467485463349888==

stradis.c vfree() checking cleanups.

Signed-off by: James Lamanna <jlamanna@gmail.com>

 stradis.c |    9 +++------
 1 files changed, 3 insertions(+), 6 deletions(-)


--- linux-2.6.10-vanilla/drivers/media/video/stradis.c	2004-12-24 13:35:28.000000000 -0800
+++ linux-2.6.10/drivers/media/video/stradis.c	2005-01-04 11:36:45.000000000 -0800
@@ -2188,12 +2188,9 @@
 		/* unmap and free memory */
 		saa->audhead = saa->audtail = saa->osdhead = 0;
 		saa->vidhead = saa->vidtail = saa->osdtail = 0;
-		if (saa->vidbuf)
-			vfree(saa->vidbuf);
-		if (saa->audbuf)
-			vfree(saa->audbuf);
-		if (saa->osdbuf)
-			vfree(saa->osdbuf);
+		vfree(saa->vidbuf);
+		vfree(saa->audbuf);
+		vfree(saa->osdbuf);
 		if (saa->dmavid2)
 			kfree((void *) saa->dmavid2);
 		saa->audbuf = saa->vidbuf = saa->osdbuf = NULL;


--===============20467485463349888==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============20467485463349888==--
