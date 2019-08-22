From: YueHaibing <yuehaibing@huawei.com>
Date: Thu, 22 Aug 2019 06:52:19 +0000
Subject: [PATCH net-next] net/mlx5e: Use PTR_ERR_OR_ZERO in mlx5e_tc_add_nic_flow()
Message-Id: <20190822065219.73945-1-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Saeed Mahameed <saeedm@mellanox.com>, Leon Romanovsky <leon@kernel.org>, davem@davemloft.net
Cc: YueHaibing <yuehaibing@huawei.com>, netdev@vger.kernel.org, linux-rdma@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Use PTR_ERR_OR_ZERO rather than if(IS_ERR(...)) + PTR_ERR

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/net/ethernet/mellanox/mlx5/core/en_tc.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/mellanox/mlx5/core/en_tc.c b/drivers/net/ethernet/mellanox/mlx5/core/en_tc.c
index 3917834b48ff..9d38c9e88f76 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/en_tc.c
+++ b/drivers/net/ethernet/mellanox/mlx5/core/en_tc.c
@@ -985,10 +985,7 @@ mlx5e_tc_add_nic_flow(struct mlx5e_priv *priv,
 					    &flow_act, dest, dest_ix);
 	mutex_unlock(&priv->fs.tc.t_lock);
 
-	if (IS_ERR(flow->rule[0]))
-		return PTR_ERR(flow->rule[0]);
-
-	return 0;
+	return PTR_ERR_OR_ZERO(flow->rule[0]);
 }
 
 static void mlx5e_tc_del_nic_flow(struct mlx5e_priv *priv,
