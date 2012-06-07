From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 07 Jun 2012 12:38:37 +0000
Subject: [patch] ASoC: isabelle: using an uninitialized variable
Message-Id: <20120607123837.GA7171@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Liam Girdwood <lrg@ti.com>
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>, Mark Brown <broonie@opensource.wolfsonmicro.com>, kernel-janitors@vger.kernel.org, Vishwas A Deshpande <vishwas.a.deshpande@ti.com>, M R Swami Reddy <mr.swami.reddy@ti.com>

We should set "isabelle_regmap" before using it.  GCC complains.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/sound/soc/codecs/isabelle.c b/sound/soc/codecs/isabelle.c
index bcc77ef..0d62f3b 100644
--- a/sound/soc/codecs/isabelle.c
+++ b/sound/soc/codecs/isabelle.c
@@ -1126,8 +1126,6 @@ static int __devinit isabelle_i2c_probe(struct i2c_client *i2c,
 	struct regmap *isabelle_regmap;
 	int ret = 0;
 
-	i2c_set_clientdata(i2c, isabelle_regmap);
-
 	isabelle_regmap = devm_regmap_init_i2c(i2c, &isabelle_regmap_config);
 	if (IS_ERR(isabelle_regmap)) {
 		ret = PTR_ERR(isabelle_regmap);
@@ -1135,6 +1133,7 @@ static int __devinit isabelle_i2c_probe(struct i2c_client *i2c,
 			ret);
 		return ret;
 	}
+	i2c_set_clientdata(i2c, isabelle_regmap);
 
 	ret =  snd_soc_register_codec(&i2c->dev,
 				&soc_codec_dev_isabelle, isabelle_dai,
