From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 20 Jan 2016 09:53:52 +0000
Subject: [patch] drm: rockchip: signedness bug in dw_mipi_dsi_get_lane_bps()
Message-Id: <20160120095352.GA19898@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mark Yao <mark.yao@rock-chips.com>, Chris Zhong <zyw@rock-chips.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org

"bpp" needs to be signed for the error handling to work.

Fixes: 84e05408fcfe ('drm: rockchip: Support Synopsys DW MIPI DSI')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpu/drm/rockchip/dw-mipi-dsi.c b/drivers/gpu/drm/rockchip/dw-mipi-dsi.c
index 7bfe243..c35e5af 100644
--- a/drivers/gpu/drm/rockchip/dw-mipi-dsi.c
+++ b/drivers/gpu/drm/rockchip/dw-mipi-dsi.c
@@ -461,7 +461,8 @@ static int dw_mipi_dsi_phy_init(struct dw_mipi_dsi *dsi)
 
 static int dw_mipi_dsi_get_lane_bps(struct dw_mipi_dsi *dsi)
 {
-	unsigned int bpp, i, pre;
+	int bpp;
+	unsigned int i, pre;
 	unsigned long mpclk, pllref, tmp;
 	unsigned int m = 1, n = 1, target_mbps = 1000;
 	unsigned int max_mbps = dptdin_map[ARRAY_SIZE(dptdin_map) - 1].max_mbps;
