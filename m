From: jlamanna@gmail.com
Date: Tue, 04 Jan 2005 21:57:20 +0000
Subject: [KJ] [PATCH] [21/29] gus_wave.c - vfree() checking cleanups
Message-Id: <41db1140.07bf93c4.2568.07c2@smtp.gmail.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============58056462429399569=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============58056462429399569==
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

gus_wave.c vfree() checking cleanups.

Signed-off by: James Lamanna <jlamanna@gmail.com>

 gus_wave.c |    3 +--
 1 files changed, 1 insertion(+), 2 deletions(-)


--- linux-2.6.10-vanilla/sound/oss/gus_wave.c	2004-12-24 13:35:50.000000000 -0800
+++ linux-2.6.10/sound/oss/gus_wave.c	2005-01-04 11:22:31.966997960 -0800
@@ -3126,8 +3126,7 @@
 	if (hw_config->slots[5] ! 		sound_unload_mixerdev(hw_config->slots[5]);
 	
-	if(samples)
-		vfree(samples);
+	vfree(samples);
 	samples }
 /* called in interrupt context */



--===============58056462429399569==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============58056462429399569==--
