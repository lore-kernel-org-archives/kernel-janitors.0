From: Mark Brown <broonie@kernel.org>
Date: Fri, 15 Nov 2019 12:25:01 +0000
Subject: Applied "ASoC: tas2770: clean up an indentation issue" to the asoc tree
Message-Id: <20191115122501.23ADF27415A7@ypsilon.sirena.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <20191112190218.282337-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin Ian King <colin.king@canonical.com>
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>

The patch

   ASoC: tas2770: clean up an indentation issue

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.5

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

From b26eb5173c85082eec7d6e18369f6f9d96bf0b21 Mon Sep 17 00:00:00 2001
From: Colin Ian King <colin.king@canonical.com>
Date: Tue, 12 Nov 2019 19:02:18 +0000
Subject: [PATCH] ASoC: tas2770: clean up an indentation issue

There is a block that is indented too deeply, remove
the extraneous tabs.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
Link: https://lore.kernel.org/r/20191112190218.282337-1-colin.king@canonical.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/tas2770.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/tas2770.c b/sound/soc/codecs/tas2770.c
index ad76f22fcfac..54c8135fe43c 100644
--- a/sound/soc/codecs/tas2770.c
+++ b/sound/soc/codecs/tas2770.c
@@ -761,12 +761,12 @@ static int tas2770_i2c_probe(struct i2c_client *client,
 	tas2770->reset_gpio = devm_gpiod_get_optional(tas2770->dev,
 							  "reset-gpio",
 						      GPIOD_OUT_HIGH);
-		if (IS_ERR(tas2770->reset_gpio)) {
-			if (PTR_ERR(tas2770->reset_gpio) = -EPROBE_DEFER) {
-				tas2770->reset_gpio = NULL;
-				return -EPROBE_DEFER;
-			}
+	if (IS_ERR(tas2770->reset_gpio)) {
+		if (PTR_ERR(tas2770->reset_gpio) = -EPROBE_DEFER) {
+			tas2770->reset_gpio = NULL;
+			return -EPROBE_DEFER;
 		}
+	}
 
 	tas2770->channel_size = 0;
 	tas2770->slot_width = 0;
-- 
2.20.1
