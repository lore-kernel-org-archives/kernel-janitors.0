From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 19 Mar 2015 10:17:04 +0000
Subject: [patch] drm/gma500: double free in psbfb_create()
Message-Id: <20150319101704.GA13330@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Airlie <airlied@linux.ie>, Alan Cox <alan@linux.intel.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org, Fabian Frederick <fabf@skynet.be>, Alex Deucher <alexander.deucher@amd.com>, Dave Airlie <airlied@redhat.com>, Thierry Reding <treding@nvidia.com>

The psb_gtt_free_range() frees "backing" so calling it twice is a double
free bug.  I have fixed this by removing the first call.

Fixes: 4d8d096e9ae8  ('gma500: introduce the framebuffer support code')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpu/drm/gma500/framebuffer.c b/drivers/gpu/drm/gma500/framebuffer.c
index 2d42ce6..89d5646 100644
--- a/drivers/gpu/drm/gma500/framebuffer.c
+++ b/drivers/gpu/drm/gma500/framebuffer.c
@@ -479,9 +479,7 @@ static int psbfb_create(struct psb_fbdev *fbdev,
 	mutex_unlock(&dev->struct_mutex);
 	return 0;
 out_unref:
-	if (backing->stolen)
-		psb_gtt_free_range(dev, backing);
-	else
+	if (!backing->stolen)
 		drm_gem_object_unreference(&backing->gem);
 out_err1:
 	mutex_unlock(&dev->struct_mutex);
