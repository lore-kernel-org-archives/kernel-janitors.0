From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 10 Sep 2020 10:07:48 +0000
Subject: [PATCH] drm/vc4: hdmi: Fix off by ones in vc4_hdmi_read/write()
Message-Id: <20200910100748.GA79916@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Eric Anholt <eric@anholt.duckdns.org>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>, David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org, Maxime Ripard <maxime@cerno.tech>

The variant->registers[] has ->num_registers elements so the >
comparison needs to be changes to >= to prevent an out of bounds
access.

Fixes: 311e305fdb4e ("drm/vc4: hdmi: Implement a register layout abstraction")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/gpu/drm/vc4/vc4_hdmi_regs.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi_regs.h b/drivers/gpu/drm/vc4/vc4_hdmi_regs.h
index a5f1354e3e06..47364bd3960d 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi_regs.h
+++ b/drivers/gpu/drm/vc4/vc4_hdmi_regs.h
@@ -398,7 +398,7 @@ static inline u32 vc4_hdmi_read(struct vc4_hdmi *hdmi,
 	const struct vc4_hdmi_variant *variant = hdmi->variant;
 	void __iomem *base;
 
-	if (reg > variant->num_registers) {
+	if (reg >= variant->num_registers) {
 		dev_warn(&hdmi->pdev->dev,
 			 "Invalid register ID %u\n", reg);
 		return 0;
@@ -424,7 +424,7 @@ static inline void vc4_hdmi_write(struct vc4_hdmi *hdmi,
 	const struct vc4_hdmi_variant *variant = hdmi->variant;
 	void __iomem *base;
 
-	if (reg > variant->num_registers) {
+	if (reg >= variant->num_registers) {
 		dev_warn(&hdmi->pdev->dev,
 			 "Invalid register ID %u\n", reg);
 		return;
-- 
2.28.0
