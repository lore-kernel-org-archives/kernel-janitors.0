From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 23 Nov 2017 21:08:58 +0000
Subject: [PATCH 1/4] ASoC: twl4030: Delete an error message for a failed memory allocation in twl4030_get_pda
Message-Id: <5e96623c-ad1f-5260-2580-f487e64abaf8@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <d2edbce1-ffce-9c18-3f50-baa0cdfb0152@users.sourceforge.net>
In-Reply-To: <d2edbce1-ffce-9c18-3f50-baa0cdfb0152@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: alsa-devel@alsa-project.org, Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Peter Ujfalusi <peter.ujfalusi@ti.com>, Takashi Iwai <tiwai@suse.com>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 23 Nov 2017 21:30:07 +0100

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 sound/soc/codecs/twl4030.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/codecs/twl4030.c b/sound/soc/codecs/twl4030.c
index cfe72b9d4356..90691701b082 100644
--- a/sound/soc/codecs/twl4030.c
+++ b/sound/soc/codecs/twl4030.c
@@ -240,7 +240,6 @@ static struct twl4030_codec_data *twl4030_get_pdata(struct snd_soc_codec *codec)
 				     sizeof(struct twl4030_codec_data),
 				     GFP_KERNEL);
 		if (!pdata) {
-			dev_err(codec->dev, "Can not allocate memory\n");
 			of_node_put(twl4030_codec_node);
 			return NULL;
 		}
-- 
2.15.0

