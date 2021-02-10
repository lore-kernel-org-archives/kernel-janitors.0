From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 10 Feb 2021 11:06:28 +0000
Subject: [PATCH net-next] net/mlx5: Fix a NULL vs IS_ERR() check
Message-Id: <YCO+NCjissLTG1H6@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Saeed Mahameed <saeedm@nvidia.com>, Vlad Buslov <vladbu@nvidia.com>
Cc: Leon Romanovsky <leon@kernel.org>, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Dmytro Linkin <dlinkin@nvidia.com>, Roi Dayan <roid@nvidia.com>, netdev@vger.kernel.org, linux-rdma@vger.kernel.org, kernel-janitors@vger.kernel.org

The mlx5_chains_get_table() function doesn't return NULL, it returns
error pointers so we need to fix this condition.

Fixes: 34ca65352ddf ("net/mlx5: E-Switch, Indirect table infrastructure")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
This applies to net-next but it might actually go through a different
tree before going to net?  I don't know how this works...

 drivers/net/ethernet/mellanox/mlx5/core/esw/indir_table.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/mellanox/mlx5/core/esw/indir_table.c b/drivers/net/ethernet/mellanox/mlx5/core/esw/indir_table.c
index b7d00c4c7046..6f6772bf61a2 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/esw/indir_table.c
+++ b/drivers/net/ethernet/mellanox/mlx5/core/esw/indir_table.c
@@ -216,7 +216,7 @@ static int mlx5_esw_indir_table_rule_get(struct mlx5_eswitch *esw,
 	flow_act.flags = FLOW_ACT_IGNORE_FLOW_LEVEL | FLOW_ACT_NO_APPEND;
 	dest.type = MLX5_FLOW_DESTINATION_TYPE_FLOW_TABLE;
 	dest.ft = mlx5_chains_get_table(chains, 0, 1, 0);
-	if (!dest.ft) {
+	if (IS_ERR(dest.ft)) {
 		err = PTR_ERR(dest.ft);
 		goto err_table;
 	}
-- 
2.30.0
