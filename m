From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 28 Sep 2020 09:07:26 +0000
Subject: [PATCH] drm: prime: Potential Oops in drm_gem_map_dma_buf()
Message-Id: <20200928090726.GB377727@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org

This code doesn't check if the call to ->get_sg_table() fails so it
could dereference an error pointer and Oops.

Fixes: c614d7e66c6a ("drm: remove prime sg_table caching")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/gpu/drm/drm_prime.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
index 11fe9ff76fd5..1e2c7ff63f16 100644
--- a/drivers/gpu/drm/drm_prime.c
+++ b/drivers/gpu/drm/drm_prime.c
@@ -627,6 +627,9 @@ struct sg_table *drm_gem_map_dma_buf(struct dma_buf_attachment *attach,
 	else
 		sgt = obj->dev->driver->gem_prime_get_sg_table(obj);
 
+	if (IS_ERR(sgt))
+		return sgt;
+
 	ret = dma_map_sgtable(attach->dev, sgt, dir,
 			      DMA_ATTR_SKIP_CPU_SYNC);
 	if (ret) {
-- 
2.28.0
