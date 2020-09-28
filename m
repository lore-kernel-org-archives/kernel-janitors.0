From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 28 Sep 2020 17:42:37 +0000
Subject: [PATCH 2/2 net-next] net/mlx5e: TC: Fix potential Oops in mlx5e_tc_unoffload_from_slow_path()
Message-Id: <20200928174237.GA446603@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <20200928174153.GA446008@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Saeed Mahameed <saeedm@nvidia.com>
Cc: Leon Romanovsky <leon@kernel.org>, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Vlad Buslov <vladbu@nvidia.com>, Ariel Levkovich <lariel@mellanox.com>, Roi Dayan <roid@mellanox.com>, netdev@vger.kernel.org, linux-rdma@vger.kernel.org, kernel-janitors@vger.kernel.org

If "slow_attr" is NULL then this function will Oops.

Fixes: c620b772152b ("net/mlx5: Refactor tc flow attributes structure")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/net/ethernet/mellanox/mlx5/core/en_tc.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/mellanox/mlx5/core/en_tc.c b/drivers/net/ethernet/mellanox/mlx5/core/en_tc.c
index 438fbcf478d1..854153d02778 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/en_tc.c
+++ b/drivers/net/ethernet/mellanox/mlx5/core/en_tc.c
@@ -1238,8 +1238,10 @@ mlx5e_tc_unoffload_from_slow_path(struct mlx5_eswitch *esw,
 	struct mlx5_flow_attr *slow_attr;
 
 	slow_attr = mlx5_alloc_flow_attr(MLX5_FLOW_NAMESPACE_FDB);
-	if (!slow_attr)
+	if (!slow_attr) {
 		mlx5_core_warn(flow->priv->mdev, "Unable to unoffload slow path rule\n");
+		return;
+	}
 
 	memcpy(slow_attr, flow->attr, ESW_FLOW_ATTR_SZ);
 	slow_attr->action = MLX5_FLOW_CONTEXT_ACTION_FWD_DEST;
-- 
2.28.0
