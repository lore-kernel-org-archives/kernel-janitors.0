From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 11 Jul 2012 06:34:07 +0000
Subject: [patch] net/mlx4_en: dereferencing freed memory
Message-Id: <20120711063407.GD11812@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Yevgeny Petrilin <yevgenyp@mellanox.co.il>
Cc: "David S. Miller" <davem@davemloft.net>, Amir Vadai <amirv@mellanox.com>, Or Gerlitz <ogerlitz@mellanox.com>, Alexander Guller <alexg@mellanox.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

We dereferenced "mclist" after the kfree().

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/net/ethernet/mellanox/mlx4/en_netdev.c b/drivers/net/ethernet/mellanox/mlx4/en_netdev.c
index 94375a8..4ce5ca8 100644
--- a/drivers/net/ethernet/mellanox/mlx4/en_netdev.c
+++ b/drivers/net/ethernet/mellanox/mlx4/en_netdev.c
@@ -503,9 +503,7 @@ static void mlx4_en_do_set_multicast(struct work_struct *work)
 				/* remove from list */
 				list_del(&mclist->list);
 				kfree(mclist);
-			}
-
-			if (mclist->action = MCLIST_ADD) {
+			} else if (mclist->action = MCLIST_ADD) {
 				/* attach the address */
 				memcpy(&mc_list[10], mclist->addr, ETH_ALEN);
 				/* needed for B0 steering support */
