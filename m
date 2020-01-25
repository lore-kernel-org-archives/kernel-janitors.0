From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sat, 25 Jan 2020 21:18:47 +0000
Subject: [PATCH] mlxsw: minimal: Fix an error handling path in 'mlxsw_m_port_create()'
Message-Id: <20200125211847.12755-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: jiri@mellanox.com, idosch@mellanox.com, davem@davemloft.net, vadimp@mellanox.com
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

An 'alloc_etherdev()' called is not ballanced by a corresponding
'free_netdev()' call in one error handling path.

Slighly reorder the error handling code to catch the missed case.

Fixes: c100e47caa8e ("mlxsw: minimal: Add ethtool support")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/net/ethernet/mellanox/mlxsw/minimal.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/mellanox/mlxsw/minimal.c b/drivers/net/ethernet/mellanox/mlxsw/minimal.c
index 2b543911ae00..c4caeeadcba9 100644
--- a/drivers/net/ethernet/mellanox/mlxsw/minimal.c
+++ b/drivers/net/ethernet/mellanox/mlxsw/minimal.c
@@ -213,8 +213,8 @@ mlxsw_m_port_create(struct mlxsw_m *mlxsw_m, u8 local_port, u8 module)
 
 err_register_netdev:
 	mlxsw_m->ports[local_port] = NULL;
-	free_netdev(dev);
 err_dev_addr_get:
+	free_netdev(dev);
 err_alloc_etherdev:
 	mlxsw_core_port_fini(mlxsw_m->core, local_port);
 	return err;
-- 
2.20.1
