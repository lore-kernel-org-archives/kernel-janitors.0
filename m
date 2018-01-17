From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Wed, 17 Jan 2018 03:27:33 +0000
Subject: [PATCH net-next] mlxsw: spectrum: Make function mlxsw_sp_kvdl_part_occ() static
Message-Id: <1516159653-109657-1-git-send-email-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jiri Pirko <jiri@mellanox.com>, Ido Schimmel <idosch@mellanox.com>, Arkadi Sharshevsky <arkadis@mellanox.com>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

Fixes the following sparse warning:

drivers/net/ethernet/mellanox/mlxsw/spectrum_kvdl.c:289:5: warning:
 symbol 'mlxsw_sp_kvdl_part_occ' was not declared. Should it be static?

Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/net/ethernet/mellanox/mlxsw/spectrum_kvdl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/mellanox/mlxsw/spectrum_kvdl.c b/drivers/net/ethernet/mellanox/mlxsw/spectrum_kvdl.c
index cfacc17..55f9d2d 100644
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

