From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 19 Jul 2018 08:19:21 +0000
Subject: [PATCH] drm/i915/kvmgt: fix an error code in gvt_dma_map_page()
Message-Id: <20180719081921.jdair4cgqllst5yj@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Zhenyu Wang <zhenyuw@linux.intel.com>, Changbin Du <changbin.du@intel.com>
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org, Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-gvt-dev@lists.freedesktop.org

The dma_mapping_error() returns true on error but we want to return
-ENOMEM here.

Fixes: 79e542f5af79 ("drm/i915/kvmgt: Support setting dma map for huge pages")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/gvt/kvmgt.c
index 4d2f53ae9f0f..32ec5748f176 100644
--- a/drivers/gpu/drm/i915/gvt/kvmgt.c
+++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
@@ -187,14 +187,14 @@ static int gvt_dma_map_page(struct intel_vgpu *vgpu, unsigned long gfn,
 
 	/* Setup DMA mapping. */
 	*dma_addr = dma_map_page(dev, page, 0, size, PCI_DMA_BIDIRECTIONAL);
-	ret = dma_mapping_error(dev, *dma_addr);
-	if (ret) {
+	if (dma_mapping_error(dev, *dma_addr)) {
 		gvt_vgpu_err("DMA mapping failed for pfn 0x%lx, ret %d\n",
 			     page_to_pfn(page), ret);
 		gvt_unpin_guest_page(vgpu, gfn, size);
+		return -ENOMEM;
 	}
 
-	return ret;
+	return 0;
 }
 
 static void gvt_dma_unmap_page(struct intel_vgpu *vgpu, unsigned long gfn,
