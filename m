From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 19 Jul 2018 08:11:33 +0000
Subject: [PATCH] drm/xen-front: Fix error code in xen_drm_front_gem_get_sg_table()
Message-Id: <20180719081133.k7asay4fl2qhhpjf@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org, xen-devel@lists.xen.org

The xen_drm_front_gem_get_sg_table() function is supposed to return
error pointer.  The current code, would trigger a NULL dereference in
drm_gem_map_dma_buf().

Fixes: c575b7eeb89f ("drm/xen-front: Add support for Xen PV display frontend")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpu/drm/xen/xen_drm_front_gem.c b/drivers/gpu/drm/xen/xen_drm_front_gem.c
index c85bfe7571cb..4507bc03ed8f 100644
--- a/drivers/gpu/drm/xen/xen_drm_front_gem.c
+++ b/drivers/gpu/drm/xen/xen_drm_front_gem.c
@@ -179,7 +179,7 @@ struct sg_table *xen_drm_front_gem_get_sg_table(struct drm_gem_object *gem_obj)
 	struct xen_gem_object *xen_obj = to_xen_gem_obj(gem_obj);
 
 	if (!xen_obj->pages)
-		return NULL;
+		return ERR_PTR(-EINVAL);
 
 	return drm_prime_pages_to_sg(xen_obj->pages, xen_obj->num_pages);
 }
