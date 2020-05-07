From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Thu, 07 May 2020 09:43:35 +0000
Subject: [PATCH -next] ASoC: rt5677: Use devm_snd_soc_register_component()
Message-Id: <20200507094335.14302-1-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Oder Chiou <oder_chiou@realtek.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi
 Iwai <tiwai@suse.com>
Cc: kernel-janitors@vger.kernel.org, alsa-devel@alsa-project.org, Wei Yongjun <weiyongjun1@huawei.com>, linux-kernel@vger.kernel.org

Using devm_snd_soc_register_component() can make the code
shorter and cleaner.

Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 sound/soc/codecs/rt5677-spi.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/sound/soc/codecs/rt5677-spi.c b/sound/soc/codecs/rt5677-spi.c
index 3f40d2751833..7bfade8b3d6e 100644
--- a/sound/soc/codecs/rt5677-spi.c
+++ b/sound/soc/codecs/rt5677-spi.c
@@ -605,20 +605,15 @@ static int rt5677_spi_probe(struct spi_device *spi)
 
 	g_spi = spi;
 
-	ret = snd_soc_register_component(&spi->dev, &rt5677_spi_dai_component,
-					 &rt5677_spi_dai, 1);
+	ret = devm_snd_soc_register_component(&spi->dev,
+					      &rt5677_spi_dai_component,
+					      &rt5677_spi_dai, 1);
 	if (ret < 0)
 		dev_err(&spi->dev, "Failed to register component.\n");
 
 	return ret;
 }
 
-static int rt5677_spi_remove(struct spi_device *spi)
-{
-	snd_soc_unregister_component(&spi->dev);
-	return 0;
-}
-
 static const struct acpi_device_id rt5677_spi_acpi_id[] = {
 	{ "RT5677AA", 0 },
 	{ }
@@ -631,7 +626,6 @@ static struct spi_driver rt5677_spi_driver = {
 		.acpi_match_table = ACPI_PTR(rt5677_spi_acpi_id),
 	},
 	.probe = rt5677_spi_probe,
-	.remove = rt5677_spi_remove,
 };
 module_spi_driver(rt5677_spi_driver);
 
