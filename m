From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 17 Apr 2015 12:24:08 +0000
Subject: [patch] drm/gma500: missing error codes in psb_driver_load()
Message-Id: <20150417122408.GA19623@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Airlie <airlied@linux.ie>
Cc: Thierry Reding <treding@nvidia.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org, Benoit Taine <benoit.taine@lip6.fr>, Dave Airlie <airlied@redhat.com>

We should return an error code here.  In the current code they can only
fail if there is an allocation error so -ENOMEM is appropriate.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpu/drm/gma500/psb_drv.c b/drivers/gpu/drm/gma500/psb_drv.c
index 92e7e57..4eff0d6 100644
--- a/drivers/gpu/drm/gma500/psb_drv.c
+++ b/drivers/gpu/drm/gma500/psb_drv.c
@@ -326,12 +326,16 @@ static int psb_driver_load(struct drm_device *dev, unsigned long flags)
 		goto out_err;
 
 	dev_priv->mmu = psb_mmu_driver_init(dev, 1, 0, 0);
-	if (!dev_priv->mmu)
+	if (!dev_priv->mmu) {
+		ret = -ENOMEM;
 		goto out_err;
+	}
 
 	dev_priv->pf_pd = psb_mmu_alloc_pd(dev_priv->mmu, 1, 0);
-	if (!dev_priv->pf_pd)
+	if (!dev_priv->pf_pd) {
+		ret = -ENOMEM;
 		goto out_err;
+	}
 
 	ret = psb_do_init(dev);
 	if (ret)
