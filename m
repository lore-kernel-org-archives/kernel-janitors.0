From: Colin King <colin.king@canonical.com>
Date: Wed, 23 Aug 2017 09:37:41 +0000
Subject: [PATCH][next] ASoC: tegra: remove unused variable machine, fixes build warning
Message-Id: <20170823093741.26739-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Codrut Grosu <codrut.cristian.grosu@gmail.com>, Julia Lawall <Julia.Lawall@lip6.fr>, Donglin Peng <dolinux.peng@gmail.com>, alsa-devel@alsa-project.org, linux-tegra@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Remove unused variable 'machine', fixes build warning:
sound/soc/tegra/tegra_wm8903.c: In function 'tegra_wm8903_remove':
sound/soc/tegra/tegra_wm8903.c:206:23: warning: unused variable
  'machine' [-Wunused-variable]
  struct tegra_wm8903 *machine = snd_soc_card_get_drvdata(card);
                       ^~~~~~~
Fixes: 2a8bd83af30e ("ASoC: tegra: Remove superfluous snd_soc_jack_free_gpios() call")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 sound/soc/tegra/tegra_wm8903.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/tegra/tegra_wm8903.c b/sound/soc/tegra/tegra_wm8903.c
index 2384cb9cb95c..18bdae59a4df 100644
--- a/sound/soc/tegra/tegra_wm8903.c
+++ b/sound/soc/tegra/tegra_wm8903.c
@@ -203,7 +203,6 @@ static int tegra_wm8903_remove(struct snd_soc_card *card)
 		snd_soc_get_pcm_runtime(card, card->dai_link[0].name);
 	struct snd_soc_dai *codec_dai = rtd->codec_dai;
 	struct snd_soc_codec *codec = codec_dai->codec;
-	struct tegra_wm8903 *machine = snd_soc_card_get_drvdata(card);
 
 	wm8903_mic_detect(codec, NULL, 0, 0);
 
-- 
2.14.1

