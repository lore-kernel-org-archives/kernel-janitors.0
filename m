From: Colin King <colin.king@canonical.com>
Date: Thu, 04 Feb 2021 09:32:32 +0000
Subject: [PATCH][next] net/mlx5e: Fix spelling mistake "channles" -> "channels"
Message-Id: <20210204093232.50924-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20210129103042.12217-1-colin.king@canonical.com>
In-Reply-To: <20210129103042.12217-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Saeed Mahameed <saeedm@nvidia.com>, Leon Romanovsky <leon@kernel.org>, "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org, linux-rdma@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in a netdev_warn message. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/ethernet/mellanox/mlx5/core/en_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/mellanox/mlx5/core/en_main.c b/drivers/net/ethernet/mellanox/mlx5/core/en_main.c
index 4cfdba997f24..35f69354e07a 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/en_main.c
+++ b/drivers/net/ethernet/mellanox/mlx5/core/en_main.c
@@ -5647,7 +5647,7 @@ int mlx5e_netdev_change_profile(struct mlx5e_priv *priv,
 	/* sanity */
 	if (new_max_nch != priv->max_nch) {
 		netdev_warn(priv->netdev,
-			    "%s: Replacing profile with different max channles\n",
+			    "%s: Replacing profile with different max channels\n",
 			    __func__);
 		return -EINVAL;
 	}
-- 
2.29.2
