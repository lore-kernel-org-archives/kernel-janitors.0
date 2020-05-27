From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Wed, 27 May 2020 02:57:37 +0000
Subject: [PATCH -next] ASoC: mmp-sspa: Fix return value check in asoc_mmp_sspa_probe()
Message-Id: <20200527030210.124393-1-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, Liam
 Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav
 Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: kernel-janitors@vger.kernel.org, alsa-devel@alsa-project.org, Wei Yongjun <weiyongjun1@huawei.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org

In case of error, the function devm_ioremap() returns NULL pointer not
ERR_PTR(). The IS_ERR() test in the return value check should be
replaced with NULL test.

Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 sound/soc/pxa/mmp-sspa.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/pxa/mmp-sspa.c b/sound/soc/pxa/mmp-sspa.c
index 3e37ab625f8d..4255851c71c1 100644
--- a/sound/soc/pxa/mmp-sspa.c
+++ b/sound/soc/pxa/mmp-sspa.c
@@ -493,13 +493,13 @@ static int asoc_mmp_sspa_probe(struct platform_device *pdev)
 			return -ENODEV;
 
 		sspa->rx_base = devm_ioremap(&pdev->dev, res->start, 0x30);
-		if (IS_ERR(sspa->rx_base))
-			return PTR_ERR(sspa->rx_base);
+		if (!sspa->rx_base)
+			return -ENOMEM;
 
 		sspa->tx_base = devm_ioremap(&pdev->dev,
 					     res->start + 0x80, 0x30);
-		if (IS_ERR(sspa->tx_base))
-			return PTR_ERR(sspa->tx_base);
+		if (!sspa->tx_base)
+			return -ENOMEM;
 
 		sspa->clk = devm_clk_get(&pdev->dev, NULL);
 		if (IS_ERR(sspa->clk))
