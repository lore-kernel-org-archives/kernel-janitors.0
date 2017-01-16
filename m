From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 16 Jan 2017 11:58:08 +0000
Subject: [patch] drm/msm: return -EFAULT if copy_from_user() fails
Message-Id: <20170116115808.GA12766@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rob Clark <robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jordan Crouse <jcrouse-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, freedreno-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org

copy_from_user_inatomic() is actually a local function that returns
-EFAULT or positive values on error.  Otherwise copy_from_user() returns
the number of bytes remaining to be copied.  We want to return -EFAULT
here.

I removed an unlikely() because we just did a copy_from_user()
so I don't think it can possibly make a difference.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Not compiled.

diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index 4896765..1172fe7 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -95,13 +95,13 @@ static int submit_lookup_objects(struct msm_gem_submit *submit,
 		 */
 		submit->bos[i].flags = 0;
 
-		ret = copy_from_user_inatomic(&submit_bo, userptr, sizeof(submit_bo));
-		if (unlikely(ret)) {
+		if (copy_from_user_inatomic(&submit_bo, userptr, sizeof(submit_bo))) {
 			pagefault_enable();
 			spin_unlock(&file->table_lock);
-			ret = copy_from_user(&submit_bo, userptr, sizeof(submit_bo));
-			if (ret)
+			if (copy_from_user(&submit_bo, userptr, sizeof(submit_bo))) {
+				ret = -EFAULT;
 				goto out;
+			}
 			spin_lock(&file->table_lock);
 			pagefault_disable();
 		}
@@ -317,9 +317,10 @@ static int submit_reloc(struct msm_gem_submit *submit, struct msm_gem_object *ob
 		uint64_t iova;
 		bool valid;
 
-		ret = copy_from_user(&submit_reloc, userptr, sizeof(submit_reloc));
-		if (ret)
+		if (copy_from_user(&submit_reloc, userptr, sizeof(submit_reloc))) {
+			ret = -EFAULT;
 			goto out;
+		}
 
 		if (submit_reloc.submit_offset % 4) {
 			DRM_ERROR("non-aligned reloc offset: %u\n",
