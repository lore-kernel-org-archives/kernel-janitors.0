From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 28 Sep 2020 17:41:53 +0000
Subject: [PATCH 1/2 net-next] net/mlx5e: TC: Fix IS_ERR() vs NULL checks
Message-Id: <20200928174153.GA446008@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Saeed Mahameed <saeedm@nvidia.com>
Cc: Leon Romanovsky <leon@kernel.org>, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Roi Dayan <roid@mellanox.com>, Ariel Levkovich <lariel@mellanox.com>, netdev@vger.kernel.org, linux-rdma@vger.kernel.org, kernel-janitors@vger.kernel.org

The mlx5_tc_ct_init() function doesn't return error pointers it returns
NULL.  Also we need to set the error codes on this path.

Fixes: aedd133d17bc ("net/mlx5e: Support CT offload for tc nic flows")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/net/ethernet/mellanox/mlx5/core/en_tc.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/mellanox/mlx5/core/en_tc.c b/drivers/net/ethernet/mellanox/mlx5/core/en_tc.c
index 104b1c339de0..438fbcf478d1 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/en_tc.c
+++ b/drivers/net/ethernet/mellanox/mlx5/core/en_tc.c
@@ -5224,8 +5224,10 @@ int mlx5e_tc_nic_init(struct mlx5e_priv *priv)
 
 	tc->ct = mlx5_tc_ct_init(priv, tc->chains, &priv->fs.tc.mod_hdr,
 				 MLX5_FLOW_NAMESPACE_KERNEL);
-	if (IS_ERR(tc->ct))
+	if (!tc->ct) {
+		err = -ENOMEM;
 		goto err_ct;
+	}
 
 	tc->netdevice_nb.notifier_call = mlx5e_tc_netdev_event;
 	err = register_netdevice_notifier_dev_net(priv->netdev,
@@ -5300,8 +5300,10 @@ int mlx5e_tc_esw_init(struct rhashtable *tc_ht)
 					       esw_chains(esw),
 					       &esw->offloads.mod_hdr,
 					       MLX5_FLOW_NAMESPACE_FDB);
-	if (IS_ERR(uplink_priv->ct_priv))
+	if (!uplink_priv->ct_priv) {
+		err = -ENOMEM;
 		goto err_ct;
+	}
 
 	mapping = mapping_create(sizeof(struct tunnel_match_key),
 				 TUNNEL_INFO_BITS_MASK, true);
-- 
2.28.0
