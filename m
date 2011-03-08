From: Dan Carpenter <error27@gmail.com>
Date: Tue, 08 Mar 2011 11:39:24 +0000
Subject: [patch] ASoC: sgtl5000: use after free in ldo_regulator_register()
Message-Id: <20110308113924.GC3416@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Liam Girdwood <lrg@slimlogic.co.uk>
Cc: alsa-devel@alsa-project.org, Zeng Zhaoming <b32542@freescale.com>, Takashi Iwai <tiwai@suse.de>, Mark Brown <broonie@opensource.wolfsonmicro.com>, kernel-janitors@vger.kernel.org

The "ldo" variable was dereferenced after free on the error path.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/sound/soc/codecs/sgtl5000.c b/sound/soc/codecs/sgtl5000.c
index b7e97c0..1f7217f 100644
--- a/sound/soc/codecs/sgtl5000.c
+++ b/sound/soc/codecs/sgtl5000.c
@@ -875,11 +875,13 @@ static int ldo_regulator_register(struct snd_soc_codec *codec,
 	ldo->dev = regulator_register(&ldo->desc, codec->dev,
 					  init_data, ldo);
 	if (IS_ERR(ldo->dev)) {
+		int ret = PTR_ERR(ldo->dev);
+
 		dev_err(codec->dev, "failed to register regulator\n");
 		kfree(ldo->desc.name);
 		kfree(ldo);
 
-		return PTR_ERR(ldo->dev);
+		return ret;
 	}
 
 	return 0;
