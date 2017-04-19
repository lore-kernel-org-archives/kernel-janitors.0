From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 19 Apr 2017 09:59:15 +0000
Subject: [PATCH net-next] net/mlx5e: IPoIB, Fix error handling in mlx5_rdma_netdev_alloc()
Message-Id: <20170419095914.GB4266@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Saeed Mahameed <saeedm@mellanox.com>
Cc: Matan Barak <matanb@mellanox.com>, Leon Romanovsky <leonro@mellanox.com>, netdev@vger.kernel.org, linux-rdma@vger.kernel.org, kernel-janitors@vger.kernel.org

The labels were out of order, so it either could result in an Oops or a
leak.

Fixes: 48935bbb7ae8 ("net/mlx5e: IPoIB, Add netdevice profile skeleton")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/net/ethernet/mellanox/mlx5/core/ipoib.c b/drivers/net/ethernet/mellanox/mlx5/core/ipoib.c
index 001d2953cb6d..ec78e637840f 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/ipoib.c
+++ b/drivers/net/ethernet/mellanox/mlx5/core/ipoib.c
@@ -471,10 +471,11 @@ struct net_device *mlx5_rdma_netdev_alloc(struct mlx5_core_dev *mdev,
 	 */
 	return netdev;
 
-free_mdev_resources:
-	mlx5e_destroy_mdev_resources(mdev);
 err_free_netdev:
 	free_netdev(netdev);
+free_mdev_resources:
+	mlx5e_destroy_mdev_resources(mdev);
+
 	return NULL;
 }
 EXPORT_SYMBOL(mlx5_rdma_netdev_alloc);
