From: Colin King <colin.king@canonical.com>
Date: Fri, 13 Nov 2020 12:37:45 +0000
Subject: [PATCH][next] drm/kmb: fix potential integer overflow on multiplication
Message-Id: <20201113123745.36799-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Anitha Chrisanthus <anitha.chrisanthus@intel.com>, Edmund Dea <edmund.j.dea@intel.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a potential integer overflow when multiplying various sized
integers that are cast to u32 integers using u32 multiplication and
then assigning the result to a u64. Fix this by casting MIPI_TX_BPP
to a u64 to force the multiplication to use u64 math and hence avoid
any potential overflows.

Addresses-Coverity: ("Unintentional integer overflow")
Fixes: 98521f4d4b4c ("drm/kmb: Mipi DSI part of the display driver")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/kmb/kmb_dsi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/kmb/kmb_dsi.c b/drivers/gpu/drm/kmb/kmb_dsi.c
index 4b5d82af84b3..6c3081356bd9 100644
--- a/drivers/gpu/drm/kmb/kmb_dsi.c
+++ b/drivers/gpu/drm/kmb/kmb_dsi.c
@@ -1369,7 +1369,7 @@ int kmb_dsi_mode_set(struct kmb_dsi *kmb_dsi, struct drm_display_mode *mode,
 	 */
 	data_rate = ((((u32)mode->crtc_vtotal *	(u32)mode->crtc_htotal) *
 			(u32)(drm_mode_vrefresh(mode)) *
-			MIPI_TX_BPP) / mipi_tx_init_cfg.active_lanes) /	1000000;
+			(u64)MIPI_TX_BPP) / mipi_tx_init_cfg.active_lanes) / 1000000;
 
 	dev_dbg(kmb_dsi->dev, "data_rate=%u active_lanes=%d\n",
 		(u32)data_rate, mipi_tx_init_cfg.active_lanes);
-- 
2.28.0
