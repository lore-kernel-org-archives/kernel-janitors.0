From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 10 Jul 2017 07:20:42 +0000
Subject: [PATCH] drm/msm: unlock on error in msm_gem_get_iova()
Message-Id: <20170710072042.fs7ovvp5ufyg5hn3@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rob Clark <robdclark@gmail.com>, Sushmita Susheelendra <ssusheel@codeaurora.org>
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, kernel-janitors@vger.kernel.org

We recently added locking to this function but there was a direct return
that was overlooked where we need to unlock.

Fixes: 0e08270a1f01 ("drm/msm: Separate locking of buffer resources from struct_mutex")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 65f35544c1ec..065d933df2c3 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -383,8 +383,10 @@ int msm_gem_get_iova(struct drm_gem_object *obj,
 		struct page **pages;
 
 		vma = add_vma(obj, aspace);
-		if (IS_ERR(vma))
-			return PTR_ERR(vma);
+		if (IS_ERR(vma)) {
+			ret = PTR_ERR(vma);
+			goto unlock;
+		}
 
 		pages = get_pages(obj);
 		if (IS_ERR(pages)) {
@@ -405,7 +407,7 @@ int msm_gem_get_iova(struct drm_gem_object *obj,
 
 fail:
 	del_vma(vma);
-
+unlock:
 	mutex_unlock(&msm_obj->lock);
 	return ret;
 }
