From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 15 Jun 2020 11:27:54 +0000
Subject: [PATCH] drm/vc4: Fix an error code vc4_create_object()
Message-Id: <20200615112754.GB1207669@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Eric Anholt <eric@anholt.net>
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org

The vc4_create_object() needs to return NULL on error, not error
pointers.  If it returns an error pointer then that will lead to an
Oops in the callers.  Fortunately, in current kernels small allocations
always succed so this will never happen.

Fixes: c826a6e10644 ("drm/vc4: Add a BO cache.")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/gpu/drm/vc4/vc4_bo.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_bo.c b/drivers/gpu/drm/vc4/vc4_bo.c
index 72d30d90b856c..0af246a5609ca 100644
--- a/drivers/gpu/drm/vc4/vc4_bo.c
+++ b/drivers/gpu/drm/vc4/vc4_bo.c
@@ -389,7 +389,7 @@ struct drm_gem_object *vc4_create_object(struct drm_device *dev, size_t size)
 
 	bo = kzalloc(sizeof(*bo), GFP_KERNEL);
 	if (!bo)
-		return ERR_PTR(-ENOMEM);
+		return NULL;
 
 	bo->madv = VC4_MADV_WILLNEED;
 	refcount_set(&bo->usecnt, 0);
-- 
2.26.2
