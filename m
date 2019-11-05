From: Colin King <colin.king@canonical.com>
Date: Tue, 05 Nov 2019 18:27:40 +0000
Subject: [PATCH][next] net/mlx5: fix kvfree of uninitialized pointer spec
Message-Id: <20191105182740.87146-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Saeed Mahameed <saeedm@mellanox.com>, Leon Romanovsky <leon@kernel.org>, "David S . Miller" <davem@davemloft.net>, Parav Pandit <parav@mellanox.com>, netdev@vger.kernel.org, linux-rdma@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently when a call to  esw_vport_create_legacy_ingress_acl_group
fails the error exit path to label 'out' will cause a kvfree on the
uninitialized pointer spec.  Fix this by ensuring pointer spec is
initialized to NULL to avoid this issue.

Addresses-Coverity: ("Uninitialized pointer read")
Fixes: 10652f39943e ("net/mlx5: Refactor ingress acl configuration")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/ethernet/mellanox/mlx5/core/eswitch.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/mellanox/mlx5/core/eswitch.c b/drivers/net/ethernet/mellanox/mlx5/core/eswitch.c
index 7baade9e62b7..f2e400a23a59 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/eswitch.c
+++ b/drivers/net/ethernet/mellanox/mlx5/core/eswitch.c
@@ -1253,7 +1253,7 @@ static int esw_vport_ingress_config(struct mlx5_eswitch *esw,
 	struct mlx5_flow_destination drop_ctr_dst = {0};
 	struct mlx5_flow_destination *dst = NULL;
 	struct mlx5_flow_act flow_act = {0};
-	struct mlx5_flow_spec *spec;
+	struct mlx5_flow_spec *spec = NULL;
 	int dest_num = 0;
 	int err = 0;
 	u8 *smac_v;
-- 
2.20.1
