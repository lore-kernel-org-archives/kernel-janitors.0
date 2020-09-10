From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 10 Sep 2020 10:08:25 +0000
Subject: [PATCH] drm/vc4: hdmi: Fix NULL vs IS_ERR() checks in vc5_hdmi_init_resources()
Message-Id: <20200910100825.GC79916@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Eric Anholt <eric@anholt.duckdns.org>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>, David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org, Maxime Ripard <maxime@cerno.tech>

The devm_ioremap() function never returns error pointers, it returns
NULL.

Fixes: 8323989140f3 ("drm/vc4: hdmi: Support the BCM2711 HDMI controllers")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index d0792915436c..03825596a308 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -1545,64 +1545,64 @@ static int vc5_hdmi_init_resources(struct vc4_hdmi *vc4_hdmi)
 
 	vc4_hdmi->hdmicore_regs = devm_ioremap(dev, res->start,
 					       resource_size(res));
-	if (IS_ERR(vc4_hdmi->hdmicore_regs))
-		return PTR_ERR(vc4_hdmi->hdmicore_regs);
+	if (!vc4_hdmi->hdmicore_regs)
+		return -ENOMEM;
 
 	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "hd");
 	if (!res)
 		return -ENODEV;
 
 	vc4_hdmi->hd_regs = devm_ioremap(dev, res->start, resource_size(res));
-	if (IS_ERR(vc4_hdmi->hd_regs))
-		return PTR_ERR(vc4_hdmi->hd_regs);
+	if (!vc4_hdmi->hd_regs)
+		return -ENOMEM;
 
 	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "cec");
 	if (!res)
 		return -ENODEV;
 
 	vc4_hdmi->cec_regs = devm_ioremap(dev, res->start, resource_size(res));
-	if (IS_ERR(vc4_hdmi->cec_regs))
-		return PTR_ERR(vc4_hdmi->cec_regs);
+	if (!vc4_hdmi->cec_regs)
+		return -ENOMEM;
 
 	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "csc");
 	if (!res)
 		return -ENODEV;
 
 	vc4_hdmi->csc_regs = devm_ioremap(dev, res->start, resource_size(res));
-	if (IS_ERR(vc4_hdmi->csc_regs))
-		return PTR_ERR(vc4_hdmi->csc_regs);
+	if (!vc4_hdmi->csc_regs)
+		return -ENOMEM;
 
 	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "dvp");
 	if (!res)
 		return -ENODEV;
 
 	vc4_hdmi->dvp_regs = devm_ioremap(dev, res->start, resource_size(res));
-	if (IS_ERR(vc4_hdmi->dvp_regs))
-		return PTR_ERR(vc4_hdmi->dvp_regs);
+	if (!vc4_hdmi->dvp_regs)
+		return -ENOMEM;
 
 	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "phy");
 	if (!res)
 		return -ENODEV;
 
 	vc4_hdmi->phy_regs = devm_ioremap(dev, res->start, resource_size(res));
-	if (IS_ERR(vc4_hdmi->phy_regs))
-		return PTR_ERR(vc4_hdmi->phy_regs);
+	if (!vc4_hdmi->phy_regs)
+		return -ENOMEM;
 
 	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "packet");
 	if (!res)
 		return -ENODEV;
 
 	vc4_hdmi->ram_regs = devm_ioremap(dev, res->start, resource_size(res));
-	if (IS_ERR(vc4_hdmi->ram_regs))
-		return PTR_ERR(vc4_hdmi->ram_regs);
+	if (!vc4_hdmi->ram_regs)
+		return -ENOMEM;
 
 	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "rm");
 	if (!res)
 		return -ENODEV;
 
 	vc4_hdmi->rm_regs = devm_ioremap(dev, res->start, resource_size(res));
-	if (IS_ERR(vc4_hdmi->rm_regs))
-		return PTR_ERR(vc4_hdmi->rm_regs);
+	if (!vc4_hdmi->rm_regs)
+		return -ENOMEM;
 
 	vc4_hdmi->hsm_clock = devm_clk_get(dev, "hdmi");
 	if (IS_ERR(vc4_hdmi->hsm_clock)) {
-- 
2.28.0
