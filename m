From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 22 Nov 2017 16:27:11 +0000
Subject: [PATCH] ASoC: wm0010: Delete an error message for a failed memory allocation in wm0010_boot()
Message-Id: <fcfdbb1f-5b43-f430-dee9-61b86d6cfc79@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: alsa-devel@alsa-project.org, patches@opensource.cirrus.com, Corentin Labbe <clabbe.montjoie@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Richard Fitzgerald <rf@opensource.wolfsonmicro.com>, Takashi Iwai <tiwai@suse.com>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 22 Nov 2017 17:17:48 +0100

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 sound/soc/codecs/wm0010.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/sound/soc/codecs/wm0010.c b/sound/soc/codecs/wm0010.c
index 4f5f5710b569..0147d2fb7b0a 100644
--- a/sound/soc/codecs/wm0010.c
+++ b/sound/soc/codecs/wm0010.c
@@ -655,11 +655,8 @@ static int wm0010_boot(struct snd_soc_codec *codec)
 		ret = -ENOMEM;
 		len = pll_rec.length + 8;
 		out = kzalloc(len, GFP_KERNEL | GFP_DMA);
-		if (!out) {
-			dev_err(codec->dev,
-				"Failed to allocate RX buffer\n");
+		if (!out)
 			goto abort;
-		}
 
 		img_swap = kzalloc(len, GFP_KERNEL | GFP_DMA);
 		if (!img_swap)
-- 
2.15.0

