From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 20 Mar 2020 13:23:34 +0000
Subject: [PATCH] drm/gem: Fix a leak in drm_gem_objects_lookup()
Message-Id: <20200320132334.GC95012@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Rob Herring <robh@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org

If the "handles" allocation or the copy_from_user() fails then we leak
"objs".  It's supposed to be freed in panfrost_job_cleanup().

Fixes: c117aa4d8701 ("drm: Add a drm_gem_objects_lookup helper")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/gpu/drm/drm_gem.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index a9e4a610445a..f28724f2eb69 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -710,6 +710,8 @@ int drm_gem_objects_lookup(struct drm_file *filp, void __user *bo_handles,
 	if (!objs)
 		return -ENOMEM;
 
+	*objs_out = objs;
+
 	handles = kvmalloc_array(count, sizeof(u32), GFP_KERNEL);
 	if (!handles) {
 		ret = -ENOMEM;
@@ -723,8 +725,6 @@ int drm_gem_objects_lookup(struct drm_file *filp, void __user *bo_handles,
 	}
 
 	ret = objects_lookup(filp, handles, count, objs);
-	*objs_out = objs;
-
 out:
 	kvfree(handles);
 	return ret;
-- 
2.25.1
