From: jlamanna@gmail.com
Date: Tue, 04 Jan 2005 21:57:22 +0000
Subject: [KJ] [PATCH] [22/29] sis_main.c - vfree() checking cleanups
Message-Id: <41db1142.75a02d44.2568.07c3@smtp.gmail.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============55109265041702638=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============55109265041702638==
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

sis_main.c vfree() checking cleanups.

Signed-off by: James Lamanna <jlamanna@gmail.com>

 sis_main.c |    2 +-
 1 files changed, 1 insertion(+), 1 deletion(-)


--- linux-2.6.10-vanilla/drivers/video/sis/sis_main.c	2004-12-24 13:35:15.000000000 -0800
+++ linux-2.6.10/drivers/video/sis/sis_main.c	2005-01-04 11:37:30.000000000 -0800
@@ -5676,7 +5676,7 @@
 	iounmap(ivideo->video_vbase);
 	iounmap(ivideo->mmio_vbase);
 	if(ivideo->bios_vbase) iounmap(ivideo->bios_vbase);
-	if(ivideo->bios_abase)    vfree(ivideo->bios_abase);
+	vfree(ivideo->bios_abase);
 
 	/* Release mem regions */
 	release_mem_region(ivideo->video_base, ivideo->video_size);



--===============55109265041702638==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============55109265041702638==--
