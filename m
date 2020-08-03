From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 03 Aug 2020 14:34:48 +0000
Subject: [PATCH net-next] net/mlx5: remove erroneous fallthrough
Message-Id: <20200803143448.GA346925@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Saeed Mahameed <saeedm@mellanox.com>, "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: Leon Romanovsky <leon@kernel.org>, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org, linux-rdma@vger.kernel.org, kernel-janitors@vger.kernel.org

This isn't a fall through because it was after a return statement.  The
fall through annotation leads to a Smatch warning:

    drivers/net/ethernet/mellanox/mlx5/core/en_ethtool.c:246
    mlx5e_ethtool_get_sset_count() warn: ignoring unreachable code.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/net/ethernet/mellanox/mlx5/core/en_ethtool.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/ethernet/mellanox/mlx5/core/en_ethtool.c b/drivers/net/ethernet/mellanox/mlx5/core/en_ethtool.c
index 08270987c506..48397a577fcd 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/en_ethtool.c
+++ b/drivers/net/ethernet/mellanox/mlx5/core/en_ethtool.c
@@ -243,7 +243,6 @@ int mlx5e_ethtool_get_sset_count(struct mlx5e_priv *priv, int sset)
 		return MLX5E_NUM_PFLAGS;
 	case ETH_SS_TEST:
 		return mlx5e_self_test_num(priv);
-		fallthrough;
 	default:
 		return -EOPNOTSUPP;
 	}
-- 
2.27.0
