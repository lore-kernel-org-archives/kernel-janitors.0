From: Mark Brown <broonie@kernel.org>
Date: Wed, 25 Mar 2020 21:51:36 +0000
Subject: Applied "ASoC: mchp-i2s-mcc: make signed 1 bit bitfields unsigned" to the asoc tree
Message-Id: <applied-20200325132913.110115-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <20200325132913.110115-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin Ian King <colin.king@canonical.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, Nicolas Ferre <nicolas.ferre@microchip.com>, kernel-janitors@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, Ludovic Desroches <ludovic.desroches@microchip.com>, Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>, Codrin Ciubotariu <codrin.ciubotariu@microchip.com>, linux-arm-kernel@lists.infradead.org

The patch

   ASoC: mchp-i2s-mcc: make signed 1 bit bitfields unsigned

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git 

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

From 633fddee7355e46a5b5ec471abb58d65e1e41012 Mon Sep 17 00:00:00 2001
From: Colin Ian King <colin.king@canonical.com>
Date: Wed, 25 Mar 2020 13:29:13 +0000
Subject: [PATCH] ASoC: mchp-i2s-mcc: make signed 1 bit bitfields unsigned

The signed 1 bit bitfields should be unsigned, so make them unsigned.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
Reviewed-by: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
Link: https://lore.kernel.org/r/20200325132913.110115-1-colin.king@canonical.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/atmel/mchp-i2s-mcc.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/atmel/mchp-i2s-mcc.c b/sound/soc/atmel/mchp-i2s-mcc.c
index befc2a3a05b0..3cb63886195f 100644
--- a/sound/soc/atmel/mchp-i2s-mcc.c
+++ b/sound/soc/atmel/mchp-i2s-mcc.c
@@ -239,10 +239,10 @@ struct mchp_i2s_mcc_dev {
 	unsigned int				frame_length;
 	int					tdm_slots;
 	int					channels;
-	int					gclk_use:1;
-	int					gclk_running:1;
-	int					tx_rdy:1;
-	int					rx_rdy:1;
+	unsigned int				gclk_use:1;
+	unsigned int				gclk_running:1;
+	unsigned int				tx_rdy:1;
+	unsigned int				rx_rdy:1;
 };
 
 static irqreturn_t mchp_i2s_mcc_interrupt(int irq, void *dev_id)
-- 
2.20.1
