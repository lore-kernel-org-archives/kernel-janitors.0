From: YueHaibing <yuehaibing@huawei.com>
Date: Fri, 12 Oct 2018 03:25:56 +0000
Subject: [PATCH -next] misc: mic: scif: remove set but not used variables 'src_dma_addr, dst_dma_addr'
Message-Id: <1539314756-154517-1-git-send-email-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: sudeep.dutt@intel.com, ashutosh.dixit@intel.com, arnd@arndb.de, gregkh@linuxfoundation.org, mhocko@suse.com, akpm@linux-foundation.org, leon@kernel.org, natechancellor@gmail.com, christian.koenig@amd.com
Cc: YueHaibing <yuehaibing@huawei.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/misc/mic/scif/scif_dma.c: In function 'scif_rma_list_dma_copy_wrapper':
drivers/misc/mic/scif/scif_dma.c:1558:27: warning:
 variable 'dst_dma_addr' set but not used [-Wunused-but-set-variable]

drivers/misc/mic/scif/scif_dma.c:1558:13: warning:
 variable 'src_dma_addr' set but not used [-Wunused-but-set-variable]

They never used since introduction in
commit 7cc31cd27752 ("misc: mic: SCIF DMA and CPU copy interface")

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/misc/mic/scif/scif_dma.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/misc/mic/scif/scif_dma.c b/drivers/misc/mic/scif/scif_dma.c
index 03af8b5..2babbac 100644
--- a/drivers/misc/mic/scif/scif_dma.c
+++ b/drivers/misc/mic/scif/scif_dma.c
@@ -1555,7 +1555,6 @@ static int scif_rma_list_dma_copy_wrapper(struct scif_endpt *epd,
 	u8 *temp = NULL;
 	bool src_local = true;
 	struct scif_dma_comp_cb *comp_cb;
-	dma_addr_t src_dma_addr, dst_dma_addr;
 	int err;
 
 	if (is_dma_copy_aligned(chan->device, 1, 1, 1))
@@ -1569,8 +1568,6 @@ static int scif_rma_list_dma_copy_wrapper(struct scif_endpt *epd,
 
 	if (work->loopback)
 		return scif_rma_list_cpu_copy(work);
-	src_dma_addr = __scif_off_to_dma_addr(work->src_window, src_offset);
-	dst_dma_addr = __scif_off_to_dma_addr(work->dst_window, dst_offset);
 	src_local = work->src_window->type = SCIF_WINDOW_SELF;
 
 	/* Allocate dma_completion cb */
