From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sun, 15 Jan 2012 11:31:05 +0000
Subject: [patch] drm/nouveau/dp: nouveau_dp_link_train() returns bool
Message-Id: <20120115113105.GF20463@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Airlie <airlied@linux.ie>
Cc: kernel-janitors@vger.kernel.org, Ben Skeggs <bskeggs@redhat.com>, dri-devel@lists.freedesktop.org

The caller doesn't check the return value, but this function returns a
bool so static checkers complain when we return a negative error code.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpu/drm/nouveau/nouveau_dp.c b/drivers/gpu/drm/nouveau/nouveau_dp.c
index 9b93b70..dcffd13 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dp.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dp.c
@@ -573,7 +573,7 @@ nouveau_dp_link_train(struct drm_encoder *encoder, u32 datarate)
 
 	dp.table = nouveau_dp_bios_data(dev, nv_encoder->dcb, &dp.entry);
 	if (!dp.table)
-		return -EINVAL;
+		return false;
 
 	dp.dcb = nv_encoder->dcb;
 	dp.crtc = nv_crtc->index;
