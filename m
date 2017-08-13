From: Colin King <colin.king@canonical.com>
Date: Sun, 13 Aug 2017 15:08:03 +0000
Subject: [PATCH] ASoC: rt5514: make array rt5514_dai static
Message-Id: <20170813150803.17292-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bard Liao <bardliao@realtek.com>, Oder Chiou <oder_chiou@realtek.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The array rt5514_dai is local to the source and does not need to be in
global scope, so make it static.

Cleans up sparse warnings:
symbol 'rt5514_dai' was not declared. Should it be static?

warning: symbol 'rt5514_dai' was not declared. Should it be static?

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 sound/soc/codecs/rt5514.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/rt5514.c b/sound/soc/codecs/rt5514.c
index 7afcb57989af..d7956ababd11 100644
--- a/sound/soc/codecs/rt5514.c
+++ b/sound/soc/codecs/rt5514.c
@@ -1066,7 +1066,7 @@ static const struct snd_soc_dai_ops rt5514_aif_dai_ops = {
 	.set_tdm_slot = rt5514_set_tdm_slot,
 };
 
-struct snd_soc_dai_driver rt5514_dai[] = {
+static struct snd_soc_dai_driver rt5514_dai[] = {
 	{
 		.name = "rt5514-aif1",
 		.id = 0,
-- 
2.11.0

