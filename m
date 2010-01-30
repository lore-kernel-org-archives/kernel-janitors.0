From: Marcin Slusarz <marcin.slusarz@gmail.com>
Date: Sat, 30 Jan 2010 14:41:00 +0000
Subject: [PATCH] nouveau: move dereferences after null checks
Message-Id: <20100130144100.GA2902@joi.lan>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100129090049.GA5547@bicker>
In-Reply-To: <20100129090049.GA5547@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: nouveau@lists.freedesktop.org
Cc: Dan Carpenter <error27@gmail.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, Jan 29, 2010 at 12:00:49PM +0300, Dan Carpenter wrote:
> These bugs are when code dereferences a variable and then checks that it is not null.
> The new thing is that I wrote a shell script to try remove the false positives caused
> by macros.  There are still some false positives because smatch is bad at handling 
> loops and knowing when a container got redefined.
> 
> Sometimes the fixes are not obvious.
> 
> This is the output of: /path/to/smatch_scripts/filter_kernel_deref_check.sh warns.txt
> 
> regards,
> dan carpenter
> 
> (...)
> drivers/gpu/drm/nouveau/nouveau_object.c +891 'chan': if (!chan || !gpuobj_ret || *gpuobj_ret != NULL)
> drivers/gpu/drm/nouveau/nouveau_sgdma.c +61 'nvbe': if (nvbe && nvbe->pages) {
> drivers/gpu/drm/nouveau/nouveau_connector.c +91 'connector': if (!connector)
> drivers/gpu/drm/nouveau/nv50_crtc.c +306 'crtc': if (!crtc)
> (...)

---
From: Marcin Slusarz <marcin.slusarz@gmail.com>
Subject: [PATCH] nouveau: move dereferences after null checks

Reported-by: Dan Carpenter <error27@gmail.com>
Signed-off-by: Marcin Slusarz <marcin.slusarz@gmail.com>
---
 drivers/gpu/drm/nouveau/nouveau_connector.c |    7 ++++---
 drivers/gpu/drm/nouveau/nouveau_object.c    |    3 ++-
 drivers/gpu/drm/nouveau/nouveau_sgdma.c     |    7 ++++---
 drivers/gpu/drm/nouveau/nv50_crtc.c         |   11 +++++++----
 4 files changed, 17 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.c b/drivers/gpu/drm/nouveau/nouveau_connector.c
index 7e6d673..d2f6335 100644
--- a/drivers/gpu/drm/nouveau/nouveau_connector.c
+++ b/drivers/gpu/drm/nouveau/nouveau_connector.c
@@ -88,13 +88,14 @@ nouveau_connector_destroy(struct drm_connector *drm_connector)
 {
 	struct nouveau_connector *nv_connector  		nouveau_connector(drm_connector);
-	struct drm_device *dev = nv_connector->base.dev;
-
-	NV_DEBUG_KMS(dev, "\n");
+	struct drm_device *dev;
 
 	if (!nv_connector)
 		return;
 
+	dev = nv_connector->base.dev;
+	NV_DEBUG_KMS(dev, "\n");
+
 	kfree(nv_connector->edid);
 	drm_sysfs_connector_remove(drm_connector);
 	drm_connector_cleanup(drm_connector);
diff --git a/drivers/gpu/drm/nouveau/nouveau_object.c b/drivers/gpu/drm/nouveau/nouveau_object.c
index 6c2cf81..e7c100b 100644
--- a/drivers/gpu/drm/nouveau/nouveau_object.c
+++ b/drivers/gpu/drm/nouveau/nouveau_object.c
@@ -885,11 +885,12 @@ int
 nouveau_gpuobj_sw_new(struct nouveau_channel *chan, int class,
 		      struct nouveau_gpuobj **gpuobj_ret)
 {
-	struct drm_nouveau_private *dev_priv = chan->dev->dev_private;
+	struct drm_nouveau_private *dev_priv;
 	struct nouveau_gpuobj *gpuobj;
 
 	if (!chan || !gpuobj_ret || *gpuobj_ret != NULL)
 		return -EINVAL;
+	dev_priv = chan->dev->dev_private;
 
 	gpuobj = kzalloc(sizeof(*gpuobj), GFP_KERNEL);
 	if (!gpuobj)
diff --git a/drivers/gpu/drm/nouveau/nouveau_sgdma.c b/drivers/gpu/drm/nouveau/nouveau_sgdma.c
index 4c7f1e4..ed15905 100644
--- a/drivers/gpu/drm/nouveau/nouveau_sgdma.c
+++ b/drivers/gpu/drm/nouveau/nouveau_sgdma.c
@@ -54,11 +54,12 @@ static void
 nouveau_sgdma_clear(struct ttm_backend *be)
 {
 	struct nouveau_sgdma_be *nvbe = (struct nouveau_sgdma_be *)be;
-	struct drm_device *dev = nvbe->dev;
-
-	NV_DEBUG(nvbe->dev, "\n");
+	struct drm_device *dev;
 
 	if (nvbe && nvbe->pages) {
+		dev = nvbe->dev;
+		NV_DEBUG(dev, "\n");
+
 		if (nvbe->bound)
 			be->func->unbind(be);
 
diff --git a/drivers/gpu/drm/nouveau/nv50_crtc.c b/drivers/gpu/drm/nouveau/nv50_crtc.c
index 40b7360..d1a651e 100644
--- a/drivers/gpu/drm/nouveau/nv50_crtc.c
+++ b/drivers/gpu/drm/nouveau/nv50_crtc.c
@@ -298,14 +298,17 @@ nv50_crtc_set_clock(struct drm_device *dev, int head, int pclk)
 static void
 nv50_crtc_destroy(struct drm_crtc *crtc)
 {
-	struct drm_device *dev = crtc->dev;
-	struct nouveau_crtc *nv_crtc = nouveau_crtc(crtc);
-
-	NV_DEBUG_KMS(dev, "\n");
+	struct drm_device *dev;
+	struct nouveau_crtc *nv_crtc;
 
 	if (!crtc)
 		return;
 
+	dev = crtc->dev;
+	nv_crtc = nouveau_crtc(crtc);
+
+	NV_DEBUG_KMS(dev, "\n");
+
 	drm_crtc_cleanup(&nv_crtc->base);
 
 	nv50_cursor_fini(nv_crtc);
-- 
1.6.6


