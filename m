From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Thu, 31 Aug 2017 04:40:42 +0000
Subject: [PATCH] ALSA: ac97c: Fix an error handling path in 'atmel_ac97c_probe()'
Message-Id: <20170831044042.23306-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: perex@perex.cz, tiwai@suse.com, arvind.yadav.cs@gmail.com, nicolas.ferre@microchip.com, broonie@kernel.org, garsilva@embeddedor.com, andriy.shevchenko@linux.intel.com, bhumirks@gmail.com
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

If 'clk_prepare_enable()' fails, we must release some resources before
returning. Add a new label in the existing error handling path and 'goto'
there.

Fixes: 260ea95cc027 ("ASoC: atmel: ac97c: Handle return value of clk_prepare_enable.")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 sound/atmel/ac97c.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/atmel/ac97c.c b/sound/atmel/ac97c.c
index 30c64ab210d9..5ffefac2fa8f 100644
--- a/sound/atmel/ac97c.c
+++ b/sound/atmel/ac97c.c
@@ -785,7 +785,7 @@ static int atmel_ac97c_probe(struct platform_device *pdev)
 	}
 	retval = clk_prepare_enable(pclk);
 	if (retval)
-		return retval;
+		goto err_prepare_enable;
 
 	retval = snd_card_new(&pdev->dev, SNDRV_DEFAULT_IDX1,
 			      SNDRV_DEFAULT_STR1, THIS_MODULE,
@@ -881,6 +881,7 @@ static int atmel_ac97c_probe(struct platform_device *pdev)
 	snd_card_free(card);
 err_snd_card_new:
 	clk_disable_unprepare(pclk);
+err_prepare_enable:
 	clk_put(pclk);
 	return retval;
 }
-- 
2.11.0

