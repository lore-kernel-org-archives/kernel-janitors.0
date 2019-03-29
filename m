From: YueHaibing <yuehaibing@huawei.com>
Date: Fri, 29 Mar 2019 01:41:36 +0000
Subject: [PATCH -next] drm/omap: Use PTR_ERR_OR_ZERO in hdmi4_core_init()
Message-Id: <20190329014136.20318-1-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tomi Valkeinen <tomi.valkeinen@ti.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Sean Paul <seanpaul@chromium.org>, Peter Ujfalusi <peter.ujfalusi@ti.com>, Matteo Croce <mcroce@redhat.com>, Benoit Parrot <bparrot@ti.com>
Cc: YueHaibing <yuehaibing@huawei.com>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Use PTR_ERR_OR_ZERO rather than if(IS_ERR(...)) + PTR_ERR

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/gpu/drm/omapdrm/dss/hdmi4_core.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/hdmi4_core.c b/drivers/gpu/drm/omapdrm/dss/hdmi4_core.c
index e384b95ad857..8287ade5ece0 100644
--- a/drivers/gpu/drm/omapdrm/dss/hdmi4_core.c
+++ b/drivers/gpu/drm/omapdrm/dss/hdmi4_core.c
@@ -934,8 +934,5 @@ int hdmi4_core_init(struct platform_device *pdev, struct hdmi_core_data *core)
 
 	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "core");
 	core->base = devm_ioremap_resource(&pdev->dev, res);
-	if (IS_ERR(core->base))
-		return PTR_ERR(core->base);
-
-	return 0;
+	return PTR_ERR_OR_ZERO(core->base);
 }
