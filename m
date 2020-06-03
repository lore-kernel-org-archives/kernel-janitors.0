From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 03 Jun 2020 17:54:36 +0000
Subject: [PATCH] net/mlx5: E-Switch, Fix some error pointer dereferences
Message-Id: <20200603175436.GD18931@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Saeed Mahameed <saeedm@mellanox.com>, Vu Pham <vuhuong@mellanox.com>
Cc: Leon Romanovsky <leon@kernel.org>, Jakub Kicinski <kuba@kernel.org>, linux-rdma@vger.kernel.org, kernel-janitors@vger.kernel.org

We can't leave "counter" set to an error pointer.  Otherwise either it
will lead to an error pointer dereference later in the function or it
leads to an error pointer dereference when we call mlx5_fc_destroy().

Fixes: 07bab9502641d ("net/mlx5: E-Switch, Refactor eswitch ingress acl codes")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 .../net/ethernet/mellanox/mlx5/core/esw/acl/ingress_lgcy.c  | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/mellanox/mlx5/core/esw/acl/ingress_lgcy.c b/drivers/net/ethernet/mellanox/mlx5/core/esw/acl/ingress_lgcy.c
index 9bda4fe2eafa7..5dc335e621c57 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/esw/acl/ingress_lgcy.c
+++ b/drivers/net/ethernet/mellanox/mlx5/core/esw/acl/ingress_lgcy.c
@@ -162,10 +162,12 @@ int esw_acl_ingress_lgcy_setup(struct mlx5_eswitch *esw,
 
 	if (MLX5_CAP_ESW_INGRESS_ACL(esw->dev, flow_counter)) {
 		counter = mlx5_fc_create(esw->dev, false);
-		if (IS_ERR(counter))
+		if (IS_ERR(counter)) {
 			esw_warn(esw->dev,
 				 "vport[%d] configure ingress drop rule counter failed\n",
 				 vport->vport);
+			counter = NULL;
+		}
 		vport->ingress.legacy.drop_counter = counter;
 	}
 
@@ -272,7 +274,7 @@ void esw_acl_ingress_lgcy_cleanup(struct mlx5_eswitch *esw,
 	esw_acl_ingress_table_destroy(vport);
 
 clean_drop_counter:
-	if (!IS_ERR_OR_NULL(vport->ingress.legacy.drop_counter)) {
+	if (vport->ingress.legacy.drop_counter) {
 		mlx5_fc_destroy(esw->dev, vport->ingress.legacy.drop_counter);
 		vport->ingress.legacy.drop_counter = NULL;
 	}
-- 
2.26.2
