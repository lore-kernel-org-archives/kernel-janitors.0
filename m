From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 24 Feb 2020 06:55:57 +0000
Subject: [PATCH] net/mlx5e: Fix error code in mlx5e_fec_in_caps()
Message-Id: <20200224065557.d23b4yd46kjnzfya@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Saeed Mahameed <saeedm@mellanox.com>, Aya Levin <ayal@mellanox.com>
Cc: Leon Romanovsky <leon@kernel.org>, Eran Ben Elisha <eranbe@mellanox.com>, linux-rdma@vger.kernel.org, kernel-janitors@vger.kernel.org

The mlx5e_fec_in_caps() function is type bool so these negative returns
become "return true;" when they should be "return false;"

Fixes: 2132b71f78d2 ("net/mlx5e: Advertise globaly supported FEC modes")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/net/ethernet/mellanox/mlx5/core/en/port.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/mellanox/mlx5/core/en/port.c b/drivers/net/ethernet/mellanox/mlx5/core/en/port.c
index 2c4a670c8ffd..b5ddf9bf2681 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/en/port.c
+++ b/drivers/net/ethernet/mellanox/mlx5/core/en/port.c
@@ -471,10 +471,10 @@ bool mlx5e_fec_in_caps(struct mlx5_core_dev *dev, int fec_policy)
 	int i;
 
 	if (!MLX5_CAP_GEN(dev, pcam_reg))
-		return -EOPNOTSUPP;
+		return false;
 
 	if (!MLX5_CAP_PCAM_REG(dev, pplm))
-		return -EOPNOTSUPP;
+		return false;
 
 	MLX5_SET(pplm_reg, in, local_port, 1);
 	err =  mlx5_core_access_reg(dev, in, sz, out, sz, MLX5_REG_PPLM, 0, 0);
-- 
2.11.0
