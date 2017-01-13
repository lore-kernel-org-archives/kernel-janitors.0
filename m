From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 13 Jan 2017 07:49:00 +0000
Subject: [patch] drm/vc4: fix a bounds check
Message-Id: <20170113074900.GB30524@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Eric Anholt <eric@anholt.net>
Cc: kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org

We accidentally return success even if vc4_full_res_bounds_check() fails.

Fixes: d5b1a78a772f ("drm/vc4: Add support for drawing 3D frames.")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Not tested.

diff --git a/drivers/gpu/drm/vc4/vc4_render_cl.c b/drivers/gpu/drm/vc4/vc4_render_cl.c
index 08886a3..5cdd003 100644
--- a/drivers/gpu/drm/vc4/vc4_render_cl.c
+++ b/drivers/gpu/drm/vc4/vc4_render_cl.c
@@ -461,7 +461,7 @@ static int vc4_rcl_surface_setup(struct vc4_exec_info *exec,
 		}
 
 		ret = vc4_full_res_bounds_check(exec, *obj, surf);
-		if (!ret)
+		if (ret)
 			return ret;
 
 		return 0;
