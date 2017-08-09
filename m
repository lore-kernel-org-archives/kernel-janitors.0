From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 09 Aug 2017 21:28:11 +0000
Subject: [PATCH] net/mlx5: Uninitialized variable in esw_add_uc_addr()
Message-Id: <20170809072418.e4x5xmbvboadhe5w@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Saeed Mahameed <saeedm@mellanox.com>
Cc: Matan Barak <matanb@mellanox.com>, Leon Romanovsky <leonro@mellanox.com>, linux-rdma@vger.kernel.org, kernel-janitors@vger.kernel.org

"err" isn't initialized if we hit the "goto fdb_add;".

Fixes: eeb66cdb6826 ("net/mlx5: Separate between E-Switch and MPFS")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/net/ethernet/mellanox/mlx5/core/eswitch.c b/drivers/net/ethernet/mellanox/mlx5/core/eswitch.c
index fd51f0ea8df9..baed45c0dabe 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/eswitch.c
+++ b/drivers/net/ethernet/mellanox/mlx5/core/eswitch.c
@@ -376,7 +376,7 @@ static int esw_add_uc_addr(struct mlx5_eswitch *esw, struct vport_addr *vaddr)
 {
 	u8 *mac = vaddr->node.addr;
 	u32 vport = vaddr->vport;
-	int err;
+	int err = 0;
 
 	/* Skip mlx5_mpfs_add_mac for PFs,
 	 * it is already done by the PF netdev in mlx5e_execute_l2_action
