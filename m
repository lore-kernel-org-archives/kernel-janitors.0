From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Tue, 15 Aug 2017 15:10:10 +0000
Subject: [PATCH 3/5] ASoC: codecs: es8316: constify snd_soc_dai_ops structures
Message-Id: <1502809812-13891-4-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1502809812-13891-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1502809812-13891-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Liam Girdwood <lgirdwood@gmail.com>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>, bhumirks@gmail.com

These snd_soc_dai_ops structures are only stored in the ops field of
a snd_soc_dai_driver structure, which is const.  Thus, the
snd_soc_dai_ops structures can be const too.

Done with the help of Coccinelle.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 sound/soc/codecs/es8316.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/es8316.c b/sound/soc/codecs/es8316.c
index 4f35af6..da2d353 100644
--- a/sound/soc/codecs/es8316.c
+++ b/sound/soc/codecs/es8316.c
@@ -502,7 +502,7 @@ static int es8316_mute(struct snd_soc_dai *dai, int mute)
 #define ES8316_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE | \
 			SNDRV_PCM_FMTBIT_S24_LE)
 
-static struct snd_soc_dai_ops es8316_ops = {
+static const struct snd_soc_dai_ops es8316_ops = {
 	.startup = es8316_pcm_startup,
 	.hw_params = es8316_pcm_hw_params,
 	.set_fmt = es8316_set_dai_fmt,

