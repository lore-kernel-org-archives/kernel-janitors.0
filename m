From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Mon, 12 Mar 2018 12:25:24 +0000
Subject: [PATCH net-next] mlxsw: spectrum_kvdl: Make some functions static
Message-Id: <1520857524-163487-1-git-send-email-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180312122459.GC2111@nanopsycho>
In-Reply-To: <20180312122459.GC2111@nanopsycho>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jiri Pirko <jiri@mellanox.com>, Ido Schimmel <idosch@mellanox.com>, rkadi Sharshevsky <arkadis@mellanox.com>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

Fixes the following sparse warnings:

drivers/net/ethernet/mellanox/mlxsw/spectrum_kvdl.c:371:5: warning:
 symbol 'mlxsw_sp_kvdl_single_occ_get' was not declared. Should it be static?
drivers/net/ethernet/mellanox/mlxsw/spectrum_kvdl.c:384:5: warning:
 symbol 'mlxsw_sp_kvdl_chunks_occ_get' was not declared. Should it be static?
drivers/net/ethernet/mellanox/mlxsw/spectrum_kvdl.c:397:5: warning:
 symbol 'mlxsw_sp_kvdl_large_chunks_occ_get' was not declared. Should it be static?

Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/net/ethernet/mellanox/mlxsw/spectrum_kvdl.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/mellanox/mlxsw/spectrum_kvdl.c b/drivers/net/ethernet/mellanox/mlxsw/spectrum_kvdl.c
index 059eb32..4c9bff2 100644
--- a/drivers/net/ethernet/mellanox/mlxsw/spectrum_kvdl.c
+++ b/drivers/net/ethernet/mellanox/mlxsw/spectrum_kvdl.c
@@ -368,7 +368,7 @@ u64 mlxsw_sp_kvdl_occ_get(const struct mlxsw_sp *mlxsw_sp)
 	return occ;
 }
 
-u64 mlxsw_sp_kvdl_single_occ_get(struct devlink *devlink)
+static u64 mlxsw_sp_kvdl_single_occ_get(struct devlink *devlink)
 {
 	struct mlxsw_core *mlxsw_core = devlink_priv(devlink);
 	struct mlxsw_sp *mlxsw_sp = mlxsw_core_driver_priv(mlxsw_core);
@@ -381,7 +381,7 @@ u64 mlxsw_sp_kvdl_single_occ_get(struct devlink *devlink)
 	return mlxsw_sp_kvdl_part_occ(part);
 }
 
-u64 mlxsw_sp_kvdl_chunks_occ_get(struct devlink *devlink)
+static u64 mlxsw_sp_kvdl_chunks_occ_get(struct devlink *devlink)
 {
 	struct mlxsw_core *mlxsw_core = devlink_priv(devlink);
 	struct mlxsw_sp *mlxsw_sp = mlxsw_core_driver_priv(mlxsw_core);
@@ -394,7 +394,7 @@ u64 mlxsw_sp_kvdl_chunks_occ_get(struct devlink *devlink)
 	return mlxsw_sp_kvdl_part_occ(part);
 }
 
-u64 mlxsw_sp_kvdl_large_chunks_occ_get(struct devlink *devlink)
+static u64 mlxsw_sp_kvdl_large_chunks_occ_get(struct devlink *devlink)
 {
 	struct mlxsw_core *mlxsw_core = devlink_priv(devlink);
 	struct mlxsw_sp *mlxsw_sp = mlxsw_core_driver_priv(mlxsw_core);

