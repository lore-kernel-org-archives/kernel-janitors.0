From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 10 Jan 2013 08:59:57 +0000
Subject: [patch] ASoC: pcm: delete some dead code
Message-Id: <20130110085957.GC23063@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Liam Girdwood <lrg@ti.com>
Cc: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org, Mark Brown <broonie@opensource.wolfsonmicro.com>, kernel-janitors@vger.kernel.org

I've removed several unreachable returns.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index cf191e6..1d6af4d 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -1729,20 +1729,16 @@ static int dpcm_run_update_startup(struct snd_soc_pcm_runtime *fe, int stream)
 
 	/* startup must always be called for new BEs */
 	ret = dpcm_be_dai_startup(fe, stream);
-	if (ret < 0) {
+	if (ret < 0)
 		goto disconnect;
-		return ret;
-	}
 
 	/* keep going if FE state is > open */
 	if (fe->dpcm[stream].state = SND_SOC_DPCM_STATE_OPEN)
 		return 0;
 
 	ret = dpcm_be_dai_hw_params(fe, stream);
-	if (ret < 0) {
+	if (ret < 0)
 		goto close;
-		return ret;
-	}
 
 	/* keep going if FE state is > hw_params */
 	if (fe->dpcm[stream].state = SND_SOC_DPCM_STATE_HW_PARAMS)
@@ -1750,10 +1746,8 @@ static int dpcm_run_update_startup(struct snd_soc_pcm_runtime *fe, int stream)
 
 
 	ret = dpcm_be_dai_prepare(fe, stream);
-	if (ret < 0) {
+	if (ret < 0)
 		goto hw_free;
-		return ret;
-	}
 
 	/* run the stream event for each BE */
 	dpcm_dapm_stream_event(fe, stream, SND_SOC_DAPM_STREAM_NOP);
