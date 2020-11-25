From: Colin King <colin.king@canonical.com>
Date: Wed, 25 Nov 2020 13:55:35 +0000
Subject: [PATCH] dma-mapping: fix an uninitialized pointer read due to typo in argp assignment
Message-Id: <20201125135535.1880307-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Barry Song <song.bao.hua@hisilicon.com>, Christoph Hellwig <hch@lst.de>, Marek Szyprowski <m.szyprowski@samsung.com>, Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux-foundation.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The assignment of argp is currently using argp as the source because of
a typo. Fix this by assigning it the value passed in arg instead.

Addresses-Coverity: ("Uninitialized pointer read")
Fixes: bfd2defed94d ("dma-mapping: add benchmark support for streaming DMA APIs")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 kernel/dma/map_benchmark.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/dma/map_benchmark.c b/kernel/dma/map_benchmark.c
index ca616b664f72..e1e37603d01b 100644
--- a/kernel/dma/map_benchmark.c
+++ b/kernel/dma/map_benchmark.c
@@ -192,7 +192,7 @@ static long map_benchmark_ioctl(struct file *file, unsigned int cmd,
 		unsigned long arg)
 {
 	struct map_benchmark_data *map = file->private_data;
-	void __user *argp = (void __user *)argp;
+	void __user *argp = (void __user *)arg;
 	u64 old_dma_mask;
 
 	int ret;
-- 
2.29.2
