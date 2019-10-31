From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Thu, 31 Oct 2019 05:53:45 +0000
Subject: [PATCH] cxgb4/l2t: Simplify 't4_l2e_free()' and '_t4_l2e_free()'
Message-Id: <20191031055345.32487-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: davem@davemloft.net, vishal@chelsio.com
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Use '__skb_queue_purge()' instead of re-implementing it.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/net/ethernet/chelsio/cxgb4/l2t.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/chelsio/cxgb4/l2t.c b/drivers/net/ethernet/chelsio/cxgb4/l2t.c
index 1a407d3c1d67..e9e45006632d 100644
--- a/drivers/net/ethernet/chelsio/cxgb4/l2t.c
+++ b/drivers/net/ethernet/chelsio/cxgb4/l2t.c
@@ -351,15 +351,13 @@ static struct l2t_entry *find_or_alloc_l2e(struct l2t_data *d, u16 vlan,
 static void _t4_l2e_free(struct l2t_entry *e)
 {
 	struct l2t_data *d;
-	struct sk_buff *skb;
 
 	if (atomic_read(&e->refcnt) = 0) {  /* hasn't been recycled */
 		if (e->neigh) {
 			neigh_release(e->neigh);
 			e->neigh = NULL;
 		}
-		while ((skb = __skb_dequeue(&e->arpq)) != NULL)
-			kfree_skb(skb);
+		__skb_queue_purge(&e->arpq);
 	}
 
 	d = container_of(e, struct l2t_data, l2tab[e->idx]);
@@ -370,7 +368,6 @@ static void _t4_l2e_free(struct l2t_entry *e)
 static void t4_l2e_free(struct l2t_entry *e)
 {
 	struct l2t_data *d;
-	struct sk_buff *skb;
 
 	spin_lock_bh(&e->lock);
 	if (atomic_read(&e->refcnt) = 0) {  /* hasn't been recycled */
@@ -378,8 +375,7 @@ static void t4_l2e_free(struct l2t_entry *e)
 			neigh_release(e->neigh);
 			e->neigh = NULL;
 		}
-		while ((skb = __skb_dequeue(&e->arpq)) != NULL)
-			kfree_skb(skb);
+		__skb_queue_purge(&e->arpq);
 	}
 	spin_unlock_bh(&e->lock);
 
-- 
2.20.1
