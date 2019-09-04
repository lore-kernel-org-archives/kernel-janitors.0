From: Colin King <colin.king@canonical.com>
Date: Wed, 04 Sep 2019 19:29:14 +0000
Subject: [PATCH][next] net/mlx5: fix missing assignment of variable err
Message-Id: <20190904192914.19684-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Maor Gottlieb <maorg@mellanox.com>, Saeed Mahameed <saeedm@mellanox.com>, Leon Romanovsky <leon@kernel.org>, "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org, linux-rdma@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The error return from a call to mlx5_flow_namespace_set_peer is not
being assigned to variable err and hence the error check following
the call is currently not working.  Fix this by assigning ret as
intended.

Addresses-Coverity: ("Logically dead code")
Fixes: 8463daf17e80 ("net/mlx5: Add support to use SMFS in switchdev mode")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/ethernet/mellanox/mlx5/core/eswitch_offloads.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/mellanox/mlx5/core/eswitch_offloads.c b/drivers/net/ethernet/mellanox/mlx5/core/eswitch_offloads.c
index afa623b15a38..00d71db15f22 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/eswitch_offloads.c
+++ b/drivers/net/ethernet/mellanox/mlx5/core/eswitch_offloads.c
@@ -1651,7 +1651,7 @@ static int mlx5_esw_offloads_set_ns_peer(struct mlx5_eswitch *esw,
 		if (err)
 			return err;
 
-		mlx5_flow_namespace_set_peer(peer_ns, ns);
+		err = mlx5_flow_namespace_set_peer(peer_ns, ns);
 		if (err) {
 			mlx5_flow_namespace_set_peer(ns, NULL);
 			return err;
-- 
2.20.1
