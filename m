From: Mao Wenan <maowenan@huawei.com>
Date: Sat, 12 Oct 2019 02:42:30 +0000
Subject: [PATCH -next] ASoC: atmel: select SND_ATMEL_SOC_DMA for SND_ATMEL_SOC_SSC
Message-Id: <20191012024230.159371-1-maowenan@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: codrin.ciubotariu@microchip.com, lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com, nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, ludovic.desroches@microchip.com, mirq-linux@rere.qmqm.pl
Cc: alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Mao Wenan <maowenan@huawei.com>

If SND_ATMEL_SOC_SSC_PDC=y and SND_ATMEL_SOC_SSC_DMA=m,
below errors can be found:
sound/soc/atmel/atmel_ssc_dai.o: In function
`atmel_ssc_set_audio':
atmel_ssc_dai.c:(.text+0x6fe): undefined reference to
`atmel_pcm_dma_platform_register'
make: *** [vmlinux] Error 1

After commit 18291410557f ("ASoC: atmel: enable
SOC_SSC_PDC and SOC_SSC_DMA in Kconfig"), SND_ATMEL_SOC_DMA
and SND_ATMEL_SOC_SSC are selected by SND_ATMEL_SOC_SSC_DMA,
SND_ATMEL_SOC_SSC is also selected by SND_ATMEL_SOC_SSC_PDC,
the results are SND_ATMEL_SOC_DMA=m but SND_ATMEL_SOC_SSC=y,
so the errors happen.

This patch make SND_ATMEL_SOC_SSC select SND_ATMEL_SOC_DMA.

Fixes: 18291410557f ("ASoC: atmel: enable SOC_SSC_PDC and SOC_SSC_DMA in Kconfig")
Signed-off-by: Mao Wenan <maowenan@huawei.com>
---
 sound/soc/atmel/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/atmel/Kconfig b/sound/soc/atmel/Kconfig
index f118c22..2938f6b 100644
--- a/sound/soc/atmel/Kconfig
+++ b/sound/soc/atmel/Kconfig
@@ -19,6 +19,7 @@ config SND_ATMEL_SOC_DMA
 
 config SND_ATMEL_SOC_SSC
 	tristate
+	select SND_ATMEL_SOC_DMA
 
 config SND_ATMEL_SOC_SSC_PDC
 	tristate "SoC PCM DAI support for AT91 SSC controller using PDC"
-- 
2.7.4
