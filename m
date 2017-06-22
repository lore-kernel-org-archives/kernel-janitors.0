From: Colin King <colin.king@canonical.com>
Date: Thu, 22 Jun 2017 09:32:31 +0000
Subject: [PATCH] ASoC: max9867: make array ni_div static const
Message-Id: <20170622093231.11389-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Vinod Koul <vinod.koul@intel.com>, Javier Martinez Canillas <javier@osg.samsung.com>, Takashi Sakamoto <o-takashi@sakamocchi.jp>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Enric Balletbo i Serra <enric.balletbo@collabora.com>, alsa-devel@alsa-project.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The array ni_div does not need to be in global scope and is not
modified, so make it static const.

Cleans up sparse warning:
"symbol 'ni_div' was not declared. Should it be static?"

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 sound/soc/codecs/max9867.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/max9867.c b/sound/soc/codecs/max9867.c
index 0247edc9c84e..2a40a69a7513 100644
--- a/sound/soc/codecs/max9867.c
+++ b/sound/soc/codecs/max9867.c
@@ -132,7 +132,7 @@ enum rates {
 	pcm_rate_48, max_pcm_rate,
 };
 
-struct ni_div_rates {
+static const struct ni_div_rates {
 	u32 mclk;
 	u16 ni[max_pcm_rate];
 } ni_div[] = {
-- 
2.11.0

