From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Wed, 08 Jan 2020 03:59:54 +0000
Subject: [PATCH -next]  ASoC: amd: acp3x: Fix return value check in acp3x_dai_probe()
Message-Id: <20200108035954.51317-1-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Ravulapati
 Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>
Cc: kernel-janitors@vger.kernel.org, alsa-devel@alsa-project.org, Wei Yongjun <weiyongjun1@huawei.com>, linux-kernel@vger.kernel.org

In case of error, the function devm_ioremap() returns NULL pointer not
ERR_PTR(). The IS_ERR() test in the return value check should be
replaced with NULL test.

Fixes: c9fe7db6e884 ("ASoC: amd: Refactoring of DAI from DMA driver")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 sound/soc/amd/raven/acp3x-i2s.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/amd/raven/acp3x-i2s.c b/sound/soc/amd/raven/acp3x-i2s.c
index d9b287b8396c..bf51cadf8682 100644
--- a/sound/soc/amd/raven/acp3x-i2s.c
+++ b/sound/soc/amd/raven/acp3x-i2s.c
@@ -321,8 +321,8 @@ static int acp3x_dai_probe(struct platform_device *pdev)
 	}
 	adata->acp3x_base = devm_ioremap(&pdev->dev, res->start,
 						resource_size(res));
-	if (IS_ERR(adata->acp3x_base))
-		return PTR_ERR(adata->acp3x_base);
+	if (!adata->acp3x_base)
+		return -ENOMEM;
 
 	adata->i2s_irq = res->start;
 	dev_set_drvdata(&pdev->dev, adata);
