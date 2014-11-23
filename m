From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sun, 23 Nov 2014 13:11:18 +0000
Subject: [PATCH 5/5] drivers/gpu/drm: fix error return code
Message-Id: <1416748278-22881-6-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1416748278-22881-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1416748278-22881-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Airlie <airlied@linux.ie>
Cc: kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>

Return a negative error code on failure.

A simplified version of the semantic match that finds this problem is as
follows: (http://coccinelle.lip6.fr/)

// <smpl>
@@
identifier ret; expression e1,e2;
@@
(
if (\(ret < 0\|ret != 0\))
 { ... return ret; }
|
ret = 0
)
... when != ret = e1
    when != &ret
*if(...)
{
  ... when != ret = e2
      when forall
 return ret;
}
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/gpu/drm/gma500/psb_drv.c         |    8 ++++++--
 drivers/gpu/drm/omapdrm/omap_dmm_tiler.c |    1 +
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/gma500/psb_drv.c b/drivers/gpu/drm/gma500/psb_drv.c
index 6ec3a90..e405414 100644
--- a/drivers/gpu/drm/gma500/psb_drv.c
+++ b/drivers/gpu/drm/gma500/psb_drv.c
@@ -306,12 +306,16 @@ static int psb_driver_load(struct drm_device *dev, unsigned long flags)
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
diff --git a/drivers/gpu/drm/omapdrm/omap_dmm_tiler.c b/drivers/gpu/drm/omapdrm/omap_dmm_tiler.c
index 56c6055..c0fb5fa 100644
--- a/drivers/gpu/drm/omapdrm/omap_dmm_tiler.c
+++ b/drivers/gpu/drm/omapdrm/omap_dmm_tiler.c
@@ -678,6 +678,7 @@ static int omap_dmm_probe(struct platform_device *dev)
 				&omap_dmm->refill_pa, GFP_KERNEL);
 	if (!omap_dmm->refill_va) {
 		dev_err(&dev->dev, "could not allocate refill memory\n");
+		ret = -ENOMEM;
 		goto fail;
 	}
 

