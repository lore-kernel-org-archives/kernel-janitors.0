From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 25 Jan 2021 08:45:37 +0000
Subject: [PATCH] drm/vmwgfx/vmwgfx_drv: Fix an error path in vmw_setup_pci_resources()
Message-Id: <YA6FMboLhnE3uSvb@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: VMware Graphics <linux-graphics-maintainer@vmware.com>, Zack Rusin <zackr@vmware.com>
Cc: David Airlie <airlied@linux.ie>, Roland Scheidegger <sroland@vmware.com>, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org, Martin Krastev <krastevm@vmware.com>

The devm_memremap() function never returns NULL, it returns error
pointers so the test needs to be fixed.  Also we need to call
pci_release_regions() to avoid a memory leak.

Fixes: be4f77ac6884 ("drm/vmwgfx: Cleanup fifo mmio handling")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
index eb997f4678de..3f603a6b5f90 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
@@ -668,9 +668,10 @@ static int vmw_setup_pci_resources(struct vmw_private *dev,
 				      fifo_size,
 				      MEMREMAP_WB);
 
-	if (unlikely(dev->fifo_mem = NULL)) {
+	if (IS_ERR(dev->fifo_mem)) {
 		DRM_ERROR("Failed mapping FIFO memory.\n");
-		return -ENOMEM;
+		pci_release_regions(pdev);
+		return PTR_ERR(dev->fifo_mem);
 	}
 
 	/*
-- 
2.29.2
