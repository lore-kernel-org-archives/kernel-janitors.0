From: Colin King <colin.king@canonical.com>
Date: Mon, 18 Sep 2017 09:26:03 +0000
Subject: [PATCH] ASoC: qcom: remove duplicate initializations of dma_ch and v
Message-Id: <20170918092603.27613-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Patrick Lai <plai@codeaurora.org>, Banajit Goswami <bgoswami@codeaurora.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

dma_ch is being initialized to zero and then immediately afterwards
being updated again, so the first initialization is redundant and
can be remove.

Likewise, the pointer v is being initialized twice, so remove the second
duplicate initialization.

Cleans up two clang build warnings:
warning: Value stored to 'dma_ch' is never read
warning: Value stored to 'v' during its initialization is never read

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 sound/soc/qcom/lpass-platform.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/soc/qcom/lpass-platform.c b/sound/soc/qcom/lpass-platform.c
index e1945e1772cd..caf71aab8196 100644
--- a/sound/soc/qcom/lpass-platform.c
+++ b/sound/soc/qcom/lpass-platform.c
@@ -74,7 +74,6 @@ static int lpass_platform_pcmops_open(struct snd_pcm_substream *substream)
 	data->i2s_port = cpu_dai->driver->id;
 	runtime->private_data = data;
 
-	dma_ch = 0;
 	if (v->alloc_dma_channel)
 		dma_ch = v->alloc_dma_channel(drvdata, dir);
 	else
@@ -122,7 +121,6 @@ static int lpass_platform_pcmops_close(struct snd_pcm_substream *substream)
 	struct lpass_pcm_data *data;
 
 	data = runtime->private_data;
-	v = drvdata->variant;
 	drvdata->substream[data->dma_ch] = NULL;
 	if (v->free_dma_channel)
 		v->free_dma_channel(drvdata, data->dma_ch);
-- 
2.14.1

