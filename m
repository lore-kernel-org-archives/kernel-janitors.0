From: YueHaibing <yuehaibing@huawei.com>
Date: Wed, 10 Oct 2018 12:51:38 +0000
Subject: [PATCH -next] drm: Use PTR_ERR_OR_ZERO in drm_fb_cma_fbdev_init()
Message-Id: <1539176563-144779-1-git-send-email-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Gustavo Padovan <gustavo@padovan.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>
Cc: YueHaibing <yuehaibing@huawei.com>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Use PTR_ERR_OR_ZERO rather than if(IS_ERR(...)) + PTR_ERR

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/gpu/drm/drm_fb_cma_helper.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_fb_cma_helper.c b/drivers/gpu/drm/drm_fb_cma_helper.c
index fb0dfc6..30741eb 100644
--- a/drivers/gpu/drm/drm_fb_cma_helper.c
+++ b/drivers/gpu/drm/drm_fb_cma_helper.c
@@ -124,10 +124,7 @@ int drm_fb_cma_fbdev_init(struct drm_device *dev, unsigned int preferred_bpp,
 
 	/* dev->fb_helper will indirectly point to fbdev_cma after this call */
 	fbdev_cma = drm_fbdev_cma_init(dev, preferred_bpp, max_conn_count);
-	if (IS_ERR(fbdev_cma))
-		return PTR_ERR(fbdev_cma);
-
-	return 0;
+	return PTR_ERR_OR_ZERO(fbdev_cma);
 }
 EXPORT_SYMBOL_GPL(drm_fb_cma_fbdev_init);
 
