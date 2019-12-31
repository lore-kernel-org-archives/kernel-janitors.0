From: Mark Brown <broonie@kernel.org>
Date: Tue, 31 Dec 2019 00:30:34 +0000
Subject: Applied "ASoC: cs47l92: Simplify error handling code in 'cs47l92_probe()'" to the asoc tree
Message-Id: <applied-20191226162907.9490-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <20191226162907.9490-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: alsa-devel@alsa-project.org, ckeepax@opensource.cirrus.com, linux-kernel@vger.kernel.org, tiwai@suse.com, kernel-janitors@vger.kernel.org, brian.austin@cirrus.com, Paul.Handrigan@cirrus.com, lgirdwood@gmail.com, rf@opensource.cirrus.com, Mark Brown <broonie@kernel.org>, patches@opensource.cirrus.com

The patch

   ASoC: cs47l92: Simplify error handling code in 'cs47l92_probe()'

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.6

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From 9ea7a991cc27e9af1099b7a628c0ab210dc70a69 Mon Sep 17 00:00:00 2001
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Thu, 26 Dec 2019 17:29:07 +0100
Subject: [PATCH] ASoC: cs47l92: Simplify error handling code in
 'cs47l92_probe()'

If 'madera_init_bus_error_irq()' fails,
'wm_adsp2_remove(&cs47l92->core.adsp[0])' will be called twice.
Once in the 'if' block, and once in the error handling path.
This is harmless, but one of this call can be axed.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Link: https://lore.kernel.org/r/20191226162907.9490-1-christophe.jaillet@wanadoo.fr
Signed-off-by: Mark Brown <broonie@kernel.org>
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
