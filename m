From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 26 Oct 2020 09:49:05 +0000
Subject: [PATCH resend] drm/v3d: Fix double free in v3d_submit_cl_ioctl()
Message-Id: <20201026094905.GA1634423@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <20191024205306.GA14416@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Eric Anholt <eric@anholt.duckdns.org>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org

Originally this error path used to leak "bin" but then we accidentally
applied two separate commits to fix it and ended up with a double free.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Resending a year later because it was confusing at the time who should
apply this and it fell through the cracks.  For some reason the kbuild
bot flagged it as a new warning so it showed up on my radar again.

 drivers/gpu/drm/v3d/v3d_gem.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/v3d/v3d_gem.c b/drivers/gpu/drm/v3d/v3d_gem.c
index 549dde83408b..37515e47b47e 100644
--- a/drivers/gpu/drm/v3d/v3d_gem.c
+++ b/drivers/gpu/drm/v3d/v3d_gem.c
@@ -568,7 +568,6 @@ v3d_submit_cl_ioctl(struct drm_device *dev, void *data,
 		ret = v3d_job_init(v3d, file_priv, &bin->base,
 				   v3d_job_free, args->in_sync_bcl);
 		if (ret) {
-			kfree(bin);
 			v3d_job_put(&render->base);
 			kfree(bin);
 			return ret;
-- 
2.20.1
