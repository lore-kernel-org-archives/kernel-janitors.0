From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 18 Dec 2018 08:18:10 +0000
Subject: [PATCH] ASoC: dma-sh7760: cleanup a debug printk
Message-Id: <20181218081810.GB32567@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Liam Girdwood <lgirdwood@gmail.com>, Manuel Lauss <mano@roarinelk.homelinux.net>
Cc: alsa-devel@alsa-project.org, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, kernel-janitors@vger.kernel.org, Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>

The intent was to print the address as a hexadecimal but there is an
extra "u" in the "0x%08ulx" format specification so it is displayed as
decimal.

Fixes: aef3b06ac697 ("[ALSA] SH7760 ASoC support")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 sound/soc/sh/dma-sh7760.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sh/dma-sh7760.c b/sound/soc/sh/dma-sh7760.c
index 922fb6aa3ed1..5aee11c94f2a 100644
--- a/sound/soc/sh/dma-sh7760.c
+++ b/sound/soc/sh/dma-sh7760.c
@@ -202,7 +202,7 @@ static int camelot_prepare(struct snd_pcm_substream *substream)
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct camelot_pcm *cam = &cam_pcm_data[rtd->cpu_dai->id];
 
-	pr_debug("PCM data: addr 0x%08ulx len %d\n",
+	pr_debug("PCM data: addr 0x%08lx len %d\n",
 		 (u32)runtime->dma_addr, runtime->dma_bytes);
  
 	if (substream->stream = SNDRV_PCM_STREAM_PLAYBACK) {
-- 
2.17.1
