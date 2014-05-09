From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 09 May 2014 11:55:38 +0000
Subject: [patch] ASoC: wm0010: set error code on allocation failure
Message-Id: <20140509115538.GB32027@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.de>, Charles Keepax <ckeepax@opensource.wolfsonmicro.com>, Dimitris Papastamos <dp@opensource.wolfsonmicro.com>, Wei Yongjun <yongjun_wei@trendmicro.com.cn>, patches@opensource.wolfsonmicro.com, alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org

We should return -ENOMEM if the kzalloc() fails instead of returning
-ENOMEM.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/sound/soc/codecs/wm0010.c b/sound/soc/codecs/wm0010.c
index 71ce315..8dac6c5 100644
--- a/sound/soc/codecs/wm0010.c
+++ b/sound/soc/codecs/wm0010.c
@@ -682,6 +682,7 @@ static int wm0010_boot(struct snd_soc_codec *codec)
 		if (!img_swap) {
 			dev_err(codec->dev,
 				"Failed to allocate image buffer\n");
+			ret = -ENOMEM;
 			goto abort;
 		}
 
