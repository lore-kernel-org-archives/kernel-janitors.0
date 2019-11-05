From: Colin King <colin.king@canonical.com>
Date: Tue, 05 Nov 2019 14:54:16 +0000
Subject: [PATCH][next] net/mlx5: fix spelling mistake "metdata" -> "metadata"
Message-Id: <20191105145416.60451-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190904193841.20138-1-colin.king@canonical.com>
In-Reply-To: <20190904193841.20138-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Saeed Mahameed <saeedm@mellanox.com>, Leon Romanovsky <leon@kernel.org>, "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org, linux-rdma@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in a esw_warn warning message. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/ethernet/mellanox/mlx5/core/eswitch_offloads.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/mellanox/mlx5/core/eswitch_offloads.c b/drivers/net/ethernet/mellanox/mlx5/core/eswitch_offloads.c
index bd9fd59d8233..1c3fdee87588 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/eswitch_offloads.c
+++ b/drivers/net/ethernet/mellanox/mlx5/core/eswitch_offloads.c
@@ -1877,7 +1877,7 @@ static int esw_vport_create_ingress_acl_group(struct mlx5_eswitch *esw,
 	if (IS_ERR(g)) {
 		ret = PTR_ERR(g);
 		esw_warn(esw->dev,
-			 "Failed to create vport[%d] ingress metdata group, err(%d)\n",
+			 "Failed to create vport[%d] ingress metadata group, err(%d)\n",
 			 vport->vport, ret);
 		goto grp_err;
 	}
-- 
2.20.1
