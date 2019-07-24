From: YueHaibing <yuehaibing@huawei.com>
Date: Wed, 24 Jul 2019 01:46:19 +0000
Subject: [PATCH -next] drm/mga: remove set but not used variable 'buf_priv'
Message-Id: <20190724014619.32665-1-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>
Cc: YueHaibing <yuehaibing@huawei.com>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Hulk Robot <hulkci@huawei.com>

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/gpu/drm/mga/mga_state.c: In function 'mga_dma_iload':
drivers/gpu/drm/mga/mga_state.c:945:22: warning:
 variable 'buf_priv' set but not used [-Wunused-but-set-variable]

It is never used, so can be removed.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/gpu/drm/mga/mga_state.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/mga/mga_state.c b/drivers/gpu/drm/mga/mga_state.c
index 77a0b006f066..0dec4062e5a2 100644
--- a/drivers/gpu/drm/mga/mga_state.c
+++ b/drivers/gpu/drm/mga/mga_state.c
@@ -942,7 +942,6 @@ static int mga_dma_iload(struct drm_device *dev, void *data, struct drm_file *fi
 	struct drm_device_dma *dma = dev->dma;
 	drm_mga_private_t *dev_priv = dev->dev_private;
 	struct drm_buf *buf;
-	drm_mga_buf_priv_t *buf_priv;
 	drm_mga_iload_t *iload = data;
 	DRM_DEBUG("\n");
 
@@ -959,7 +958,6 @@ static int mga_dma_iload(struct drm_device *dev, void *data, struct drm_file *fi
 		return -EINVAL;
 
 	buf = dma->buflist[iload->idx];
-	buf_priv = buf->dev_private;
 
 	if (mga_verify_iload(dev_priv, iload->dstorg, iload->length)) {
 		mga_freelist_put(dev, buf);
