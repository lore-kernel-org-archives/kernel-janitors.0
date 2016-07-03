From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sun, 03 Jul 2016 05:37:08 +0000
Subject: [PATCH] drm/mediatek: fix error handling
Message-Id: <1467524228-12546-1-git-send-email-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: airlied@linux.ie, matthias.bgg@gmail.com, ck.hu@mediatek.com
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

This is likely that checking 'phy_provider' instead of 'phy' is
expected here.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/gpu/drm/mediatek/mtk_mipi_tx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

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
-- 
2.7.4

