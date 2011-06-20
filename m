From: Dan Carpenter <error27@gmail.com>
Date: Mon, 20 Jun 2011 07:11:25 +0000
Subject: [patch] ASoC: adau1701: signedness bug in adau1701_write()
Message-Id: <20110620071125.GG14591@shale.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Cc: "open list:SOUND - SOC LAYER..." <alsa-devel@alsa-project.org>, Lars-Peter Clausen <lars@metafoo.de>, Takashi Iwai <tiwai@suse.de>, Mark Brown <broonie@opensource.wolfsonmicro.com>, kernel-janitors@vger.kernel.org, Liam Girdwood <lrg@ti.com>

"ret" is supposed to be signed here.  The current code will only
return -EIO on error, instead of a more appropriate error code such
as -EAGAIN etc.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/sound/soc/codecs/adau1701.c b/sound/soc/codecs/adau1701.c
index 6c01bb6..2758d5f 100644
--- a/sound/soc/codecs/adau1701.c
+++ b/sound/soc/codecs/adau1701.c
@@ -140,9 +140,10 @@ static unsigned int adau1701_register_size(struct snd_soc_codec *codec,
 static int adau1701_write(struct snd_soc_codec *codec, unsigned int reg,
 		unsigned int value)
 {
-	unsigned int i, ret;
+	unsigned int i;
 	unsigned int size;
 	uint8_t buf[4];
+	int ret;
 
 	size = adau1701_register_size(codec, reg);
 	if (size = 0)
