From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Thu, 26 Dec 2019 16:29:07 +0000
Subject: [PATCH] ASoC: cs47l92: Simplify error handling code in 'cs47l92_probe()'
Message-Id: <20191226162907.9490-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: brian.austin@cirrus.com, Paul.Handrigan@cirrus.com, ckeepax@opensource.cirrus.com, rf@opensource.cirrus.com, lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

If 'madera_init_bus_error_irq()' fails,
'wm_adsp2_remove(&cs47l92->core.adsp[0])' will be called twice.
Once in the 'if' block, and once in the error handling path.
This is harmless, but one of this call can be axed.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 sound/soc/codecs/cs47l92.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/sound/soc/codecs/cs47l92.c b/sound/soc/codecs/cs47l92.c
index d50f75f3b3e4..536b7d35d6b2 100644
--- a/sound/soc/codecs/cs47l92.c
+++ b/sound/soc/codecs/cs47l92.c
@@ -1959,10 +1959,8 @@ static int cs47l92_probe(struct platform_device *pdev)
 		goto error_dsp_irq;
 
 	ret = madera_init_bus_error_irq(&cs47l92->core, 0, wm_adsp2_bus_error);
-	if (ret != 0) {
-		wm_adsp2_remove(&cs47l92->core.adsp[0]);
+	if (ret != 0)
 		goto error_adsp;
-	}
 
 	madera_init_fll(madera, 1, MADERA_FLL1_CONTROL_1 - 1,
 			&cs47l92->fll[0]);
-- 
2.20.1
