From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Thu, 12 Dec 2019 12:00:55 +0000
Subject: [PATCH net-next] wireguard: Using kfree_rcu() to simplify the code
Message-Id: <20191212120055.129801-1-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Jason A . Donenfeld" <Jason@zx2c4.com>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, wireguard@lists.zx2c4.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

The callback function of call_rcu() just calls a kfree(), so we
can use kfree_rcu() instead of call_rcu() + callback function.

Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/net/wireguard/allowedips.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/net/wireguard/allowedips.c b/drivers/net/wireguard/allowedips.c
index 72667d5399c3..121d9ea0f135 100644
--- a/drivers/net/wireguard/allowedips.c
+++ b/drivers/net/wireguard/allowedips.c
@@ -31,11 +31,6 @@ static void copy_and_assign_cidr(struct allowedips_node *node, const u8 *src,
 #define CHOOSE_NODE(parent, key) \
 	parent->bit[(key[parent->bit_at_a] >> parent->bit_at_b) & 1]
 
-static void node_free_rcu(struct rcu_head *rcu)
-{
-	kfree(container_of(rcu, struct allowedips_node, rcu));
-}
-
 static void push_rcu(struct allowedips_node **stack,
 		     struct allowedips_node __rcu *p, unsigned int *len)
 {
@@ -112,7 +107,7 @@ static void walk_remove_by_peer(struct allowedips_node __rcu **top,
 				if (!node->bit[0] || !node->bit[1]) {
 					rcu_assign_pointer(*nptr, DEREF(
 					       &node->bit[!REF(node->bit[0])]));
-					call_rcu(&node->rcu, node_free_rcu);
+					kfree_rcu(node, rcu);
 					node = DEREF(nptr);
 				}
 			}
