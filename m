From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 11 Jul 2015 22:20:55 +0000
Subject: [patch] net/xen-netback: off by one in BUG_ON() condition
Message-Id: <20150711222055.GA11708@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ian Campbell <ian.campbell@citrix.com>, Zoltan Kiss <zoltan.kiss@citrix.com>
Cc: Wei Liu <wei.liu2@citrix.com>, xen-devel@lists.xenproject.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

The > should be >=.  I also added spaces around the '-' operations so
the code is a little more consistent and matches the condition better.

Fixes: f53c3fe8dad7 ('xen-netback: Introduce TX grant mapping')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/net/xen-netback/netback.c b/drivers/net/xen-netback/netback.c
index 880d0d6..7d50711 100644
--- a/drivers/net/xen-netback/netback.c
+++ b/drivers/net/xen-netback/netback.c
@@ -1566,13 +1566,13 @@ static inline void xenvif_tx_dealloc_action(struct xenvif_queue *queue)
 		smp_rmb();
 
 		while (dc != dp) {
-			BUG_ON(gop - queue->tx_unmap_ops > MAX_PENDING_REQS);
+			BUG_ON(gop - queue->tx_unmap_ops >= MAX_PENDING_REQS);
 			pending_idx  				queue->dealloc_ring[pending_index(dc++)];
 
-			pending_idx_release[gop-queue->tx_unmap_ops] +			pending_idx_release[gop - queue->tx_unmap_ops]  				pending_idx;
-			queue->pages_to_unmap[gop-queue->tx_unmap_ops] +			queue->pages_to_unmap[gop - queue->tx_unmap_ops]  				queue->mmap_pages[pending_idx];
 			gnttab_set_unmap_op(gop,
 					    idx_to_kaddr(queue, pending_idx),
