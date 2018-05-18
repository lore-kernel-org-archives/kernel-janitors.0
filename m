From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 18 May 2018 08:10:41 +0000
Subject: [PATCH] drm/v3d: Checking for NULL vs IS_ERR()
Message-Id: <20180518081041.GC28335@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Eric Anholt <eric@anholt.net>
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org

The v3d_fence_create() only returns error pointers on error.  It never
returns NULL.

Fixes: 57692c94dcbe ("drm/v3d: Introduce a new DRM driver for Broadcom V3D V3.x+")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpu/drm/v3d/v3d_sched.c b/drivers/gpu/drm/v3d/v3d_sched.c
index b07bece9417d..808bc901f567 100644
--- a/drivers/gpu/drm/v3d/v3d_sched.c
+++ b/drivers/gpu/drm/v3d/v3d_sched.c
@@ -114,8 +114,8 @@ static struct dma_fence *v3d_job_run(struct drm_sched_job *sched_job)
 	v3d_invalidate_caches(v3d);
 
 	fence = v3d_fence_create(v3d, q);
-	if (!fence)
-		return fence;
+	if (IS_ERR(fence))
+		return NULL;
 
 	if (job->done_fence)
 		dma_fence_put(job->done_fence);
