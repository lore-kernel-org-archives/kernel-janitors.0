From: Colin King <colin.king@canonical.com>
Date: Thu, 24 Oct 2019 12:46:10 +0000
Subject: [PATCH][next] ASoC: rt5677: Add missing null check for failed allocation of rt5677_dsp
Message-Id: <20191024124610.18182-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bard Liao <bardliao@realtek.com>, Oder Chiou <oder_chiou@realtek.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Curtis Malainey <cujomalainey@chromium.org>, Ben Zhang <benzh@chromium.org>, alsa-devel@alsa-project.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The allocation of rt5677_dsp can potentially fail and return null, so add
a null check and return -ENOMEM on a memory allocation failure.

Addresses-Coverity: ("Dereference null return")
Fixes: a0e0d135427c ("ASoC: rt5677: Add a PCM device for streaming hotword via SPI")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 sound/soc/codecs/rt5677-spi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/codecs/rt5677-spi.c b/sound/soc/codecs/rt5677-spi.c
index 36c02d200cfc..3a17643fcd9f 100644
--- a/sound/soc/codecs/rt5677-spi.c
+++ b/sound/soc/codecs/rt5677-spi.c
@@ -376,6 +376,8 @@ static int rt5677_spi_pcm_probe(struct snd_soc_component *component)
 
 	rt5677_dsp = devm_kzalloc(component->dev, sizeof(*rt5677_dsp),
 			GFP_KERNEL);
+	if (!rt5677_dsp)
+		return -ENOMEM;
 	rt5677_dsp->dev = &g_spi->dev;
 	mutex_init(&rt5677_dsp->dma_lock);
 	INIT_DELAYED_WORK(&rt5677_dsp->copy_work, rt5677_spi_copy_work);
-- 
2.20.1
