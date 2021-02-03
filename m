From: Colin King <colin.king@canonical.com>
Date: Wed, 03 Feb 2021 11:10:49 +0000
Subject: [PATCH][next] net/mlx5e: Fix spelling mistake "Unknouwn" -> "Unknown"
Message-Id: <20210203111049.18125-1-colin.king@canonical.com>
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
index f5f8165fd3d4..c54e72916693 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/en_main.c
+++ b/drivers/net/ethernet/mellanox/mlx5/core/en_main.c
@@ -223,7 +223,7 @@ static int blocking_event(struct notifier_block *nb, unsigned long event, void *
 		err = mlx5e_handle_trap_event(priv, data);
 		break;
 	default:
-		netdev_warn(priv->netdev, "Sync event: Unknouwn event %ld\n", event);
+		netdev_warn(priv->netdev, "Sync event: Unknown event %ld\n", event);
 		err = -EINVAL;
 	}
 	return err;
-- 
2.29.2
