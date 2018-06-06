From: Colin King <colin.king@canonical.com>
Date: Wed, 06 Jun 2018 10:31:23 +0000
Subject: [PATCH] ASoC: ak4458: make structure soc_codec_dev_ak4458 static const
Message-Id: <20180606103123.31719-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Cosmin-Gabriel Samoila <cosmin.samoila@nxp.com>, alsa-devel@alsa-project.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The structure soc_codec_dev_ak4458 is local to the source and do not
need to be in global scope and can be const, make it static const.

Cleans up sparse warnings:
warning: symbol 'soc_codec_dev_ak4458' was not declared. Should it
be static?

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 sound/soc/codecs/ak4458.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/ak4458.c b/sound/soc/codecs/ak4458.c
index 31ec0ba2e639..299ada4dfaa0 100644
--- a/sound/soc/codecs/ak4458.c
+++ b/sound/soc/codecs/ak4458.c
@@ -558,7 +558,7 @@ static int __maybe_unused ak4458_runtime_resume(struct device *dev)
 }
 #endif /* CONFIG_PM */
 
-struct snd_soc_component_driver soc_codec_dev_ak4458 = {
+static const struct snd_soc_component_driver soc_codec_dev_ak4458 = {
 	.probe			= ak4458_probe,
 	.remove			= ak4458_remove,
 	.controls		= ak4458_snd_controls,
-- 
2.17.0

