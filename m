From: jlamanna@gmail.com
Date: Tue, 04 Jan 2005 23:17:56 +0000
Subject: [KJ] [PATCH] [RESEND] [22/29] sis_main.c - vfree() checking cleanups
Message-Id: <auto-000001227506@appliedminds.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============57308004058895889=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============57308004058895889==

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


--===============57308004058895889==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============57308004058895889==--
