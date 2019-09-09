From: Mark Brown <broonie@kernel.org>
Date: Mon, 09 Sep 2019 10:07:17 +0000
Subject: Applied "ASoC: codecs: ad193x: make two arrays static const, makes object smaller" to the asoc tree
Message-Id: <20190909100717.42504D02D7F@fitzroy.sirena.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <20190906161404.1440-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin Ian King <colin.king@canonical.com>
Cc: alsa-devel@alsa-project.org, Lars-Peter Clausen <lars@metafoo.de>, Takashi Iwai <tiwai@suse.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>

The patch

   ASoC: codecs: ad193x: make two arrays static const, makes object smaller

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.4

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

From 78b93b04771bdbefe94b84222506ba992f579c98 Mon Sep 17 00:00:00 2001
From: Colin Ian King <colin.king@canonical.com>
Date: Fri, 6 Sep 2019 17:14:04 +0100
Subject: [PATCH] ASoC: codecs: ad193x: make two arrays static const, makes
 object smaller

Don't populate the arrays on the stack but instead make them
static const. Makes the object code smaller by 37 bytes.

Before:
   text	   data	    bss	    dec	    hex	filename
  16253	   7200	      0	  23453	   5b9d	sound/soc/codecs/ad193x.o

After:
   text	   data	    bss	    dec	    hex	filename
  16056	   7360	      0	  23416	   5b78	sound/soc/codecs/ad193x.o

(gcc version 9.2.1, amd64)

Signed-off-by: Colin Ian King <colin.king@canonical.com>
Link: https://lore.kernel.org/r/20190906161404.1440-1-colin.king@canonical.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/ad193x.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/ad193x.c b/sound/soc/codecs/ad193x.c
index fb04c9379b71..980e024a5720 100644
--- a/sound/soc/codecs/ad193x.c
+++ b/sound/soc/codecs/ad193x.c
@@ -416,7 +416,7 @@ static struct snd_soc_dai_driver ad193x_no_adc_dai = {
 /* codec register values to set after reset */
 static void ad193x_reg_default_init(struct ad193x_priv *ad193x)
 {
-	const struct reg_sequence reg_init[] = {
+	static const struct reg_sequence reg_init[] = {
 		{  0, 0x99 },	/* PLL_CLK_CTRL0: pll input: mclki/xi 12.288Mhz */
 		{  1, 0x04 },	/* PLL_CLK_CTRL1: no on-chip Vref */
 		{  2, 0x40 },	/* DAC_CTRL0: TDM mode */
@@ -432,7 +432,7 @@ static void ad193x_reg_default_init(struct ad193x_priv *ad193x)
 		{ 12, 0x00 },	/* DAC_L4_VOL: no attenuation */
 		{ 13, 0x00 },	/* DAC_R4_VOL: no attenuation */
 	};
-	const struct reg_sequence reg_adc_init[] = {
+	static const struct reg_sequence reg_adc_init[] = {
 		{ 14, 0x03 },	/* ADC_CTRL0: high-pass filter enable */
 		{ 15, 0x43 },	/* ADC_CTRL1: sata delay=1, adc aux mode */
 		{ 16, 0x00 },	/* ADC_CTRL2: reset */
-- 
2.20.1
