From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sun, 26 Jan 2020 17:51:04 +0000
Subject: [PATCH] net/mlx5: Remove a useless 'drain_workqueue()' call in 'mlx5e_ipsec_cleanup()'
Message-Id: <20200126175104.17948-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: borisp@mellanox.com, saeedm@mellanox.com, leon@kernel.org, davem@davemloft.net
Cc: linux-rdma@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

'destroy_workqueue()' already calls 'drain_workqueue()', there is no need
to call it explicitly.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/net/ethernet/mellanox/mlx5/core/en_accel/ipsec.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/ethernet/mellanox/mlx5/core/en_accel/ipsec.c b/drivers/net/ethernet/mellanox/mlx5/core/en_accel/ipsec.c
index cf58c9637904..29626c6c9c25 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/en_accel/ipsec.c
+++ b/drivers/net/ethernet/mellanox/mlx5/core/en_accel/ipsec.c
@@ -433,7 +433,6 @@ void mlx5e_ipsec_cleanup(struct mlx5e_priv *priv)
 	if (!ipsec)
 		return;
 
-	drain_workqueue(ipsec->wq);
 	destroy_workqueue(ipsec->wq);
 
 	ida_destroy(&ipsec->halloc);
-- 
2.20.1
