From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 24 Nov 2017 07:36:17 +0000
Subject: [PATCH 1/4] ASoC: wm2000: Delete an error message for a failed memory allocation in wm2000_i2c_probe
Message-Id: <87078639-7ec0-c3cc-5399-5607f2329c63@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <cd76c876-81a5-3cf6-e7d9-52037729fb98@users.sourceforge.net>
In-Reply-To: <cd76c876-81a5-3cf6-e7d9-52037729fb98@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: alsa-devel@alsa-project.org, patches@opensource.cirrus.com, Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 23 Nov 2017 22:28:00 +0100

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 sound/soc/codecs/wm2000.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/codecs/wm2000.c b/sound/soc/codecs/wm2000.c
index 23cde3a0dc11..ce936deed7e3 100644
--- a/sound/soc/codecs/wm2000.c
+++ b/sound/soc/codecs/wm2000.c
@@ -902,7 +902,6 @@ static int wm2000_i2c_probe(struct i2c_client *i2c,
 					    wm2000->anc_download_size,
 					    GFP_KERNEL);
 	if (wm2000->anc_download = NULL) {
-		dev_err(&i2c->dev, "Out of memory\n");
 		ret = -ENOMEM;
 		goto err_supplies;
 	}
-- 
2.15.0

