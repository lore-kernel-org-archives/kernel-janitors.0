From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 04 Jul 2018 09:48:10 +0000
Subject: [PATCH] drm/savage: off by one in savage_bci_cmdbuf()
Message-Id: <20180704094810.whrgn6jxe7uibnfv@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Airlie <airlied@linux.ie>
Cc: kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org

The > should be >= here so that we don't read beyond the end of the
dma->buflist[] array.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpu/drm/savage/savage_state.c b/drivers/gpu/drm/savage/savage_state.c
index 2db89bed52e8..7559a820bd43 100644
--- a/drivers/gpu/drm/savage/savage_state.c
+++ b/drivers/gpu/drm/savage/savage_state.c
@@ -971,7 +971,7 @@ int savage_bci_cmdbuf(struct drm_device *dev, void *data, struct drm_file *file_
 	LOCK_TEST_WITH_RETURN(dev, file_priv);
 
 	if (dma && dma->buflist) {
-		if (cmdbuf->dma_idx > dma->buf_count) {
+		if (cmdbuf->dma_idx >= dma->buf_count) {
 			DRM_ERROR
 			    ("vertex buffer index %u out of range (0-%u)\n",
 			     cmdbuf->dma_idx, dma->buf_count - 1);
