From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 26 Aug 2020 11:33:30 +0000
Subject: [PATCH] dma-pool: Fix an uninitialized variable bug in atomic_pool_expand()
Message-Id: <20200826113330.GD393664@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christoph Hellwig <hch@lst.de>, Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Cc: kernel-janitors@vger.kernel.org, iommu@lists.linux-foundation.org, Robin Murphy <robin.murphy@arm.com>, linux-kernel@vger.kernel.org

The "page" pointer can be used with out being initialized.

Fixes: d7e673ec2c8e ("dma-pool: Only allocate from CMA when in same memory zone")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 kernel/dma/pool.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/dma/pool.c b/kernel/dma/pool.c
index 06582b488e31..1281c0f0442b 100644
--- a/kernel/dma/pool.c
+++ b/kernel/dma/pool.c
@@ -84,7 +84,7 @@ static int atomic_pool_expand(struct gen_pool *pool, size_t pool_size,
 			      gfp_t gfp)
 {
 	unsigned int order;
-	struct page *page;
+	struct page *page = NULL;
 	void *addr;
 	int ret = -ENOMEM;
 
-- 
2.28.0
