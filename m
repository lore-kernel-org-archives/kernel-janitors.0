From: jlamanna@gmail.com
Date: Tue, 04 Jan 2005 21:57:35 +0000
Subject: [KJ] [PATCH] [29/29] pss.c - vfree() checking cleanups
Message-Id: <41db114f.306d18f7.2568.07cb@smtp.gmail.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============6000121967078349=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============6000121967078349==
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

pss.c vfree() checking cleanups.

Signed-off by: James Lamanna <jlamanna@gmail.com>

 pss.c |    2 +-
 1 files changed, 1 insertion(+), 1 deletion(-)


--- linux-2.6.10-vanilla/sound/oss/pss.c	2004-12-24 13:35:49.000000000 -0800
+++ linux-2.6.10/sound/oss/pss.c	2005-01-04 11:22:23.135340576 -0800
@@ -1242,7 +1242,7 @@
 {
 	if(!pss_no_sound)
 	{
-		if(fw_load && pss_synth)
+		if(fw_load)
 			vfree(pss_synth);
 		if(pssmss)
 			unload_pss_mss(&cfg2);



--===============6000121967078349==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============6000121967078349==--
