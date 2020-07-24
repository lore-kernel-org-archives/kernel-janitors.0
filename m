From: Colin King <colin.king@canonical.com>
Date: Fri, 24 Jul 2020 11:12:58 +0000
Subject: [PATCH][next] drm: xln: fix spelling mistake "failes" -> "failed"
Message-Id: <20200724111258.14762-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hyun Kwon <hyun.kwon@xilinx.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Michal Simek <michal.simek@xilinx.com>, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in a dev_dbg messages. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/xlnx/zynqmp_dp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c b/drivers/gpu/drm/xlnx/zynqmp_dp.c
index 821f7a71e182..0e1c818746eb 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
@@ -1308,7 +1308,7 @@ zynqmp_dp_connector_detect(struct drm_connector *connector, bool force)
 		ret = drm_dp_dpcd_read(&dp->aux, 0x0, dp->dpcd,
 				       sizeof(dp->dpcd));
 		if (ret < 0) {
-			dev_dbg(dp->dev, "DPCD read failes");
+			dev_dbg(dp->dev, "DPCD read failed");
 			goto disconnected;
 		}
 
-- 
2.27.0
