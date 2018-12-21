From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 21 Dec 2018 09:11:20 +0000
Subject: [PATCH] ASoC: pcm512x: Fix a double unlock in pcm512x_digital_mute()
Message-Id: <20181221091120.GG2735@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Liam Girdwood <lgirdwood@gmail.com>
Cc: alsa-devel@alsa-project.org, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, kernel-janitors@vger.kernel.org, Takashi Iwai <tiwai@suse.com>, Dimitris Papavasiliou <dpapavas@gmail.com>, Mark Brown <broonie@kernel.org>

We accidentally call mutex_unlock(&pcm512x->mutex); twice in a row.

I re-wrote the error handling to use "goto unlock;" instead of returning
directly.  Hopefully, it makes the code a little simpler.

Fixes: 3500f1c589e9 ("ASoC: pcm512x: Implement the digital_mute interface")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 sound/soc/codecs/pcm512x.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/pcm512x.c b/sound/soc/codecs/pcm512x.c
index 6cb1653be804..4cc24a5d5c31 100644
--- a/sound/soc/codecs/pcm512x.c
+++ b/sound/soc/codecs/pcm512x.c
@@ -1400,24 +1400,20 @@ static int pcm512x_digital_mute(struct snd_soc_dai *dai, int mute)
 		if (ret != 0) {
 			dev_err(component->dev,
 				"Failed to set digital mute: %d\n", ret);
-			mutex_unlock(&pcm512x->mutex);
-			return ret;
+			goto unlock;
 		}
 
 		regmap_read_poll_timeout(pcm512x->regmap,
 					 PCM512x_ANALOG_MUTE_DET,
 					 mute_det, (mute_det & 0x3) = 0,
 					 200, 10000);
-
-		mutex_unlock(&pcm512x->mutex);
 	} else {
 		pcm512x->mute &= ~0x1;
 		ret = pcm512x_update_mute(pcm512x);
 		if (ret != 0) {
 			dev_err(component->dev,
 				"Failed to update digital mute: %d\n", ret);
-			mutex_unlock(&pcm512x->mutex);
-			return ret;
+			goto unlock;
 		}
 
 		regmap_read_poll_timeout(pcm512x->regmap,
@@ -1428,9 +1424,10 @@ static int pcm512x_digital_mute(struct snd_soc_dai *dai, int mute)
 					 200, 10000);
 	}
 
+unlock:
 	mutex_unlock(&pcm512x->mutex);
 
-	return 0;
+	return ret;
 }
 
 static const struct snd_soc_dai_ops pcm512x_dai_ops = {
-- 
2.17.1
