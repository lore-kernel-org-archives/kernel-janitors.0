From: Colin King <colin.king@canonical.com>
Date: Wed, 11 Sep 2019 14:18:11 +0000
Subject: [PATCH] mlx4: fix spelling mistake "veify" -> "verify"
Message-Id: <20190911141811.8370-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tariq Toukan <tariqt@mellanox.com>, "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org, linux-rdma@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in a mlx4_err error message. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/ethernet/mellanox/mlx4/main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/mellanox/mlx4/main.c b/drivers/net/ethernet/mellanox/mlx4/main.c
index 07c204bd3fc4..a48a40c1278e 100644
--- a/drivers/net/ethernet/mellanox/mlx4/main.c
+++ b/drivers/net/ethernet/mellanox/mlx4/main.c
@@ -2240,7 +2240,7 @@ static int mlx4_validate_optimized_steering(struct mlx4_dev *dev)
 	for (i = 1; i <= dev->caps.num_ports; i++) {
 		if (mlx4_dev_port(dev, i, &port_cap)) {
 			mlx4_err(dev,
-				 "QUERY_DEV_CAP command failed, can't veify DMFS high rate steering.\n");
+				 "QUERY_DEV_CAP command failed, can't verify DMFS high rate steering.\n");
 		} else if ((dev->caps.dmfs_high_steer_mode ! 			    MLX4_STEERING_DMFS_A0_DEFAULT) &&
 			   (port_cap.dmfs_optimized_state =
-- 
2.20.1
