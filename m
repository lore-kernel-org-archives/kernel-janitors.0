From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 24 Nov 2016 11:03:45 +0000
Subject: [patch] net/mlx5: remove a duplicate condition
Message-Id: <20161124110345.GC17225@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Saeed Mahameed <saeedm-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
Cc: Matan Barak <matanb-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>, Leon Romanovsky <leonro-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>, netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

We verified that MLX5_FLOW_CONTEXT_ACTION_COUNT was set on the first
line of the function so we don't need to check again here.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Not a bugfix so it would go into -next

diff --git a/drivers/net/ethernet/mellanox/mlx5/core/fs_core.c b/drivers/net/ethernet/mellanox/mlx5/core/fs_core.c
index 68ec4ea..a263d89 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/fs_core.c
+++ b/drivers/net/ethernet/mellanox/mlx5/core/fs_core.c
@@ -1307,8 +1307,7 @@ static bool counter_is_valid(struct mlx5_fc *counter, u32 action)
 		return false;
 
 	return (action & (MLX5_FLOW_CONTEXT_ACTION_DROP |
-			  MLX5_FLOW_CONTEXT_ACTION_FWD_DEST)) &&
-		(action & MLX5_FLOW_CONTEXT_ACTION_COUNT);
+			  MLX5_FLOW_CONTEXT_ACTION_FWD_DEST));
 }
 
 static bool dest_is_valid(struct mlx5_flow_destination *dest,
