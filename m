From: Colin King <colin.king@canonical.com>
Date: Wed, 04 Sep 2019 19:38:41 +0000
Subject: [PATCH][next] net/mlx5: fix spelling mistake "offlaods" -> "offloads"
Message-Id: <20190904193841.20138-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Saeed Mahameed <saeedm@mellanox.com>, Leon Romanovsky <leon@kernel.org>, "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org, linux-rdma@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in a NL_SET_ERR_MSG_MOD error message.
Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/ethernet/mellanox/mlx5/core/devlink.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/mellanox/mlx5/core/devlink.c b/drivers/net/ethernet/mellanox/mlx5/core/devlink.c
index 7bf7b6fbc776..381925c90d94 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/devlink.c
+++ b/drivers/net/ethernet/mellanox/mlx5/core/devlink.c
@@ -133,7 +133,7 @@ static int mlx5_devlink_fs_mode_validate(struct devlink *devlink, u32 id,
 
 		else if (eswitch_mode = MLX5_ESWITCH_OFFLOADS) {
 			NL_SET_ERR_MSG_MOD(extack,
-					   "Software managed steering is not supported when eswitch offlaods enabled.");
+					   "Software managed steering is not supported when eswitch offloads enabled.");
 			err = -EOPNOTSUPP;
 		}
 	} else {
-- 
2.20.1
