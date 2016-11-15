From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 15 Nov 2016 09:53:01 +0000
Subject: [patch] drm: zte: checking for NULL instead of IS_ERR()
Message-Id: <20161115095301.GC15424@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Shawn Guo <shawnguo@kernel.org>
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org

drm_dev_alloc() never returns NULL, it only returns error pointers on
error.

Fixes: 0a886f59528a ("drm: zte: add initial vou drm driver")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpu/drm/zte/zx_drm_drv.c b/drivers/gpu/drm/zte/zx_drm_drv.c
index abc8099..3e76f72 100644
--- a/drivers/gpu/drm/zte/zx_drm_drv.c
+++ b/drivers/gpu/drm/zte/zx_drm_drv.c
@@ -107,8 +107,8 @@ static int zx_drm_bind(struct device *dev)
 		return -ENOMEM;
 
 	drm = drm_dev_alloc(&zx_drm_driver, dev);
-	if (!drm)
-		return -ENOMEM;
+	if (IS_ERR(drm))
+		return PTR_ERR(drm);
 
 	drm->dev_private = priv;
 	dev_set_drvdata(dev, drm);
