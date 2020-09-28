From: Colin King <colin.king@canonical.com>
Date: Mon, 28 Sep 2020 15:52:37 +0000
Subject: [PATCH][next] net/mlx5: fix dereference on pointer flow before null check
Message-Id: <20200928155237.130739-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Saeed Mahameed <saeedm@nvidia.com>, Leon Romanovsky <leon@kernel.org>, "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Vlad Buslov <vladbu@nvidia.com>, Roi Dayan <roid@mellanox.com>, Ariel Levkovich <lariel@mellanox.com>, netdev@vger.kernel.org, linux-rdma@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently pointer flow is being dereferenced before it is being
null checked. Fix this by adding a null check for flow and parse_attr
earlier.  Also change the err_free path to explicitly return -ENOMEM
and remove the need for the err return variable.

Addresses-Coverity: ("Dereference before null")
Fixes: c620b772152b ("net/mlx5: Refactor tc flow attributes structure")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/ethernet/mellanox/mlx5/core/en_tc.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/mellanox/mlx5/core/en_tc.c b/drivers/net/ethernet/mellanox/mlx5/core/en_tc.c
index f815b0c60a6c..a2fa2d22d695 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/en_tc.c
+++ b/drivers/net/ethernet/mellanox/mlx5/core/en_tc.c
@@ -4534,20 +4534,20 @@ mlx5e_alloc_flow(struct mlx5e_priv *priv, int attr_size,
 	struct mlx5e_tc_flow_parse_attr *parse_attr;
 	struct mlx5_flow_attr *attr;
 	struct mlx5e_tc_flow *flow;
-	int out_index, err;
+	int out_index;
 
 	flow = kzalloc(sizeof(*flow), GFP_KERNEL);
 	parse_attr = kvzalloc(sizeof(*parse_attr), GFP_KERNEL);
+	if (!parse_attr || !flow)
+		goto err_free;
 
 	flow->flags = flow_flags;
 	flow->cookie = f->cookie;
 	flow->priv = priv;
 
 	attr = mlx5_alloc_flow_attr(get_flow_name_space(flow));
-	if (!parse_attr || !flow || !attr) {
-		err = -ENOMEM;
-		goto err_free;
-	}
+	if (!attr)
+		goto err_free_flow;
 	flow->attr = attr;
 
 	for (out_index = 0; out_index < MLX5_MAX_FLOW_FWD_VPORTS; out_index++)
@@ -4562,11 +4562,12 @@ mlx5e_alloc_flow(struct mlx5e_priv *priv, int attr_size,
 
 	return 0;
 
-err_free:
+err_free_flow:
 	kfree(flow);
+err_free:
 	kvfree(parse_attr);
 	kfree(attr);
-	return err;
+	return -ENOMEM;
 }
 
 static void
-- 
2.27.0
