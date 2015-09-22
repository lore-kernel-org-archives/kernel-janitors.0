From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 22 Sep 2015 12:31:04 +0000
Subject: [patch] drm/layerscape: fix a signedness bug
Message-Id: <20150922123104.GB27407@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jianwei Wang <jianwei.wang.chn@gmail.com>
Cc: kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org, Alison Wang <alison.wang@freescale.com>

"index" needs to be signed for the error handling to work.  Really "ret"
should be an int as well.

Fixes: 109eee2f2a18 ('drm/layerscape: Add Freescale DCU DRM driver')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_plane.c b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_plane.c
index 82be6b8..d1e300d 100644
--- a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_plane.c
+++ b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_plane.c
@@ -58,7 +58,8 @@ static void fsl_dcu_drm_plane_atomic_disable(struct drm_plane *plane,
 					     struct drm_plane_state *old_state)
 {
 	struct fsl_dcu_drm_device *fsl_dev = plane->dev->dev_private;
-	unsigned int index, value, ret;
+	unsigned int value;
+	int index, ret;
 
 	index = fsl_dcu_drm_plane_index(plane);
 	if (index < 0)
