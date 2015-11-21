From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 21 Nov 2015 10:18:00 +0000
Subject: [patch] C6X: fix build breakage
Message-Id: <20151121101800.GA1096@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

There is a missing curly brace so this code doesn't build.

Fixes: 84f2f1c6ad15 ('c6x: convert to dma_map_ops')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
I don't have a cross compiler set up so I'm not able to compile this
either.  :P

diff --git a/arch/c6x/kernel/dma.c b/arch/c6x/kernel/dma.c
index fd1d5c0..8b7db6e 100644
--- a/arch/c6x/kernel/dma.c
+++ b/arch/c6x/kernel/dma.c
@@ -58,7 +58,7 @@ static int c6x_dma_map_sg(struct device *dev, struct scatterlist *sglist,
 	struct scatterlist *sg;
 	int i;
 
-	for_each_sg(sglist, sg, nents, i)
+	for_each_sg(sglist, sg, nents, i) {
 		sg->dma_address = sg_phys(sg);
 		c6x_dma_sync(sg->dma_address, sg->length, dir);
 	}
