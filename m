From: jlamanna@gmail.com
Date: Tue, 04 Jan 2005 23:17:38 +0000
Subject: [KJ] [PATCH] [RESEND] [6/29] pcm_oss.c - vfree() checking cleanups
Message-Id: <auto-000001227482@appliedminds.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============95446002074649972=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============95446002074649972==

pcm_oss.c vfree() checking cleanups.

Signed-off by: James Lamanna <jlamanna@gmail.com>

 pcm_oss.c |    6 ++----
 1 files changed, 2 insertions(+), 4 deletions(-)


--- linux-2.6.10-vanilla/sound/core/oss/pcm_oss.c	2004-12-24 13:35:25.000000000 -0800
+++ linux-2.6.10/sound/core/oss/pcm_oss.c	2005-01-04 11:25:44.719695096 -0800
@@ -513,8 +513,7 @@
 
 	runtime->oss.params = 0;
 	runtime->oss.prepare = 1;
-	if (runtime->oss.buffer != NULL)
-		vfree(runtime->oss.buffer);
+	vfree(runtime->oss.buffer);
 	runtime->oss.buffer = vmalloc(runtime->oss.period_bytes);
 	runtime->oss.buffer_used = 0;
 	if (runtime->dma_area)
@@ -1671,8 +1670,7 @@
 {
 	snd_pcm_runtime_t *runtime;
 	runtime = substream->runtime;
-	if (runtime->oss.buffer)
-		vfree(runtime->oss.buffer);
+	vfree(runtime->oss.buffer);
 	snd_pcm_oss_plugin_clear(substream);
 	substream->oss.file = NULL;
 	substream->oss.oss = 0;


--===============95446002074649972==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============95446002074649972==--
