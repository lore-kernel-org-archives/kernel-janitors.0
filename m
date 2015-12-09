From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 09 Dec 2015 10:33:51 +0000
Subject: [patch -next] mlxsw: spectrum: fix some error handling
Message-Id: <20151209103351.GI3173@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jiri Pirko <jiri@mellanox.com>
Cc: Ido Schimmel <idosch@mellanox.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

The "err = " assignment is missing here.

Fixes: 0d65fc13042f ('mlxsw: spectrum: Implement LAG port join/leave')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/net/ethernet/mellanox/mlxsw/spectrum.c b/drivers/net/ethernet/mellanox/mlxsw/spectrum.c
index 3ec07b9..322ed54 100644
--- a/drivers/net/ethernet/mellanox/mlxsw/spectrum.c
+++ b/drivers/net/ethernet/mellanox/mlxsw/spectrum.c
@@ -2091,7 +2091,7 @@ static int mlxsw_sp_port_lag_leave(struct mlxsw_sp_port *mlxsw_sp_port,
 	err = mlxsw_sp_lag_col_port_disable(mlxsw_sp_port, lag_id);
 	if (err)
 		return err;
-	mlxsw_sp_lag_col_port_remove(mlxsw_sp_port, lag_id);
+	err = mlxsw_sp_lag_col_port_remove(mlxsw_sp_port, lag_id);
 	if (err)
 		return err;
 
