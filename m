From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 04 Mar 2020 14:22:24 +0000
Subject: [PATCH] net/mlx5e: Fix an IS_ERR() vs NULL check
Message-Id: <20200304142151.qivcobp6ngrynb2p@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Saeed Mahameed <saeedm@mellanox.com>, Eli Cohen <eli@mellanox.com>
Cc: Leon Romanovsky <leon@kernel.org>, Mark Bloch <markb@mellanox.com>, Paul Blakey <paulb@mellanox.com>, linux-rdma@vger.kernel.org, kernel-janitors@vger.kernel.org

The esw_vport_tbl_get() function returns error pointers on error.

Fixes: 96e326878fa5 ("net/mlx5e: Eswitch, Use per vport tables for mirroring")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/net/ethernet/mellanox/mlx5/core/eswitch_offloads.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/mellanox/mlx5/core/eswitch_offloads.c b/drivers/net/ethernet/mellanox/mlx5/core/eswitch_offloads.c
index 4b5b6618dff4..692fe9e6a08f 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/eswitch_offloads.c
+++ b/drivers/net/ethernet/mellanox/mlx5/core/eswitch_offloads.c
@@ -198,7 +198,7 @@ int mlx5_esw_vport_tbl_get(struct mlx5_eswitch *esw)
 	mlx5_esw_for_all_vports(esw, i, vport) {
 		attr.in_rep->vport = vport->vport;
 		fdb = esw_vport_tbl_get(esw, &attr);
-		if (!fdb)
+		if (IS_ERR(fdb))
 			goto out;
 	}
 	return 0;
-- 
2.11.0
