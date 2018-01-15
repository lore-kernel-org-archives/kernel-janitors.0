From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Mon, 15 Jan 2018 10:43:03 +0000
Subject: [PATCH net-next] mlxsw: spectrum: qdiscs: Make function mlxsw_sp_qdisc_prio_unoffload static
Message-Id: <1516012983-994-1-git-send-email-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jiri Pirko <jiri@mellanox.com>, Ido Schimmel <idosch@mellanox.com>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

Fixes the following sparse warning:

drivers/net/ethernet/mellanox/mlxsw/spectrum_qdisc.c:464:1: warning:
 symbol 'mlxsw_sp_qdisc_prio_unoffload' was not declared. Should it be static?

Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/net/ethernet/mellanox/mlxsw/spectrum_qdisc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/mellanox/mlxsw/spectrum_qdisc.c b/drivers/net/ethernet/mellanox/mlxsw/spectrum_qdisc.c
index e11a0ab..fee9da8 100644
--- a/drivers/net/ethernet/mellanox/mlxsw/spectrum_qdisc.c
+++ b/drivers/net/ethernet/mellanox/mlxsw/spectrum_qdisc.c
@@ -460,7 +460,7 @@ int mlxsw_sp_setup_tc_red(struct mlxsw_sp_port *mlxsw_sp_port,
 	return 0;
 }
 
-void
+static void
 mlxsw_sp_qdisc_prio_unoffload(struct mlxsw_sp_port *mlxsw_sp_port,
 			      struct mlxsw_sp_qdisc *mlxsw_sp_qdisc,
 			      void *params)

