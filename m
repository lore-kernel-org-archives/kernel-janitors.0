From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Tue, 08 May 2018 05:44:27 +0000
Subject: [PATCH] iw_cxgb4: Fix an error handling path in 'c4iw_get_dma_mr()'
Message-Id: <20180508054427.10697-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: swise@chelsio.com, dledford@redhat.com, jgg@ziepe.ca
Cc: linux-rdma@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

The error handling path of 'c4iw_get_dma_mr()' does not free resources
in the correct order.
If an error occures, it can leak 'mhp->wr_waitp'.

Fixes: a3f12da0e99a ("iw_cxgb4: allocate wait object for each memory object")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/infiniband/hw/cxgb4/mem.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/infiniband/hw/cxgb4/mem.c b/drivers/infiniband/hw/cxgb4/mem.c
index e90f2fd8dc16..1445918e3239 100644
--- a/drivers/infiniband/hw/cxgb4/mem.c
+++ b/drivers/infiniband/hw/cxgb4/mem.c
@@ -489,10 +489,10 @@ struct ib_mr *c4iw_get_dma_mr(struct ib_pd *pd, int acc)
 err_dereg_mem:
 	dereg_mem(&rhp->rdev, mhp->attr.stag, mhp->attr.pbl_size,
 		  mhp->attr.pbl_addr, mhp->dereg_skb, mhp->wr_waitp);
-err_free_wr_wait:
-	c4iw_put_wr_wait(mhp->wr_waitp);
 err_free_skb:
 	kfree_skb(mhp->dereg_skb);
+err_free_wr_wait:
+	c4iw_put_wr_wait(mhp->wr_waitp);
 err_free_mhp:
 	kfree(mhp);
 	return ERR_PTR(ret);
-- 
2.17.0

