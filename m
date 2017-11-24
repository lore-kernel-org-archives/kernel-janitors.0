From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 24 Nov 2017 07:37:41 +0000
Subject: [PATCH 2/4] ASoC: wm2000: One function call less in wm2000_i2c_probe() after error detection
Message-Id: <e09f6361-8d58-c534-4aaa-cafb7f801726@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <cd76c876-81a5-3cf6-e7d9-52037729fb98@users.sourceforge.net>
In-Reply-To: <cd76c876-81a5-3cf6-e7d9-52037729fb98@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: alsa-devel@alsa-project.org, patches@opensource.cirrus.com, Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 24 Nov 2017 07:45:59 +0100

The release_firmware() function was called in a few cases by the
wm2000_i2c_probe() function during error handling even if
the passed variable contained a null pointer.

* Adjust jump targets according to the Linux coding style convention.

* Delete the label "out" and an initialisation for the variable "fw"
  at the beginning which became unnecessary with this refactoring.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 sound/soc/codecs/wm2000.c | 22 ++++++++++------------
 1 file changed, 10 insertions(+), 12 deletions(-)

diff --git a/sound/soc/codecs/wm2000.c b/sound/soc/codecs/wm2000.c
index ce936deed7e3..0ed2a8992df4 100644
--- a/sound/soc/codecs/wm2000.c
+++ b/sound/soc/codecs/wm2000.c
@@ -821,7 +821,7 @@ static int wm2000_i2c_probe(struct i2c_client *i2c,
 	struct wm2000_priv *wm2000;
 	struct wm2000_platform_data *pdata;
 	const char *filename;
-	const struct firmware *fw = NULL;
+	const struct firmware *fw;
 	int ret, i;
 	int reg;
 	u16 id;
@@ -840,7 +840,7 @@ static int wm2000_i2c_probe(struct i2c_client *i2c,
 		ret = PTR_ERR(wm2000->regmap);
 		dev_err(&i2c->dev, "Failed to allocate register map: %d\n",
 			ret);
-		goto out;
+		return ret;
 	}
 
 	for (i = 0; i < WM2000_NUM_SUPPLIES; i++)
@@ -868,7 +868,7 @@ static int wm2000_i2c_probe(struct i2c_client *i2c,
 	if (id != 0x2000) {
 		dev_err(&i2c->dev, "Device is not a WM2000 - ID %x\n", id);
 		ret = -ENODEV;
-		goto err_supplies;
+		goto disable_regulator;
 	}
 
 	reg = wm2000_read(i2c, WM2000_REG_REVISON);
@@ -878,7 +878,7 @@ static int wm2000_i2c_probe(struct i2c_client *i2c,
 	if (IS_ERR(wm2000->mclk)) {
 		ret = PTR_ERR(wm2000->mclk);
 		dev_err(&i2c->dev, "Failed to get MCLK: %d\n", ret);
-		goto err_supplies;
+		goto disable_regulator;
 	}
 
 	filename = "wm2000_anc.bin";
@@ -893,7 +893,7 @@ static int wm2000_i2c_probe(struct i2c_client *i2c,
 	ret = request_firmware(&fw, filename, &i2c->dev);
 	if (ret != 0) {
 		dev_err(&i2c->dev, "Failed to acquire ANC data: %d\n", ret);
-		goto err_supplies;
+		goto disable_regulator;
 	}
 
 	/* Pre-cook the concatenation of the register address onto the image */
@@ -901,9 +901,9 @@ static int wm2000_i2c_probe(struct i2c_client *i2c,
 	wm2000->anc_download = devm_kzalloc(&i2c->dev,
 					    wm2000->anc_download_size,
 					    GFP_KERNEL);
-	if (wm2000->anc_download = NULL) {
+	if (!wm2000->anc_download) {
 		ret = -ENOMEM;
-		goto err_supplies;
+		goto release_firmware;
 	}
 
 	wm2000->anc_download[0] = 0x80;
@@ -918,12 +918,10 @@ static int wm2000_i2c_probe(struct i2c_client *i2c,
 	wm2000_reset(wm2000);
 
 	ret = snd_soc_register_codec(&i2c->dev, &soc_codec_dev_wm2000, NULL, 0);
-
-err_supplies:
-	regulator_bulk_disable(WM2000_NUM_SUPPLIES, wm2000->supplies);
-
-out:
+release_firmware:
 	release_firmware(fw);
+disable_regulator:
+	regulator_bulk_disable(WM2000_NUM_SUPPLIES, wm2000->supplies);
 	return ret;
 }
 
-- 
2.15.0

