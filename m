From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 03 Jul 2018 12:30:16 +0000
Subject: [PATCH] drm/i810: off by one in i810_dma_vertex()
Message-Id: <20180703123015.kma7v7rwtdy4urce@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Airlie <airlied@linux.ie>
Cc: kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org

If vertex->idx = dma->buf_count then we end up reading one element
beyond the end of the dma->buflist[] array.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpu/drm/i810/i810_dma.c b/drivers/gpu/drm/i810/i810_dma.c
index 576a417690d4..3b378936f575 100644
--- a/drivers/gpu/drm/i810/i810_dma.c
+++ b/drivers/gpu/drm/i810/i810_dma.c
@@ -934,7 +934,7 @@ static int i810_dma_vertex(struct drm_device *dev, void *data,
 	DRM_DEBUG("idx %d used %d discard %d\n",
 		  vertex->idx, vertex->used, vertex->discard);
 
-	if (vertex->idx < 0 || vertex->idx > dma->buf_count)
+	if (vertex->idx < 0 || vertex->idx >= dma->buf_count)
 		return -EINVAL;
 
 	i810_dma_dispatch_vertex(dev,
