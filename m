From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 11 Jul 2012 06:41:23 +0000
Subject: [patch] ASoC: STA529: fix an error message
Message-Id: <20120711064123.GI11812@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Liam Girdwood <lrg@ti.com>
Cc: alsa-devel@alsa-project.org, Rajeev Kumar <rajeev-dlh.kumar@st.com>, Takashi Iwai <tiwai@suse.de>, Mark Brown <broonie@opensource.wolfsonmicro.com>, kernel-janitors@vger.kernel.org

GCC complains that "ret" is uninitialized here.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/sound/soc/codecs/sta529.c b/sound/soc/codecs/sta529.c
index a9f34c7..0c225cd 100644
--- a/sound/soc/codecs/sta529.c
+++ b/sound/soc/codecs/sta529.c
@@ -397,8 +397,9 @@ static __devinit int sta529_i2c_probe(struct i2c_client *i2c,
 
 	sta529->regmap = devm_regmap_init_i2c(i2c, &sta529_regmap);
 	if (IS_ERR(sta529->regmap)) {
+		ret = PTR_ERR(sta529->regmap);
 		dev_err(&i2c->dev, "Failed to allocate regmap: %d\n", ret);
-		return PTR_ERR(sta529->regmap);
+		return ret;
 	}
 
 	i2c_set_clientdata(i2c, sta529);
