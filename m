From: Colin King <colin.king@canonical.com>
Date: Mon, 09 Nov 2020 11:12:25 +0000
Subject: [PATCH][next] drm/kmb: fix spelling mistakes in drm_info and drm_dbg messages
Message-Id: <20201109111225.1485190-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Anitha Chrisanthus <anitha.chrisanthus@intel.com>, Edmund Dea <edmund.j.dea@intel.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There are two spelling mistakes of the word sync in drm_info
and drm_dbg messages. Fix these.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/kmb/kmb_crtc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/kmb/kmb_crtc.c b/drivers/gpu/drm/kmb/kmb_crtc.c
index dd54b03f7f84..44327bc629ca 100644
--- a/drivers/gpu/drm/kmb/kmb_crtc.c
+++ b/drivers/gpu/drm/kmb/kmb_crtc.c
@@ -77,7 +77,7 @@ static void kmb_crtc_set_mode(struct drm_crtc *crtc)
 	/* Initialize mipi */
 	kmb_dsi_mode_set(kmb->kmb_dsi, m, kmb->sys_clk_mhz);
 	drm_info(dev,
-		 "vfp= %d vbp= %d vsyc_len=%d hfp=%d hbp=%d hsync_len=%d\n",
+		 "vfp= %d vbp= %d vsync_len=%d hfp=%d hbp=%d hsync_len=%d\n",
 		 m->crtc_vsync_start - m->crtc_vdisplay,
 		 m->crtc_vtotal - m->crtc_vsync_end,
 		 m->crtc_vsync_end - m->crtc_vsync_start,
@@ -94,7 +94,7 @@ static void kmb_crtc_set_mode(struct drm_crtc *crtc)
 	vm.hback_porch = 0;
 	vm.hsync_len = 28;
 
-	drm_dbg(dev, "%s : %dactive height= %d vbp=%d vfp=%d vsync-w=%d h-active=%d h-bp=%d h-fp=%d hysnc-l=%d",
+	drm_dbg(dev, "%s : %dactive height= %d vbp=%d vfp=%d vsync-w=%d h-active=%d h-bp=%d h-fp=%d hsync-l=%d",
 		__func__, __LINE__,
 			m->crtc_vdisplay, vm.vback_porch, vm.vfront_porch,
 			vm.vsync_len, m->crtc_hdisplay, vm.hback_porch,
-- 
2.28.0
