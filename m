From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Tue, 28 Apr 2020 11:07:42 +0000
Subject: [PATCH -next] ASoC: tegra: tegra_wm8903: Use devm_snd_soc_register_card()
Message-Id: <20200428110742.110335-1-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Thierry
 Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-tegra@vger.kernel.org, kernel-janitors@vger.kernel.org, alsa-devel@alsa-project.org, Wei Yongjun <weiyongjun1@huawei.com>

Using devm_snd_soc_register_card() can make the code
shorter and cleaner.

Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 sound/soc/tegra/tegra_wm8903.c | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/sound/soc/tegra/tegra_wm8903.c b/sound/soc/tegra/tegra_wm8903.c
index 7bf159965c4d..d3ead0213cef 100644
--- a/sound/soc/tegra/tegra_wm8903.c
+++ b/sound/soc/tegra/tegra_wm8903.c
@@ -351,9 +351,9 @@ static int tegra_wm8903_driver_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	ret = snd_soc_register_card(card);
+	ret = devm_snd_soc_register_card(&pdev->dev, card);
 	if (ret) {
-		dev_err(&pdev->dev, "snd_soc_register_card failed (%d)\n",
+		dev_err(&pdev->dev, "devm_snd_soc_register_card failed (%d)\n",
 			ret);
 		return ret;
 	}
@@ -361,15 +361,6 @@ static int tegra_wm8903_driver_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int tegra_wm8903_driver_remove(struct platform_device *pdev)
-{
-	struct snd_soc_card *card = platform_get_drvdata(pdev);
-
-	snd_soc_unregister_card(card);
-
-	return 0;
-}
-
 static const struct of_device_id tegra_wm8903_of_match[] = {
 	{ .compatible = "nvidia,tegra-audio-wm8903", },
 	{},
@@ -382,7 +373,6 @@ static struct platform_driver tegra_wm8903_driver = {
 		.of_match_table = tegra_wm8903_of_match,
 	},
 	.probe = tegra_wm8903_driver_probe,
-	.remove = tegra_wm8903_driver_remove,
 };
 module_platform_driver(tegra_wm8903_driver);
