From: Colin King <colin.king@canonical.com>
Date: Tue, 30 Jul 2019 10:21:14 +0000
Subject: [PATCH][next] mlxsw: spectrum_ptp: fix duplicated check on orig_egr_types
Message-Id: <20190730102114.1506-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Petr Machata <petrm@mellanox.com>, Jiri Pirko <jiri@mellanox.com>, Ido Schimmel <idosch@mellanox.com>, "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently there is a duplicated check on orig_egr_types which is
redundant, I believe this is a typo and should actually be
orig_ing_types || orig_egr_types instead of the expression
orig_egr_types || orig_egr_types.  Fix this.

Addresses-Coverity: ("Same on both sides")
Fixes: c6b36bdd04b5 ("mlxsw: spectrum_ptp: Increase parsing depth when PTP is enabled")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/ethernet/mellanox/mlxsw/spectrum_ptp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/mellanox/mlxsw/spectrum_ptp.c b/drivers/net/ethernet/mellanox/mlxsw/spectrum_ptp.c
index 98c5ba3200bc..f02d74e55d95 100644
--- a/drivers/net/ethernet/mellanox/mlxsw/spectrum_ptp.c
+++ b/drivers/net/ethernet/mellanox/mlxsw/spectrum_ptp.c
@@ -999,7 +999,7 @@ static int mlxsw_sp1_ptp_mtpppc_update(struct mlxsw_sp_port *mlxsw_sp_port,
 		}
 	}
 
-	if ((ing_types || egr_types) && !(orig_egr_types || orig_egr_types)) {
+	if ((ing_types || egr_types) && !(orig_ing_types || orig_egr_types)) {
 		err = mlxsw_sp_nve_inc_parsing_depth_get(mlxsw_sp);
 		if (err) {
 			netdev_err(mlxsw_sp_port->dev, "Failed to increase parsing depth");
-- 
2.20.1
