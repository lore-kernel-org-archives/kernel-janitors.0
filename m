From: "Andrew F. Davis" <afd@ti.com>
Date: Wed, 15 Mar 2017 16:23:17 +0000
Subject: [PATCH 09/14] mlxsw: Remove unneeded conversions to bool
Message-Id: <20170315162322.12096-9-afd@ti.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Found with scripts/coccinelle/misc/boolconv.cocci.

Signed-off-by: Andrew F. Davis <afd@ti.com>
---
 drivers/net/ethernet/mellanox/mlxsw/switchx2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/mellanox/mlxsw/switchx2.c b/drivers/net/ethernet/mellanox/mlxsw/switchx2.c
index ec1e886d4566..a49532281b90 100644
--- a/drivers/net/ethernet/mellanox/mlxsw/switchx2.c
+++ b/drivers/net/ethernet/mellanox/mlxsw/switchx2.c
@@ -214,7 +214,7 @@ static int mlxsw_sx_port_oper_status_get(struct mlxsw_sx_port *mlxsw_sx_port,
 	if (err)
 		return err;
 	oper_status = mlxsw_reg_paos_oper_status_get(paos_pl);
-	*p_is_up = oper_status = MLXSW_PORT_ADMIN_STATUS_UP ? true : false;
+	*p_is_up = oper_status = MLXSW_PORT_ADMIN_STATUS_UP;
 	return 0;
 }
 
-- 
2.11.0

