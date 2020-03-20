From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 20 Mar 2020 13:25:25 +0000
Subject: [PATCH] {IB,net}/mlx5: Remove unused variable
Message-Id: <20200320132525.GE95012@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Saeed Mahameed <saeedm@mellanox.com>
Cc: Leon Romanovsky <leon@kernel.org>, linux-rdma@vger.kernel.org, kernel-janitors@vger.kernel.org

The "key" variable is never initialized or used except to print out a
debug message.

Fixes: fc6a9f86f08a ("{IB,net}/mlx5: Assign mkey variant in mlx5_ib only")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/net/ethernet/mellanox/mlx5/core/mr.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/mellanox/mlx5/core/mr.c b/drivers/net/ethernet/mellanox/mlx5/core/mr.c
index fd3e6d217c3b..5286e8d5aa57 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/mr.c
+++ b/drivers/net/ethernet/mellanox/mlx5/core/mr.c
@@ -44,7 +44,6 @@ int mlx5_core_create_mkey(struct mlx5_core_dev *dev,
 	u32 mkey_index;
 	void *mkc;
 	int err;
-	u8 key;
 
 	MLX5_SET(create_mkey_in, in, opcode, MLX5_CMD_OP_CREATE_MKEY);
 
@@ -59,8 +58,8 @@ int mlx5_core_create_mkey(struct mlx5_core_dev *dev,
 	mkey->key |= mlx5_idx_to_mkey(mkey_index);
 	mkey->pd = MLX5_GET(mkc, mkc, pd);
 
-	mlx5_core_dbg(dev, "out 0x%x, key 0x%x, mkey 0x%x\n",
-		      mkey_index, key, mkey->key);
+	mlx5_core_dbg(dev, "out 0x%x, mkey 0x%x\n",
+		      mkey_index, mkey->key);
 	return 0;
 }
 EXPORT_SYMBOL(mlx5_core_create_mkey);
-- 
2.25.1
