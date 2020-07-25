From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Sat, 25 Jul 2020 06:34:29 +0000
Subject: [PATCH -next] drm: xlnx: Fix typo in parameter description
Message-Id: <20200725063429.172139-1-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hyun Kwon <hyun.kwon@xilinx.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Michal Simek <michal.simek@xilinx.com>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Hulk Robot <hulkci@huawei.com>, Wei Yongjun <weiyongjun1@huawei.com>, linux-arm-kernel@lists.infradead.org

Fix typo in parameter description.

Fixes: d76271d22694 ("drm: xlnx: DRM/KMS driver for Xilinx ZynqMP DisplayPort Subsystem")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/gpu/drm/xlnx/zynqmp_dp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c b/drivers/gpu/drm/xlnx/zynqmp_dp.c
index 821f7a71e182..3d53638ab15e 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
@@ -44,7 +44,7 @@ MODULE_PARM_DESC(aux_timeout_ms, "DP aux timeout value in msec (default: 50)");
  */
 static uint zynqmp_dp_power_on_delay_ms = 4;
 module_param_named(power_on_delay_ms, zynqmp_dp_power_on_delay_ms, uint, 0444);
-MODULE_PARM_DESC(aux_timeout_ms, "DP power on delay in msec (default: 4)");
+MODULE_PARM_DESC(power_on_delay_ms, "DP power on delay in msec (default: 4)");
 
 /* Link configuration registers */
 #define ZYNQMP_DP_LINK_BW_SET				0x0
