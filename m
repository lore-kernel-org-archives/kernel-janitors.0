From: ville palo <ville.palo@vi64pa.net>
Date: Sun, 03 Sep 2006 07:55:44 +0000
Subject: [KJ] [PATCH] oss/pcm_oss.c: Return value check for vmalloc()
Message-Id: <1157270475.7470.8.camel@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


Add return value check for vmalloc()

Signed-off-by: Ville Palo <ville.palo@vi64pa.net>

diff --git a/sound/core/oss/pcm_oss.c b/sound/core/oss/pcm_oss.c
index 472fce0..e9db261 100644
--- a/sound/core/oss/pcm_oss.c
+++ b/sound/core/oss/pcm_oss.c
@@ -1009,6 +1009,10 @@ static int snd_pcm_oss_change_params(str
 	runtime->oss.prepare = 1;
 	vfree(runtime->oss.buffer);
 	runtime->oss.buffer = vmalloc(runtime->oss.period_bytes);
+	if (!runtime->oss.buffer) {
+		err = -ENOMEM;
+		goto failure;
+	}	
 	runtime->oss.buffer_used = 0;
 	if (runtime->dma_area)
 		snd_pcm_format_set_silence(runtime->format, runtime->dma_area, bytes_to_samples(runtime, runtime->dma_bytes));


_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
