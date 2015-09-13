From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sun, 13 Sep 2015 12:15:19 +0000
Subject: [PATCH 26/39] dmaengine: drop null test before destroy functions
Message-Id: <1442146532-9100-27-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1442146532-9100-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1442146532-9100-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vinod Koul <vinod.koul@intel.com>
Cc: sergey.senozhatsky@gmail.com, kernel-janitors@vger.kernel.org, Dan Williams <dan.j.williams@intel.com>, dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org

Remove unneeded NULL test.

The semantic patch that makes this change is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@ expression x; @@
-if (x != NULL)
  \(kmem_cache_destroy\|mempool_destroy\|dma_pool_destroy\)(x);
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/dma/dmaengine.c |    6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/dma/dmaengine.c b/drivers/dma/dmaengine.c
index 3ff284c..45df9a4 100644
--- a/drivers/dma/dmaengine.c
+++ b/drivers/dma/dmaengine.c
@@ -1066,11 +1066,9 @@ static void dmaengine_destroy_unmap_pool(void)
 	for (i = 0; i < ARRAY_SIZE(unmap_pool); i++) {
 		struct dmaengine_unmap_pool *p = &unmap_pool[i];
 
-		if (p->pool)
-			mempool_destroy(p->pool);
+		mempool_destroy(p->pool);
 		p->pool = NULL;
-		if (p->cache)
-			kmem_cache_destroy(p->cache);
+		kmem_cache_destroy(p->cache);
 		p->cache = NULL;
 	}
 }

