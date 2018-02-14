From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 14 Feb 2018 07:15:31 +0000
Subject: [PATCH] ASoC: uniphier: fix an error code in uniphier_aio_comprdma_new()
Message-Id: <20180214071531.GB26677@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Katsuhiro Suzuki <suzuki.katsuhiro@socionext.com>
Cc: alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Mark Brown <broonie@kernel.org>

The dma_mapping_error() returns true or false, but we want to return
-ENOMEM if there was an error.

Fixes: e98131222ff9 ("ASoC: uniphier: add support for UniPhier AIO compress audio")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/sound/soc/uniphier/aio-compress.c b/sound/soc/uniphier/aio-compress.c
index 7f7abe3ae99d..4751c8bdabec 100644
--- a/sound/soc/uniphier/aio-compress.c
+++ b/sound/soc/uniphier/aio-compress.c
@@ -54,12 +54,11 @@ static int uniphier_aio_comprdma_new(struct snd_soc_pcm_runtime *rtd)
 		dma_dir = DMA_TO_DEVICE;
 
 	sub->compr_addr = dma_map_single(dev, sub->compr_area, size, dma_dir);
-	ret = dma_mapping_error(dev, sub->compr_addr);
-	if (ret) {
+	if (dma_mapping_error(dev, sub->compr_addr)) {
 		kfree(sub->compr_area);
 		sub->compr_area = NULL;
 
-		return ret;
+		return -ENOMEM;
 	}
 
 	sub->compr_bytes = size;
