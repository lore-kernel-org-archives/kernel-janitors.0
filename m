From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 11 Jun 2015 08:50:01 +0000
Subject: [patch -next] net/mlx5_core: fix an error code
Message-Id: <20150611085001.GB27393@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Eli Cohen <eli@mellanox.com>, Amir Vadai <amirv@mellanox.com>
Cc: netdev@vger.kernel.org, linux-rdma@vger.kernel.org, kernel-janitors@vger.kernel.org

We return success if mlx5e_alloc_sq_db() fails but we should return an
error code.

Fixes: f62b8bb8f2d3 ('net/mlx5: Extend mlx5_core to support ConnectX-4 Ethernet functionality')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/net/ethernet/mellanox/mlx5/core/en_main.c b/drivers/net/ethernet/mellanox/mlx5/core/en_main.c
index 7348c51..075e517 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/en_main.c
+++ b/drivers/net/ethernet/mellanox/mlx5/core/en_main.c
@@ -525,7 +525,8 @@ static int mlx5e_create_sq(struct mlx5e_channel *c,
 	sq->uar_map     = sq->uar.map;
 	sq->bf_buf_size = (1 << MLX5_CAP_GEN(mdev, log_bf_reg_size)) / 2;
 
-	if (mlx5e_alloc_sq_db(sq, cpu_to_node(c->cpu)))
+	err = mlx5e_alloc_sq_db(sq, cpu_to_node(c->cpu));
+	if (err)
 		goto err_sq_wq_destroy;
 
 	sq->txq = netdev_get_tx_queue(priv->netdev,
