From: Colin King <colin.king@canonical.com>
Date: Fri, 17 Nov 2017 18:49:56 +0000
Subject: [PATCH] omapdrm: hdmi4_cec: fix unsigned int comparison with less than zero
Message-Id: <20171117184956.3092-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tomi Valkeinen <tomi.valkeinen@ti.com>, David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The two comparisons of the unsigned int ret for -ve error returns is
always false because ret is unsigned. Fix this by making ret a signed
int.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/omapdrm/dss/hdmi4_cec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/hdmi4_cec.c b/drivers/gpu/drm/omapdrm/dss/hdmi4_cec.c
index d86873f2abe6..e626eddf24d5 100644
--- a/drivers/gpu/drm/omapdrm/dss/hdmi4_cec.c
+++ b/drivers/gpu/drm/omapdrm/dss/hdmi4_cec.c
@@ -352,7 +352,7 @@ int hdmi4_cec_init(struct platform_device *pdev, struct hdmi_core_data *core,
 {
 	const u32 caps = CEC_CAP_TRANSMIT | CEC_CAP_LOG_ADDRS |
 			 CEC_CAP_PASSTHROUGH | CEC_CAP_RC;
-	unsigned int ret;
+	int ret;
 
 	core->adap = cec_allocate_adapter(&hdmi_cec_adap_ops, core,
 		"omap4", caps, CEC_MAX_LOG_ADDRS);
-- 
2.14.1

