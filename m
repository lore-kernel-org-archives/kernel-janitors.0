From: jlamanna@gmail.com
Date: Tue, 04 Jan 2005 21:56:49 +0000
Subject: [KJ] [PATCH] [6/29] pcm_oss.c - vfree() checking cleanups
Message-Id: <41db1121.6b302b00.2568.07b3@smtp.gmail.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============98872669716617834=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============98872669716617834==
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

pcm_oss.c vfree() checking cleanups.

Signed-off by: James Lamanna <jlamanna@gmail.com>

 pcm_oss.c |    6 ++----
 1 files changed, 2 insertions(+), 4 deletions(-)


--- linux-2.6.10-vanilla/sound/core/oss/pcm_oss.c	2004-12-24 13:35:25.000000000 -0800
+++ linux-2.6.10/sound/core/oss/pcm_oss.c	2005-01-04 11:25:44.719695096 -0800
@@ -513,8 +513,7 @@
 
 	runtime->oss.params  	runtime->oss.prepare -	if (runtime->oss.buffer !-		vfree(runtime->oss.buffer);
+	vfree(runtime->oss.buffer);
 	runtime->oss.buffer  	runtime->oss.buffer_used  	if (runtime->dma_area)
@@ -1671,8 +1670,7 @@
 {
 	snd_pcm_runtime_t *runtime;
 	runtime -	if (runtime->oss.buffer)
-		vfree(runtime->oss.buffer);
+	vfree(runtime->oss.buffer);
 	snd_pcm_oss_plugin_clear(substream);
 	substream->oss.file  	substream->oss.oss 


--===============98872669716617834==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============98872669716617834==--
