From: YueHaibing <yuehaibing@huawei.com>
Date: Mon, 25 Feb 2019 01:50:22 +0000
Subject: [PATCH net-next] mlxsw: spectrum: remove set but not used variable 'autoneg_status'
Message-Id: <20190225020328.42510-1-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jiri Pirko <jiri@mellanox.com>, Ido Schimmel <idosch@mellanox.com>, davem@davemloft.net
Cc: YueHaibing <yuehaibing@huawei.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/net/ethernet/mellanox/mlxsw/spectrum.c: In function 'mlxsw_sp_port_get_link_ksettings':
drivers/net/ethernet/mellanox/mlxsw/spectrum.c:3062:5: warning:
 variable 'autoneg_status' set but not used [-Wunused-but-set-variable]

It's not used since commit 475b33cb66c9 ("mlxsw: spectrum: Remove unsupported
eth_proto_lp_advertise field in PTYS")

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/net/ethernet/mellanox/mlxsw/spectrum.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/net/ethernet/mellanox/mlxsw/spectrum.c b/drivers/net/ethernet/mellanox/mlxsw/spectrum.c
index 40177b9834c4..b00f6f74f91a 100644
--- a/drivers/net/ethernet/mellanox/mlxsw/spectrum.c
+++ b/drivers/net/ethernet/mellanox/mlxsw/spectrum.c
@@ -3059,7 +3059,6 @@ static int mlxsw_sp_port_get_link_ksettings(struct net_device *dev,
 	const struct mlxsw_sp_port_type_speed_ops *ops;
 	char ptys_pl[MLXSW_REG_PTYS_LEN];
 	u8 connector_type;
-	u8 autoneg_status;
 	bool autoneg;
 	int err;
 
@@ -3079,8 +3078,6 @@ static int mlxsw_sp_port_get_link_ksettings(struct net_device *dev,
 	mlxsw_sp_port_get_link_advertise(mlxsw_sp, eth_proto_admin, autoneg,
 					 cmd);
 
-	autoneg_status = mlxsw_reg_ptys_an_status_get(ptys_pl);
-
 	cmd->base.autoneg = autoneg ? AUTONEG_ENABLE : AUTONEG_DISABLE;
 	connector_type = mlxsw_reg_ptys_connector_type_get(ptys_pl);
 	cmd->base.port = mlxsw_sp_port_connector_port(connector_type);
