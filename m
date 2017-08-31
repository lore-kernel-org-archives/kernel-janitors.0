From: Colin King <colin.king@canonical.com>
Date: Thu, 31 Aug 2017 16:30:53 +0000
Subject: [PATCH][next] net/mlx4_core: fix memory leaks on error exit path
Message-Id: <20170831163053.2349-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tariq Toukan <tariqt-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>, netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

From: Colin Ian King <colin.king@canonical.com>

The structures hca_param and func_cap are not being kfree'd on an error
exit path causing two memory leaks. Fix this by jumping to the existing
free memory error exit path.

Detected by CoverityScan, CID#1455219, CID#1455224 ("Resource Leak")

Fixes: c73c8b1e47ca ("net/mlx4_core: Dynamically allocate structs at mlx4_slave_cap")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/ethernet/mellanox/mlx4/main.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/mellanox/mlx4/main.c b/drivers/net/ethernet/mellanox/mlx4/main.c
index 1c92101b3ec2..d46f3283ec36 100644
--- a/drivers/net/ethernet/mellanox/mlx4/main.c
+++ b/drivers/net/ethernet/mellanox/mlx4/main.c
@@ -977,7 +977,8 @@ static int mlx4_slave_cap(struct mlx4_dev *dev)
 	if (dev->caps.num_ports > MLX4_MAX_PORTS) {
 		mlx4_err(dev, "HCA has %d ports, but we only support %d, aborting\n",
 			 dev->caps.num_ports, MLX4_MAX_PORTS);
-		return -ENODEV;
+		err = -ENODEV;
+		goto free_mem;
 	}
 
 	mlx4_replace_zero_macs(dev);
-- 
2.14.1

