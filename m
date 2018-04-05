From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 05 Apr 2018 11:19:11 +0000
Subject: [PATCH] swiotlb: remove an unecessary NULL check
Message-Id: <20180405111911.GC4218@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Konrad Rzeszutek Wilk <konrad.wilk-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>, Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>
Cc: iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

Smatch complains here:

    lib/swiotlb.c:730 swiotlb_alloc_buffer()
    warn: variable dereferenced before check 'dev' (see line 716)

"dev" isn't ever NULL in this function so we can just remove the check.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/lib/swiotlb.c b/lib/swiotlb.c
index 47aeb04c1997..51dde88e50a3 100644
--- a/lib/swiotlb.c
+++ b/lib/swiotlb.c
@@ -727,7 +727,7 @@ swiotlb_alloc_buffer(struct device *dev, size_t size, dma_addr_t *dma_handle,
 
 out_unmap:
 	dev_warn(dev, "hwdev DMA mask = 0x%016Lx, dev_addr = 0x%016Lx\n",
-		(unsigned long long)(dev ? dev->coherent_dma_mask : 0),
+		(unsigned long long)dev->coherent_dma_mask,
 		(unsigned long long)*dma_handle);
 
 	/*
