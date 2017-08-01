From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 01 Aug 2017 11:01:01 +0000
Subject: [PATCH] net/mlx5: add a missing tab
Message-Id: <20170801110101.mf2i5e2mes4ftmkj@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Saeed Mahameed <saeedm-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
Cc: Matan Barak <matanb-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>, Leon Romanovsky <leonro-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>, linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

The code works as intended, but the indenting is confusing.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/net/ethernet/mellanox/mlx5/core/sriov.c b/drivers/net/ethernet/mellanox/mlx5/core/sriov.c
index 28d8472b36f1..c410360da58d 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/sriov.c
+++ b/drivers/net/ethernet/mellanox/mlx5/core/sriov.c
@@ -113,7 +113,7 @@ static int mlx5_device_enable_sriov(struct mlx5_core_dev *dev, int num_vfs)
 				mlx5_core_warn(dev,
 					       "failed to restore VF %d settings, err %d\n",
 					       vf, err);
-			continue;
+				continue;
 			}
 		}
 		mlx5_core_dbg(dev, "successfully enabled VF* %d\n", vf);
