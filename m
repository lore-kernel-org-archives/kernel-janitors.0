From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 28 Sep 2020 09:05:56 +0000
Subject: [PATCH net-next] net/mlx5e: Fix a use after free on error in mlx5_tc_ct_shared_counter_get()
Message-Id: <20200928090556.GA377727@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Saeed Mahameed <saeedm@nvidia.com>
Cc: Leon Romanovsky <leon@kernel.org>, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Roi Dayan <roid@mellanox.com>, Oz Shlomo <ozsh@mellanox.com>, Paul Blakey <paulb@mellanox.com>, Eli Britstein <elibr@mellanox.com>, Ariel Levkovich <lariel@nvidia.com>, netdev@vger.kernel.org, linux-rdma@vger.kernel.org, kernel-janitors@vger.kernel.org

This code frees "shared_counter" and then dereferences on the next line
to get the error code.

Fixes: 1edae2335adf ("net/mlx5e: CT: Use the same counter for both directions")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/net/ethernet/mellanox/mlx5/core/en/tc_ct.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/mellanox/mlx5/core/en/tc_ct.c b/drivers/net/ethernet/mellanox/mlx5/core/en/tc_ct.c
index b5f8ed30047b..cea2070af9af 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/en/tc_ct.c
+++ b/drivers/net/ethernet/mellanox/mlx5/core/en/tc_ct.c
@@ -739,6 +739,7 @@ mlx5_tc_ct_shared_counter_get(struct mlx5_tc_ct_priv *ct_priv,
 	struct mlx5_core_dev *dev = ct_priv->dev;
 	struct mlx5_ct_entry *rev_entry;
 	__be16 tmp_port;
+	int ret;
 
 	/* get the reversed tuple */
 	tmp_port = rev_tuple.port.src;
@@ -778,8 +779,9 @@ mlx5_tc_ct_shared_counter_get(struct mlx5_tc_ct_priv *ct_priv,
 	shared_counter->counter = mlx5_fc_create(dev, true);
 	if (IS_ERR(shared_counter->counter)) {
 		ct_dbg("Failed to create counter for ct entry");
+		ret = PTR_ERR(shared_counter->counter);
 		kfree(shared_counter);
-		return ERR_PTR(PTR_ERR(shared_counter->counter));
+		return ERR_PTR(ret);
 	}
 
 	refcount_set(&shared_counter->refcount, 1);
-- 
2.28.0
