From: Colin King <colin.king@canonical.com>
Date: Mon, 07 Dec 2020 15:09:37 +0000
Subject: [PATCH][next] drm/mediatek: avoid dereferencing a null hdmi_phy on an error message
Message-Id: <20201207150937.170435-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Chunfeng Yun <chunfeng.yun@mediatek.com>, Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, CK Hu <ck.hu@mediatek.com>, chunhui dai <chunhui.dai@mediatek.com>, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently there is a null pointer check for hdmi_phy that implies it
may be null, however a dev_err messages dereferences this potential null
pointer.  Avoid a null pointer dereference by only emitting the dev_err
message if hdmi_phy is non-null.  It is a moot point if the error message
needs to be printed at all, but since this is a relatively new piece of
code it may be useful to keep the message in for the moment in case there
are unforseen errors that need to be reported.

Addresses-Coverity: ("Dereference after null check")
Fixes: be28b6507c46 ("drm/mediatek: separate hdmi phy to different file")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/phy/mediatek/phy-mtk-hdmi.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/mediatek/phy-mtk-hdmi.c b/drivers/phy/mediatek/phy-mtk-hdmi.c
index c5c61f5a9ea0..5184054783c7 100644
--- a/drivers/phy/mediatek/phy-mtk-hdmi.c
+++ b/drivers/phy/mediatek/phy-mtk-hdmi.c
@@ -84,8 +84,9 @@ mtk_hdmi_phy_dev_get_ops(const struct mtk_hdmi_phy *hdmi_phy)
 	    hdmi_phy->conf->hdmi_phy_disable_tmds)
 		return &mtk_hdmi_phy_dev_ops;
 
-	dev_err(hdmi_phy->dev, "Failed to get dev ops of phy\n");
-		return NULL;
+	if (hdmi_phy)
+		dev_err(hdmi_phy->dev, "Failed to get dev ops of phy\n");
+			return NULL;
 }
 
 static void mtk_hdmi_phy_clk_get_data(struct mtk_hdmi_phy *hdmi_phy,
-- 
2.29.2
