From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 19 Nov 2017 14:08:39 +0000
Subject: [PATCH] ASoC: bells: Use common error handling code in bells_set_bias_level_post()
Message-Id: <8c4e72ae-7606-a4c8-3d53-42364d7edbb2@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: alsa-devel@alsa-project.org, Jaroslav Kysela <perex@perex.cz>, Krzysztof Kozlowski <krzk@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Sangbeom Kim <sbkim73@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Takashi Iwai <tiwai@suse.com>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 19 Nov 2017 15:00:22 +0100

* Add a jump target so that a specific error message is stored only once
  at the end of this function implementation.

* Replace two calls of the macro "pr_err" by goto statements.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 sound/soc/samsung/bells.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/sound/soc/samsung/bells.c b/sound/soc/samsung/bells.c
index 34deba461ae1..fc9a71523b3e 100644
--- a/sound/soc/samsung/bells.c
+++ b/sound/soc/samsung/bells.c
@@ -120,18 +120,14 @@ static int bells_set_bias_level_post(struct snd_soc_card *card,
 	switch (level) {
 	case SND_SOC_BIAS_STANDBY:
 		ret = snd_soc_codec_set_pll(codec, WM5102_FLL1, 0, 0, 0);
-		if (ret < 0) {
-			pr_err("Failed to stop FLL: %d\n", ret);
-			return ret;
-		}
+		if (ret < 0)
+			goto report_failure;
 
 		if (bells->asyncclk_rate) {
 			ret = snd_soc_codec_set_pll(codec, WM5102_FLL2,
 						    0, 0, 0);
-			if (ret < 0) {
-				pr_err("Failed to stop FLL: %d\n", ret);
-				return ret;
-			}
+			if (ret < 0)
+				goto report_failure;
 		}
 		break;
 
@@ -142,6 +138,10 @@ static int bells_set_bias_level_post(struct snd_soc_card *card,
 	dapm->bias_level = level;
 
 	return 0;
+
+report_failure:
+	pr_err("Failed to stop FLL: %d\n", ret);
+	return ret;
 }
 
 static int bells_late_probe(struct snd_soc_card *card)
-- 
2.15.0

