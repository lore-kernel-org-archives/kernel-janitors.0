From: Colin King <colin.king@canonical.com>
Date: Thu, 04 Apr 2019 07:56:03 +0000
Subject: [PATCH][next] ASoC: sprd: Fix spelling mistake "faied" -> "failed"
Message-Id: <20190404075603.11680-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linaro.org>, Chunyan Zhang <zhang.lyra@gmail.com>, alsa-devel@alsa-project.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There are two identical spelling mistakes in dev_err messages. Fix them.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 sound/soc/sprd/sprd-pcm-compress.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sprd/sprd-pcm-compress.c b/sound/soc/sprd/sprd-pcm-compress.c
index dc84257cffc2..e008525a6cb3 100644
--- a/sound/soc/sprd/sprd-pcm-compress.c
+++ b/sound/soc/sprd/sprd-pcm-compress.c
@@ -282,13 +282,13 @@ static int sprd_platform_compr_set_params(struct snd_compr_stream *cstream,
 	 */
 	ret = sprd_platform_compr_dma_config(cstream, params, 1);
 	if (ret) {
-		dev_err(dev, "faied to config stage 1 DMA: %d\n", ret);
+		dev_err(dev, "failed to config stage 1 DMA: %d\n", ret);
 		return ret;
 	}
 
 	ret = sprd_platform_compr_dma_config(cstream, params, 0);
 	if (ret) {
-		dev_err(dev, "faied to config stage 0 DMA: %d\n", ret);
+		dev_err(dev, "failed to config stage 0 DMA: %d\n", ret);
 		goto config_err;
 	}
 
-- 
2.20.1
