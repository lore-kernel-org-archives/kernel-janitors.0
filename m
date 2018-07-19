From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 19 Jul 2018 08:12:01 +0000
Subject: [PATCH] drm/cma-helper: NULL dereference calling drm_gem_cma_prime_get_sg_table()
Message-Id: <20180719081200.63xibytp4esvmg4z@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Gustavo Padovan <gustavo@padovan.org>, Joonyoung Shim <jy0922.shim@samsung.com>
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org

This funciton is only called from drm_gem_map_dma_buf().  It's supposed
to return error pointers on failure and returning a NULL pointer will
lead to a NULL dereference.

Fixes: 78467dc5f70f ("drm/cma: add low-level hook functions to use prime helpers")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpu/drm/drm_gem_cma_helper.c b/drivers/gpu/drm/drm_gem_cma_helper.c
index 80a5115c3846..f8a9c09efb87 100644
--- a/drivers/gpu/drm/drm_gem_cma_helper.c
+++ b/drivers/gpu/drm/drm_gem_cma_helper.c
@@ -436,7 +436,7 @@ struct sg_table *drm_gem_cma_prime_get_sg_table(struct drm_gem_object *obj)
 
 	sgt = kzalloc(sizeof(*sgt), GFP_KERNEL);
 	if (!sgt)
-		return NULL;
+		return ERR_PTR(-EINVAL);
 
 	ret = dma_get_sgtable(obj->dev->dev, sgt, cma_obj->vaddr,
 			      cma_obj->paddr, obj->size);
@@ -447,7 +447,7 @@ struct sg_table *drm_gem_cma_prime_get_sg_table(struct drm_gem_object *obj)
 
 out:
 	kfree(sgt);
-	return NULL;
+	return ERR_PTR(ret);
 }
 EXPORT_SYMBOL_GPL(drm_gem_cma_prime_get_sg_table);
 
