From: Eric Sesterhenn / snakebyte <snakebyte@gmx.de>
Date: Tue, 31 Jan 2006 13:02:50 +0000
Subject: [KJ] [Patch] BUG_ON() Conversion in lib/swiotlb.c
Message-Id: <1138712570.11570.11.camel@alice>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============1170124446812042=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============1170124446812042==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi, 

this changes if() BUG(); constructs to BUG_ON() which is
cleaner, contains unlikely() and can better optimized away.

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.16-rc1-git4/lib/swiotlb.c.orig	2006-01-30 22:21:26.000000000 +0100
+++ linux-2.6.16-rc1-git4/lib/swiotlb.c	2006-01-30 22:23:05.000000000 +0100
@@ -296,8 +296,7 @@ map_single(struct device *hwdev, char *b
 	else
 		stride = 1;
 
-	if (!nslots)
-		BUG();
+	BUG_ON(!nslots);
 
 	/*
 	 * Find suitable number of IO TLB entries size that will fit this
@@ -416,14 +415,14 @@ sync_single(struct device *hwdev, char *
 	case SYNC_FOR_CPU:
 		if (likely(dir == DMA_FROM_DEVICE || dir == DMA_BIDIRECTIONAL))
 			memcpy(buffer, dma_addr, size);
-		else if (dir != DMA_TO_DEVICE)
-			BUG();
+		else
+			BUG_ON(dir != DMA_TO_DEVICE);
 		break;
 	case SYNC_FOR_DEVICE:
 		if (likely(dir == DMA_TO_DEVICE || dir == DMA_BIDIRECTIONAL))
 			memcpy(dma_addr, buffer, size);
-		else if (dir != DMA_FROM_DEVICE)
-			BUG();
+		else
+			BUG_ON(dir != DMA_FROM_DEVICE);
 		break;
 	default:
 		BUG();
@@ -529,8 +528,7 @@ swiotlb_map_single(struct device *hwdev,
 	unsigned long dev_addr = virt_to_phys(ptr);
 	void *map;
 
-	if (dir == DMA_NONE)
-		BUG();
+	BUG_ON(dir == DMA_NONE);
 	/*
 	 * If the pointer passed in happens to be in the device's DMA window,
 	 * we can safely return the device addr and not worry about bounce
@@ -592,8 +590,7 @@ swiotlb_unmap_single(struct device *hwde
 {
 	char *dma_addr = phys_to_virt(dev_addr);
 
-	if (dir == DMA_NONE)
-		BUG();
+	BUG_ON(dir == DMA_NONE);
 	if (dma_addr >= io_tlb_start && dma_addr < io_tlb_end)
 		unmap_single(hwdev, dma_addr, size, dir);
 	else if (dir == DMA_FROM_DEVICE)
@@ -616,8 +613,7 @@ swiotlb_sync_single(struct device *hwdev
 {
 	char *dma_addr = phys_to_virt(dev_addr);
 
-	if (dir == DMA_NONE)
-		BUG();
+	BUG_ON(dir == DMA_NONE);
 	if (dma_addr >= io_tlb_start && dma_addr < io_tlb_end)
 		sync_single(hwdev, dma_addr, size, dir, target);
 	else if (dir == DMA_FROM_DEVICE)
@@ -648,8 +644,7 @@ swiotlb_sync_single_range(struct device 
 {
 	char *dma_addr = phys_to_virt(dev_addr) + offset;
 
-	if (dir == DMA_NONE)
-		BUG();
+	BUG_ON(dir == DMA_NONE);
 	if (dma_addr >= io_tlb_start && dma_addr < io_tlb_end)
 		sync_single(hwdev, dma_addr, size, dir, target);
 	else if (dir == DMA_FROM_DEVICE)
@@ -696,8 +691,7 @@ swiotlb_map_sg(struct device *hwdev, str
 	unsigned long dev_addr;
 	int i;
 
-	if (dir == DMA_NONE)
-		BUG();
+	BUG_ON(dir == DMA_NONE);
 
 	for (i = 0; i < nelems; i++, sg++) {
 		addr = SG_ENT_VIRT_ADDRESS(sg);
@@ -730,8 +724,7 @@ swiotlb_unmap_sg(struct device *hwdev, s
 {
 	int i;
 
-	if (dir == DMA_NONE)
-		BUG();
+	BUG_ON(dir == DMA_NONE);
 
 	for (i = 0; i < nelems; i++, sg++)
 		if (sg->dma_address != SG_ENT_PHYS_ADDRESS(sg))
@@ -753,8 +746,7 @@ swiotlb_sync_sg(struct device *hwdev, st
 {
 	int i;
 
-	if (dir == DMA_NONE)
-		BUG();
+	BUG_ON(dir == DMA_NONE);
 
 	for (i = 0; i < nelems; i++, sg++)
 		if (sg->dma_address != SG_ENT_PHYS_ADDRESS(sg))



--===============1170124446812042==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============1170124446812042==--
