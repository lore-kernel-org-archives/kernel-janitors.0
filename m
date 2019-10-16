From: "Andrew F. Davis" <afd@ti.com>
Date: Wed, 16 Oct 2019 18:19:39 +0000
Subject: [PATCH 05/10] mlxsw: Remove unneeded conversions to bool
Message-Id: <20191016181944.25106-2-afd@ti.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191016181944.25106-1-afd@ti.com>
In-Reply-To: <20191016181944.25106-1-afd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jiri Kosina <trivial@kernel.org>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, "Andrew F . Davis" <afd@ti.com>

Found with scripts/coccinelle/misc/boolconv.cocci.

Signed-off-by: Andrew F. Davis <afd@ti.com>
---
 drivers/net/ethernet/mellanox/mlxsw/switchx2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/mellanox/mlxsw/switchx2.c b/drivers/net/ethernet/mellanox/mlxsw/switchx2.c
index 1c14c051ee52..1de6a9c6cd00 100644
--- a/drivers/net/ethernet/mellanox/mlxsw/switchx2.c
+++ b/drivers/net/ethernet/mellanox/mlxsw/switchx2.c
@@ -180,7 +180,7 @@ static int mlxsw_sx_port_oper_status_get(struct mlxsw_sx_port *mlxsw_sx_port,
 	if (err)
 		return err;
 	oper_status = mlxsw_reg_paos_oper_status_get(paos_pl);
-	*p_is_up = oper_status = MLXSW_PORT_ADMIN_STATUS_UP ? true : false;
+	*p_is_up = oper_status = MLXSW_PORT_ADMIN_STATUS_UP;
 	return 0;
 }
 
-- 
2.17.1
