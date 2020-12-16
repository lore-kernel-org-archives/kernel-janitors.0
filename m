From: Colin King <colin.king@canonical.com>
Date: Wed, 16 Dec 2020 11:26:08 +0000
Subject: [PATCH] ASoC: atmel: fix spelling mistake in Kconfig "programable" -> "programmable"
Message-Id: <20201216112608.11385-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Ludovic Desroches <ludovic.desroches@microchip.com>, alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There are a couple of spelling mistakes in the Kconfig help text. Fix them.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 sound/soc/atmel/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/atmel/Kconfig b/sound/soc/atmel/Kconfig
index 142373ec411a..9fe9471f4514 100644
--- a/sound/soc/atmel/Kconfig
+++ b/sound/soc/atmel/Kconfig
@@ -143,7 +143,7 @@ config SND_MCHP_SOC_SPDIFTX
 	  - sama7g5
 
 	  This S/PDIF TX driver is compliant with IEC-60958 standard and
-	  includes programable User Data and Channel Status fields.
+	  includes programmable User Data and Channel Status fields.
 
 config SND_MCHP_SOC_SPDIFRX
 	tristate "Microchip ASoC driver for boards using S/PDIF RX"
@@ -157,5 +157,5 @@ config SND_MCHP_SOC_SPDIFRX
 	  - sama7g5
 
 	  This S/PDIF RX driver is compliant with IEC-60958 standard and
-	  includes programable User Data and Channel Status fields.
+	  includes programmable User Data and Channel Status fields.
 endif
-- 
2.29.2
