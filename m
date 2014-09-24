From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 24 Sep 2014 10:35:41 +0000
Subject: [patch] drm/gma500: some return code fixes
Message-Id: <20140924103541.GA15107@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Airlie <airlied@linux.ie>, Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Cc: "H. Peter Anvin" <hpa@linux.intel.com>, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org

In psb_mmu_insert_pfn_sequence() we set the error code but don't use it
and the caller doesn't check for error either.  I have changed it to
return an error and to check.

In psb_driver_load() there are a couple paths where we don't set an
error code on allocation failure.  I've made those return -ENOMEM.

Fixes: b219372dff81 ('drm/gma500: Make SGX MMU driver actually do something')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
These are static checker things and I have not tested them.  It's always
a little risky adding new error paths which haven't been tested but I
think I have the intent of the code correct.

diff --git a/drivers/gpu/drm/gma500/mmu.c b/drivers/gpu/drm/gma500/mmu.c
index 0eaf11c..0caec4e 100644
--- a/drivers/gpu/drm/gma500/mmu.c
+++ b/drivers/gpu/drm/gma500/mmu.c
@@ -667,7 +667,7 @@ int psb_mmu_insert_pfn_sequence(struct psb_mmu_pd *pd, uint32_t start_pfn,
 	unsigned long end;
 	unsigned long next;
 	unsigned long f_address = address;
-	int ret = -ENOMEM;
+	int ret;
 
 	down_read(&pd->driver->sem);
 
@@ -700,7 +700,7 @@ out:
 	if (pd->hw_context != -1)
 		psb_mmu_flush(pd->driver);
 
-	return 0;
+	return ret;
 }
 
 int psb_mmu_insert_pages(struct psb_mmu_pd *pd, struct page **pages,
diff --git a/drivers/gpu/drm/gma500/psb_drv.c b/drivers/gpu/drm/gma500/psb_drv.c
index 6ec3a90..f22c6b4d4 100644
--- a/drivers/gpu/drm/gma500/psb_drv.c
+++ b/drivers/gpu/drm/gma500/psb_drv.c
@@ -294,7 +294,6 @@ static int psb_driver_load(struct drm_device *dev, unsigned long flags)
 	gma_power_init(dev);
 
 	ret = -ENOMEM;
-
 	dev_priv->scratch_page = alloc_page(GFP_DMA32 | __GFP_ZERO);
 	if (!dev_priv->scratch_page)
 		goto out_err;
@@ -305,6 +304,7 @@ static int psb_driver_load(struct drm_device *dev, unsigned long flags)
 	if (ret)
 		goto out_err;
 
+	ret = -ENOMEM;
 	dev_priv->mmu = psb_mmu_driver_init(dev, 1, 0, 0);
 	if (!dev_priv->mmu)
 		goto out_err;
@@ -324,6 +324,8 @@ static int psb_driver_load(struct drm_device *dev, unsigned long flags)
 					  pg->gatt_start,
 					  pg->stolen_size >> PAGE_SHIFT, 0);
 	up_read(&pg->sem);
+	if (ret)
+		goto out_err;
 
 	psb_mmu_set_pd_context(psb_mmu_get_default_pd(dev_priv->mmu), 0);
 	psb_mmu_set_pd_context(dev_priv->pf_pd, 1);
