From: jlamanna@gmail.com
Date: Tue, 04 Jan 2005 21:57:04 +0000
Subject: [KJ] [PATCH] [13/29] pcm_plugin.c - vfree() checking cleanups
Message-Id: <41db1130.0cc0e4ee.2568.07ba@smtp.gmail.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============8246429380952045=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============8246429380952045==
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

pcm_plugin.c vfree() checking cleanups.

Signed-off by: James Lamanna <jlamanna@gmail.com>

 pcm_plugin.c |    3 +--
 1 files changed, 1 insertion(+), 2 deletions(-)


--- linux-2.6.10-vanilla/sound/core/oss/pcm_plugin.c	2004-12-24 13:34:29.000000000 -0800
+++ linux-2.6.10/sound/core/oss/pcm_plugin.c	2005-01-04 11:25:22.987998816 -0800
@@ -219,8 +219,7 @@
 		plugin->private_free(plugin);
 	if (plugin->buf_channels)
 		kfree(plugin->buf_channels);
-	if (plugin->buf)
-		vfree(plugin->buf);
+	vfree(plugin->buf);
 	if (plugin->src_vmask)
 		kfree(plugin->src_vmask);
 	if (plugin->dst_vmask)



--===============8246429380952045==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============8246429380952045==--
