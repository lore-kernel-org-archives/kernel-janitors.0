From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 17 Nov 2016 11:00:46 +0000
Subject: [patch] ASoC: sh: dma-sh7760: fix a debug printf
Message-Id: <20161117110046.GC32143@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Liam Girdwood <lgirdwood@gmail.com>, Manuel Lauss <mano@roarinelk.homelinux.net>
Cc: Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org

We intended to print a hex here, but the code will print a base 10 with
an x on the end.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/sound/soc/sh/dma-sh7760.c b/sound/soc/sh/dma-sh7760.c
index 8fad444..c28ee1a 100644
--- a/sound/soc/sh/dma-sh7760.c
+++ b/sound/soc/sh/dma-sh7760.c
@@ -204,7 +204,7 @@ static int camelot_prepare(struct snd_pcm_substream *substream)
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct camelot_pcm *cam = &cam_pcm_data[rtd->cpu_dai->id];
 
-	pr_debug("PCM data: addr 0x%08ulx len %d\n",
+	pr_debug("PCM data: addr 0x%08lx len %d\n",
 		 (u32)runtime->dma_addr, runtime->dma_bytes);
  
 	if (substream->stream = SNDRV_PCM_STREAM_PLAYBACK) {
