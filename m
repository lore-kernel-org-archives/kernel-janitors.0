From: Colin King <colin.king@canonical.com>
Date: Wed, 25 Nov 2020 14:05:23 +0000
Subject: [PATCH] dma-mapping: Fix sizeof() mismatch on tsk allocation
Message-Id: <20201125140523.1880669-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Barry Song <song.bao.hua@hisilicon.com>, Christoph Hellwig <hch@lst.de>, Marek Szyprowski <m.szyprowski@samsung.com>, Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux-foundation.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

An incorrect sizeof() is being used, sizeof(tsk) is not correct, it should
be sizeof(*tsk). Fix it.

Addresses-Coverity: ("Sizeof not portable (SIZEOF_MISMATCH)")
Fixes: bfd2defed94d ("dma-mapping: add benchmark support for streaming DMA APIs")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 kernel/dma/map_benchmark.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/dma/map_benchmark.c b/kernel/dma/map_benchmark.c
index e1e37603d01b..b1496e744c68 100644
--- a/kernel/dma/map_benchmark.c
+++ b/kernel/dma/map_benchmark.c
@@ -121,7 +121,7 @@ static int do_map_benchmark(struct map_benchmark_data *map)
 	int ret = 0;
 	int i;
 
-	tsk = kmalloc_array(threads, sizeof(tsk), GFP_KERNEL);
+	tsk = kmalloc_array(threads, sizeof(*tsk), GFP_KERNEL);
 	if (!tsk)
 		return -ENOMEM;
 
-- 
2.29.2
