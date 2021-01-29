From: Colin King <colin.king@canonical.com>
Date: Fri, 29 Jan 2021 10:30:42 +0000
Subject: [PATCH][next] net/mlx5e: Fix spelling mistake "Unknouwn" -> "Unknown"
Message-Id: <20210129103042.12217-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in a netdev_warn message. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/ethernet/mellanox/mlx5/core/en_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/mellanox/mlx5/core/en_main.c b/drivers/net/ethernet/mellanox/mlx5/core/en_main.c
index aad3887e3c1a..cc3f5ac17e19 100644
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
