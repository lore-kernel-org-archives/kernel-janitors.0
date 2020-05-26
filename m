From: Colin King <colin.king@canonical.com>
Date: Tue, 26 May 2020 22:56:49 +0000
Subject: [PATCH] mlxsw: spectrum_router: remove redundant initialization of pointer br_dev
Message-Id: <20200526225649.64257-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jiri Pirko <jiri@mellanox.com>, Ido Schimmel <idosch@mellanox.com>, "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The pointer br_dev is being initialized with a value that is never read
and is being updated with a new value later on. The initialization
is redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/ethernet/mellanox/mlxsw/spectrum_router.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/mellanox/mlxsw/spectrum_router.c b/drivers/net/ethernet/mellanox/mlxsw/spectrum_router.c
index 71aee4914619..8f485f9a07a7 100644
--- a/drivers/net/ethernet/mellanox/mlxsw/spectrum_router.c
+++ b/drivers/net/ethernet/mellanox/mlxsw/spectrum_router.c
@@ -7572,11 +7572,12 @@ static struct mlxsw_sp_fid *
 mlxsw_sp_rif_vlan_fid_get(struct mlxsw_sp_rif *rif,
 			  struct netlink_ext_ack *extack)
 {
-	struct net_device *br_dev = rif->dev;
+	struct net_device *br_dev;
 	u16 vid;
 	int err;
 
 	if (is_vlan_dev(rif->dev)) {
+
 		vid = vlan_dev_vlan_id(rif->dev);
 		br_dev = vlan_dev_real_dev(rif->dev);
 		if (WARN_ON(!netif_is_bridge_master(br_dev)))
-- 
2.25.1
