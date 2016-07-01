From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 01 Jul 2016 13:59:34 +0000
Subject: [patch] drm/mediatek/mtk_mipi_tx: checking the wrong variable
Message-Id: <20160701135934.GA15723@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Airlie <airlied@linux.ie>, CK Hu <ck.hu@mediatek.com>
Cc: Jitao Shi <jitao.shi@mediatek.com>, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>

We should be checking "phy_provider" here not "phy".

Fixes: 2e54c14e310f ('drm/mediatek: Add DSI sub driver')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpu/drm/mediatek/mtk_mipi_tx.c b/drivers/gpu/drm/mediatek/mtk_mipi_tx.c
index cf8f38d..1c366f8 100644
--- a/drivers/gpu/drm/mediatek/mtk_mipi_tx.c
+++ b/drivers/gpu/drm/mediatek/mtk_mipi_tx.c
@@ -431,7 +431,7 @@ static int mtk_mipi_tx_probe(struct platform_device *pdev)
 	phy_set_drvdata(phy, mipi_tx);
 
 	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
-	if (IS_ERR(phy)) {
+	if (IS_ERR(phy_provider)) {
 		ret = PTR_ERR(phy_provider);
 		return ret;
 	}
