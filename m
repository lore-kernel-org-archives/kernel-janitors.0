From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sun, 13 Sep 2015 12:15:14 +0000
Subject: [PATCH 21/39] drbd: drop null test before destroy functions
Message-Id: <1442146532-9100-22-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1442146532-9100-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1442146532-9100-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lars Ellenberg <drbd-dev@lists.linbit.com>
Cc: sergey.senozhatsky@gmail.com, kernel-janitors@vger.kernel.org, drbd-user@lists.linbit.com, linux-kernel@vger.kernel.org

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
 drivers/block/drbd/drbd_main.c |   21 +++++++--------------
 1 file changed, 7 insertions(+), 14 deletions(-)

diff --git a/drivers/block/drbd/drbd_main.c b/drivers/block/drbd/drbd_main.c
index 74d97f4..d98eeec 100644
--- a/drivers/block/drbd/drbd_main.c
+++ b/drivers/block/drbd/drbd_main.c
@@ -2034,20 +2034,13 @@ static void drbd_destroy_mempools(void)
 
 	if (drbd_md_io_bio_set)
 		bioset_free(drbd_md_io_bio_set);
-	if (drbd_md_io_page_pool)
-		mempool_destroy(drbd_md_io_page_pool);
-	if (drbd_ee_mempool)
-		mempool_destroy(drbd_ee_mempool);
-	if (drbd_request_mempool)
-		mempool_destroy(drbd_request_mempool);
-	if (drbd_ee_cache)
-		kmem_cache_destroy(drbd_ee_cache);
-	if (drbd_request_cache)
-		kmem_cache_destroy(drbd_request_cache);
-	if (drbd_bm_ext_cache)
-		kmem_cache_destroy(drbd_bm_ext_cache);
-	if (drbd_al_ext_cache)
-		kmem_cache_destroy(drbd_al_ext_cache);
+	mempool_destroy(drbd_md_io_page_pool);
+	mempool_destroy(drbd_ee_mempool);
+	mempool_destroy(drbd_request_mempool);
+	kmem_cache_destroy(drbd_ee_cache);
+	kmem_cache_destroy(drbd_request_cache);
+	kmem_cache_destroy(drbd_bm_ext_cache);
+	kmem_cache_destroy(drbd_al_ext_cache);
 
 	drbd_md_io_bio_set   = NULL;
 	drbd_md_io_page_pool = NULL;

