From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 03 Oct 2017 10:53:03 +0000
Subject: [PATCH 1/2 net-next] mlxsw: spectrum: Fix check for IS_ERR() instead of NULL
Message-Id: <20171003105303.u7yrzxknddmmerol@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jiri Pirko <jiri@mellanox.com>, Yotam Gigi <yotamg@mellanox.com>
Cc: Ido Schimmel <idosch@mellanox.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

mlxsw_afa_block_create() doesn't return error pointers, it returns NULL
on error.

Fixes: 0e14c7777acb ("mlxsw: spectrum: Add the multicast routing hardware logic")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/net/ethernet/mellanox/mlxsw/spectrum_mr_tcam.c b/drivers/net/ethernet/mellanox/mlxsw/spectrum_mr_tcam.c
index cda9e9ad10e3..5e4ccbf17e3d 100644
--- a/drivers/net/ethernet/mellanox/mlxsw/spectrum_mr_tcam.c
+++ b/drivers/net/ethernet/mellanox/mlxsw/spectrum_mr_tcam.c
@@ -239,8 +239,8 @@ mlxsw_sp_mr_tcam_afa_block_create(struct mlxsw_sp *mlxsw_sp,
 	int err;
 
 	afa_block = mlxsw_afa_block_create(mlxsw_sp->afa);
-	if (IS_ERR(afa_block))
-		return afa_block;
+	if (!afa_block)
+		return ERR_PTR(-ENOMEM);
 
 	err = mlxsw_afa_block_append_counter(afa_block, counter_index);
 	if (err)
