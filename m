From: jlamanna@gmail.com
Date: Tue, 04 Jan 2005 23:17:54 +0000
Subject: [KJ] [PATCH] [RESEND] [21/29] gus_wave.c - vfree() checking cleanups
Message-Id: <auto-000001227503@appliedminds.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============13280719117043738=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============13280719117043738==

gus_wave.c vfree() checking cleanups.

Signed-off by: James Lamanna <jlamanna@gmail.com>

 gus_wave.c |    3 +--
 1 files changed, 1 insertion(+), 2 deletions(-)


--- linux-2.6.10-vanilla/sound/oss/gus_wave.c	2004-12-24 13:35:50.000000000 -0800
+++ linux-2.6.10/sound/oss/gus_wave.c	2005-01-04 11:22:31.966997960 -0800
@@ -3126,8 +3126,7 @@
 	if (hw_config->slots[5] != -1)
 		sound_unload_mixerdev(hw_config->slots[5]);
 	
-	if(samples)
-		vfree(samples);
+	vfree(samples);
 	samples=NULL;
 }
 /* called in interrupt context */


--===============13280719117043738==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============13280719117043738==--
