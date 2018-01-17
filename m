From: Colin King <colin.king@canonical.com>
Date: Wed, 17 Jan 2018 10:57:46 +0000
Subject: [PATCH][next] mlxsw: spectrum: make function mlxsw_sp_kvdl_part_occ static
Message-Id: <20180117105746.19646-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jiri Pirko <jiri@mellanox.com>, Ido Schimmel <idosch@mellanox.com>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The function mlxsw_sp_kvdl_part_occ  is local to the source and does
not need to be in global scope, so make it static.

Cleans up sparse warning:
symbol 'mlxsw_sp_kvdl_part_occ' was not declared. Should it be static?

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/ethernet/mellanox/mlxsw/spectrum_kvdl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/mellanox/mlxsw/spectrum_kvdl.c b/drivers/net/ethernet/mellanox/mlxsw/spectrum_kvdl.c
index cfacc176a1bd..55f9d2d70f9e 100644
--- a/drivers/net/ethernet/mellanox/mlxsw/spectrum_kvdl.c
+++ b/drivers/net/ethernet/mellanox/mlxsw/spectrum_kvdl.c
@@ -286,7 +286,7 @@ static void mlxsw_sp_kvdl_parts_fini(struct mlxsw_sp *mlxsw_sp)
 		mlxsw_sp_kvdl_part_fini(mlxsw_sp, i);
 }
 
-u64 mlxsw_sp_kvdl_part_occ(struct mlxsw_sp_kvdl_part *part)
+static u64 mlxsw_sp_kvdl_part_occ(struct mlxsw_sp_kvdl_part *part)
 {
 	unsigned int nr_entries;
 	int bit = -1;
-- 
2.15.1

