From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 02 Apr 2016 05:42:24 +0000
Subject: [patch] drm: ARM HDLCD - fix an error code
Message-Id: <20160402054224.GA19162@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Liviu Dudau <liviu.dudau@arm.com>, Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org

We accidentally return PTR_ERR(NULL) which is success instead of a
negative error code.

Fixes: 879e40bea6f2 ('drm: ARM HDLCD - get rid of devm_clk_put()')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpu/drm/arm/hdlcd_drv.c b/drivers/gpu/drm/arm/hdlcd_drv.c
index 734849f..3ac1ae4 100644
--- a/drivers/gpu/drm/arm/hdlcd_drv.c
+++ b/drivers/gpu/drm/arm/hdlcd_drv.c
@@ -55,8 +55,9 @@ static int hdlcd_load(struct drm_device *drm, unsigned long flags)
 	hdlcd->mmio = devm_ioremap_resource(drm->dev, res);
 	if (IS_ERR(hdlcd->mmio)) {
 		DRM_ERROR("failed to map control registers area\n");
+		ret = PTR_ERR(hdlcd->mmio);
 		hdlcd->mmio = NULL;
-		return PTR_ERR(hdlcd->mmio);
+		return ret;
 	}
 
 	version = hdlcd_read(hdlcd, HDLCD_REG_VERSION);
