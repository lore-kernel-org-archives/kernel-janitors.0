From: Colin King <colin.king@canonical.com>
Date: Tue, 06 Oct 2020 15:20:24 +0000
Subject: [PATCH][next] ASoC: mchp-spdifrx: fix spelling mistake "overrrun" -> "overrun"
Message-Id: <20201006152024.542418-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Ludovic Desroches <ludovic.desroches@microchip.com>, alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in a dev_warn message. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 sound/soc/atmel/mchp-spdifrx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/atmel/mchp-spdifrx.c b/sound/soc/atmel/mchp-spdifrx.c
index 726e4951d9a5..e6ded6f8453f 100644
--- a/sound/soc/atmel/mchp-spdifrx.c
+++ b/sound/soc/atmel/mchp-spdifrx.c
@@ -338,7 +338,7 @@ static irqreturn_t mchp_spdif_interrupt(int irq, void *dev_id)
 	}
 
 	if (pending & SPDIFRX_IR_OVERRUN) {
-		dev_warn(dev->dev, "Overrrun detected\n");
+		dev_warn(dev->dev, "Overrun detected\n");
 		ret = IRQ_HANDLED;
 	}
 
-- 
2.27.0
