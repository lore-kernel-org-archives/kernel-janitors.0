From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 03 Jul 2013 09:37:46 +0000
Subject: [patch -next] net/mlx4: fix small memory leak on error
Message-Id: <20130703093746.GE1598@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "David S. Miller" <davem@davemloft.net>
Cc: Or Gerlitz <ogerlitz@mellanox.com>, Roland Dreier <roland@purestorage.com>, Jack Morgenstein <jackm@dev.mellanox.co.il>, Rony Efraim <ronye@mellanox.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

"work" needs to be freed before returning on this error path.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/net/ethernet/mellanox/mlx4/cmd.c b/drivers/net/ethernet/mellanox/mlx4/cmd.c
index 707a7d0..299d018 100644
--- a/drivers/net/ethernet/mellanox/mlx4/cmd.c
+++ b/drivers/net/ethernet/mellanox/mlx4/cmd.c
@@ -1572,6 +1572,7 @@ int mlx4_master_immediate_activate_vlan_qos(struct mlx4_priv *priv,
 					   vp_admin->default_vlan,
 					   &admin_vlan_ix);
 		if (err) {
+			kfree(work);
 			mlx4_warn((&priv->dev),
 				  "No vlan resources slave %d, port %d\n",
 				  slave, port);
