From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Thu, 21 Dec 2006 00:16:07 +0000
Subject: [KJ] [PATCH] Replace __get_free_pages(...GFP_DMA...) with
Message-Id: <Pine.LNX.4.64.0612201911420.11703@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0612201823300.11703@localhost.localdomain>
In-Reply-To: <Pine.LNX.4.64.0612201823300.11703@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


  Given the definition for __get_dma_pages() in include/linux/gfp.h:

  #define __get_dma_pages(gfp_mask, order) \
		__get_free_pages((gfp_mask) | GFP_DMA,(order))

it would seem to make sense to rewrite __get_free_pages() as
__get_dma_pages() calls where appropriate.

Signed-off-by: Robert P. J. Day <rpjday@mindspring.com>

---

  this is a re-submission of the earlier patch, in which the call to
__get_free_pages() in arch/s390/kernel/smp.c wasn't transformed since
it represented a weird situation.

 arch/s390/kernel/smp.c      |    7 +++++++
 drivers/net/macmace.c       |    4 ++--
 drivers/s390/block/dasd.c   |    2 +-
 drivers/s390/char/tty3270.c |    2 +-
 drivers/s390/cio/cmf.c      |    3 +--
 lib/swiotlb.c               |   10 +++-------
 sound/oss/dmabuf.c          |    2 +-
 sound/oss/hal2.c            |    4 ++--
 sound/oss/sscape.c          |    2 +-
 9 files changed, 19 insertions(+), 17 deletions(-)

diff --git a/arch/s390/kernel/smp.c b/arch/s390/kernel/smp.c
index 19090f7..0c3d81d 100644
--- a/arch/s390/kernel/smp.c
+++ b/arch/s390/kernel/smp.c
@@ -726,6 +726,13 @@ void __init smp_prepare_cpus(unsigned int max_cpus)
          */
 	print_cpu_info(&S390_lowcore.cpu_data);

+	/*
+ 	 *  The call to __get_free_pages() below using GFP_DMA was not replaced
+	 * by a call to __get_dma_pages() since, apparently, this is not
+	 * actually used for DMA but needs to be below 2GB as defined by the
+	 * CPU architecture.
+	 */
+
         for_each_possible_cpu(i) {
 		lowcore_ptr[i] = (struct _lowcore *)
 			__get_free_pages(GFP_KERNEL|GFP_DMA,
diff --git a/drivers/net/macmace.c b/drivers/net/macmace.c
index 464e4a6..b2c9315 100644
--- a/drivers/net/macmace.c
+++ b/drivers/net/macmace.c
@@ -331,8 +331,8 @@ static int mace_open(struct net_device *dev)

 	/* Allocate the DMA ring buffers */

-	mp->rx_ring = (void *) __get_free_pages(GFP_KERNEL | GFP_DMA, N_RX_PAGES);
-	mp->tx_ring = (void *) __get_free_pages(GFP_KERNEL | GFP_DMA, 0);
+	mp->rx_ring = (void *) __get_dma_pages(GFP_KERNEL, N_RX_PAGES);
+	mp->tx_ring = (void *) __get_dma_pages(GFP_KERNEL, 0);

 	if (mp->tx_ring=NULL || mp->rx_ring=NULL) {
 		if (mp->rx_ring) free_pages((u32) mp->rx_ring, N_RX_PAGES);
diff --git a/drivers/s390/block/dasd.c b/drivers/s390/block/dasd.c
index 492b68b..88ad970 100644
--- a/drivers/s390/block/dasd.c
+++ b/drivers/s390/block/dasd.c
@@ -77,7 +77,7 @@ dasd_alloc_device(void)
 	atomic_set(&device->open_count, -1);

 	/* Get two pages for normal block device operations. */
-	device->ccw_mem = (void *) __get_free_pages(GFP_ATOMIC | GFP_DMA, 1);
+	device->ccw_mem = (void *) __get_dma_pages(GFP_ATOMIC, 1);
 	if (device->ccw_mem = NULL) {
 		kfree(device);
 		return ERR_PTR(-ENOMEM);
diff --git a/drivers/s390/char/tty3270.c b/drivers/s390/char/tty3270.c
index 0984462..984a989 100644
--- a/drivers/s390/char/tty3270.c
+++ b/drivers/s390/char/tty3270.c
@@ -700,7 +700,7 @@ tty3270_alloc_view(void)
 	INIT_LIST_HEAD(&tp->freemem);
 	for (pages = 0; pages < TTY3270_STRING_PAGES; pages++) {
 		tp->freemem_pages[pages] = (void *)
-			__get_free_pages(GFP_KERNEL|GFP_DMA, 0);
+			__get_dma_pages(GFP_KERNEL, 0);
 		if (!tp->freemem_pages[pages])
 			goto out_pages;
 		add_string_memory(&tp->freemem,
diff --git a/drivers/s390/cio/cmf.c b/drivers/s390/cio/cmf.c
index 828b2d3..548b6de 100644
--- a/drivers/s390/cio/cmf.c
+++ b/drivers/s390/cio/cmf.c
@@ -585,8 +585,7 @@ alloc_cmb (struct ccw_device *cdev)
 		WARN_ON(!list_empty(&cmb_area.list));

 		spin_unlock(&cmb_area.lock);
-		mem = (void*)__get_free_pages(GFP_KERNEL | GFP_DMA,
-				 get_order(size));
+		mem = (void*)__get_dma_pages(GFP_KERNEL, get_order(size));
 		spin_lock(&cmb_area.lock);

 		if (cmb_area.mem) {
diff --git a/lib/swiotlb.c b/lib/swiotlb.c
index 1062578..e4ed77e 100644
--- a/lib/swiotlb.c
+++ b/lib/swiotlb.c
@@ -195,8 +195,7 @@ swiotlb_late_init_with_default_size (size_t default_size)
 	io_tlb_nslabs = SLABS_PER_PAGE << order;

 	while ((SLABS_PER_PAGE << order) > IO_TLB_MIN_SLABS) {
-		io_tlb_start = (char *)__get_free_pages(GFP_DMA | __GFP_NOWARN,
-		                                        order);
+		io_tlb_start = (char *)__get_dma_pages(__GFP_NOWARN, order);
 		if (io_tlb_start)
 			break;
 		order--;
@@ -237,8 +236,7 @@ swiotlb_late_init_with_default_size (size_t default_size)
 	/*
 	 * Get the overflow emergency buffer
 	 */
-	io_tlb_overflow_buffer = (void *)__get_free_pages(GFP_DMA,
-	                                          get_order(io_tlb_overflow));
+	io_tlb_overflow_buffer = (void *)__get_dma_pages(0, get_order(io_tlb_overflow));
 	if (!io_tlb_overflow_buffer)
 		goto cleanup4;

@@ -442,9 +440,7 @@ swiotlb_alloc_coherent(struct device *hwdev, size_t size,
 	 * instead, or use ZONE_DMA32 (ia64 overloads ZONE_DMA to be a ~32
 	 * bit range instead of a 16MB one).
 	 */
-	flags |= GFP_DMA;
-
-	ret = (void *)__get_free_pages(flags, order);
+	ret = (void *)__get_dma_pages(flags, order);
 	if (ret && address_needs_mapping(hwdev, virt_to_phys(ret))) {
 		/*
 		 * The allocated memory isn't reachable by the device.
diff --git a/sound/oss/dmabuf.c b/sound/oss/dmabuf.c
index eaf6997..8c4ae7f 100644
--- a/sound/oss/dmabuf.c
+++ b/sound/oss/dmabuf.c
@@ -89,7 +89,7 @@ static int sound_alloc_dmap(struct dma_buffparms *dmap)
 	while (start_addr = NULL && dmap->buffsize > PAGE_SIZE) {
 		for (sz = 0, size = PAGE_SIZE; size < dmap->buffsize; sz++, size <<= 1);
 		dmap->buffsize = PAGE_SIZE * (1 << sz);
-		start_addr = (char *) __get_free_pages(GFP_ATOMIC|GFP_DMA|__GFP_NOWARN, sz);
+		start_addr = (char *) __get_dma_pages(GFP_ATOMIC|__GFP_NOWARN, sz);
 		if (start_addr = NULL)
 			dmap->buffsize /= 2;
 	}
diff --git a/sound/oss/hal2.c b/sound/oss/hal2.c
index d18286c..c478e37 100644
--- a/sound/oss/hal2.c
+++ b/sound/oss/hal2.c
@@ -555,8 +555,8 @@ static int hal2_alloc_dmabuf(struct hal2_codec *codec, int size,

 	DEBUG("allocating %dk DMA buffer.\n", size / 1024);

-	codec->buffer = (unsigned char *)__get_free_pages(GFP_KERNEL | GFP_DMA,
-							  get_order(size));
+	codec->buffer = (unsigned char *)__get_dma_pages(GFP_KERNEL,
+		get_order(size));
 	if (!codec->buffer)
 		return -ENOMEM;
 	desc = dma_alloc_coherent(NULL, count * sizeof(struct hal2_desc),
diff --git a/sound/oss/sscape.c b/sound/oss/sscape.c
index 30c36d1..be3702b 100644
--- a/sound/oss/sscape.c
+++ b/sound/oss/sscape.c
@@ -802,7 +802,7 @@ static int sscape_alloc_dma(sscape_info *devc)
 	while (start_addr = NULL && devc->buffsize > PAGE_SIZE) {
 		for (sz = 0, size = PAGE_SIZE; size < devc->buffsize; sz++, size <<= 1);
 		devc->buffsize = PAGE_SIZE * (1 << sz);
-		start_addr = (char *) __get_free_pages(GFP_ATOMIC|GFP_DMA, sz);
+		start_addr = (char *) __get_dma_pages(GFP_ATOMIC, sz);
 		if (start_addr = NULL) devc->buffsize /= 2;
 	}

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
