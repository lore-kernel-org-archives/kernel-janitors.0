From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Wed, 06 May 2020 14:13:17 +0000
Subject: [PATCH -next] soc: mediatek: Missing platform_device_unregister() on error in mtk_mmsys_probe()
Message-Id: <20200506141317.119537-1-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matthias Brugger <matthias.bgg@gmail.com>, Enric Balletbo i Serra <enric.balletbo@collabora.com>
Cc: linux-mediatek@lists.infradead.org, kernel-janitors@vger.kernel.org, Wei Yongjun <weiyongjun1@huawei.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org

Add the missing platform_device_unregister() before return
from mtk_mmsys_probe() in the error handling case.

Fixes: 667c769246b0 ("soc / drm: mediatek: Fix mediatek-drm device probing")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/soc/mediatek/mtk-mmsys.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
index 05e322c9c301..05ce4cb464b0 100644
--- a/drivers/soc/mediatek/mtk-mmsys.c
+++ b/drivers/soc/mediatek/mtk-mmsys.c
@@ -312,8 +312,10 @@ static int mtk_mmsys_probe(struct platform_device *pdev)
 
 	drm = platform_device_register_data(&pdev->dev, "mediatek-drm",
 					    PLATFORM_DEVID_AUTO, NULL, 0);
-	if (IS_ERR(drm))
+	if (IS_ERR(drm)) {
+		platform_device_unregister(clks);
 		return PTR_ERR(drm);
+	}
 
 	return 0;
 }
