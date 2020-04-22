From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 22 Apr 2020 09:36:41 +0000
Subject: [PATCH net] mlxsw: Fix some IS_ERR() vs NULL bugs
Message-Id: <20200422093641.GA189235@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jiri Pirko <jiri@mellanox.com>
Cc: Ido Schimmel <idosch@mellanox.com>, "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

The mlxsw_sp_acl_rulei_create() function is supposed to return an error
pointer from mlxsw_afa_block_create().  The problem is that these
functions both return NULL instead of error pointers.  Half the callers
expect NULL and half expect error pointers so it could lead to a NULL
dereference on failure.

This patch changes both of them to return error pointers and changes all
the callers which checked for NULL to check for IS_ERR() instead.

Fixes: 4cda7d8d7098 ("mlxsw: core: Introduce flexible actions support")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/net/ethernet/mellanox/mlxsw/core_acl_flex_actions.c | 4 ++--
 drivers/net/ethernet/mellanox/mlxsw/spectrum_acl.c          | 2 +-
 drivers/net/ethernet/mellanox/mlxsw/spectrum2_acl_tcam.c    | 4 ++--
 drivers/net/ethernet/mellanox/mlxsw/spectrum_mr_tcam.c      | 4 ++--
 4 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/mellanox/mlxsw/core_acl_flex_actions.c b/drivers/net/ethernet/mellanox/mlxsw/core_acl_flex_actions.c
index 70a104e728f6..c3d04319ff44 100644
--- a/drivers/net/ethernet/mellanox/mlxsw/core_acl_flex_actions.c
+++ b/drivers/net/ethernet/mellanox/mlxsw/core_acl_flex_actions.c
@@ -380,7 +380,7 @@ struct mlxsw_afa_block *mlxsw_afa_block_create(struct mlxsw_afa *mlxsw_afa)
 
 	block = kzalloc(sizeof(*block), GFP_KERNEL);
 	if (!block)
-		return NULL;
+		return ERR_PTR(-ENOMEM);
 	INIT_LIST_HEAD(&block->resource_list);
 	block->afa = mlxsw_afa;
 
@@ -408,7 +408,7 @@ struct mlxsw_afa_block *mlxsw_afa_block_create(struct mlxsw_afa *mlxsw_afa)
 	mlxsw_afa_set_destroy(block->first_set);
 err_first_set_create:
 	kfree(block);
-	return NULL;
+	return ERR_PTR(-ENOMEM);
 }
 EXPORT_SYMBOL(mlxsw_afa_block_create);
 
diff --git a/drivers/net/ethernet/mellanox/mlxsw/spectrum_acl.c b/drivers/net/ethernet/mellanox/mlxsw/spectrum_acl.c
index 67ee880a8727..01cff711bbd2 100644
--- a/drivers/net/ethernet/mellanox/mlxsw/spectrum_acl.c
+++ b/drivers/net/ethernet/mellanox/mlxsw/spectrum_acl.c
@@ -464,7 +464,7 @@ mlxsw_sp_acl_rulei_create(struct mlxsw_sp_acl *acl,
 
 	rulei = kzalloc(sizeof(*rulei), GFP_KERNEL);
 	if (!rulei)
-		return NULL;
+		return ERR_PTR(-ENOMEM);
 
 	if (afa_block) {
 		rulei->act_block = afa_block;
diff --git a/drivers/net/ethernet/mellanox/mlxsw/spectrum2_acl_tcam.c b/drivers/net/ethernet/mellanox/mlxsw/spectrum2_acl_tcam.c
index 6c66a0f1b79e..ad69913f19c1 100644
--- a/drivers/net/ethernet/mellanox/mlxsw/spectrum2_acl_tcam.c
+++ b/drivers/net/ethernet/mellanox/mlxsw/spectrum2_acl_tcam.c
@@ -88,8 +88,8 @@ static int mlxsw_sp2_acl_tcam_init(struct mlxsw_sp *mlxsw_sp, void *priv,
 	 * to be written using PEFA register to all indexes for all regions.
 	 */
 	afa_block = mlxsw_afa_block_create(mlxsw_sp->afa);
-	if (!afa_block) {
-		err = -ENOMEM;
+	if (IS_ERR(afa_block)) {
+		err = PTR_ERR(afa_block);
 		goto err_afa_block;
 	}
 	err = mlxsw_afa_block_continue(afa_block);
diff --git a/drivers/net/ethernet/mellanox/mlxsw/spectrum_mr_tcam.c b/drivers/net/ethernet/mellanox/mlxsw/spectrum_mr_tcam.c
index 346f4a5fe053..221aa6a474eb 100644
--- a/drivers/net/ethernet/mellanox/mlxsw/spectrum_mr_tcam.c
+++ b/drivers/net/ethernet/mellanox/mlxsw/spectrum_mr_tcam.c
@@ -199,8 +199,8 @@ mlxsw_sp_mr_tcam_afa_block_create(struct mlxsw_sp *mlxsw_sp,
 	int err;
 
 	afa_block = mlxsw_afa_block_create(mlxsw_sp->afa);
-	if (!afa_block)
-		return ERR_PTR(-ENOMEM);
+	if (IS_ERR(afa_block))
+		return afa_block;
 
 	err = mlxsw_afa_block_append_allocated_counter(afa_block,
 						       counter_index);
-- 
2.26.1
