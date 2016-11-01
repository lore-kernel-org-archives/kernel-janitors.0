From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Tue, 01 Nov 2016 07:10:53 +0000
Subject: [PATCH] net/mlx5: Simplify a test
Message-Id: <20161101071053.12486-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: matanb-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org, leonro-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org
Cc: netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Christophe JAILLET <christophe.jaillet-39ZsbGIQGT5GWvitb5QawA@public.gmane.org>

'create_root_ns()' does not return an error pointer, so the test can be
simplified to be more consistent.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/net/ethernet/mellanox/mlx5/core/fs_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/mellanox/mlx5/core/fs_core.c b/drivers/net/ethernet/mellanox/mlx5/core/fs_core.c
index 904853f9cf7a..330955f6badc 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/fs_core.c
+++ b/drivers/net/ethernet/mellanox/mlx5/core/fs_core.c
@@ -1833,7 +1833,7 @@ static int init_root_ns(struct mlx5_flow_steering *steering)
 {
 
 	steering->root_ns = create_root_ns(steering, FS_FT_NIC_RX);
-	if (IS_ERR_OR_NULL(steering->root_ns))
+	if (!steering->root_ns)
 		goto cleanup;
 
 	if (init_root_tree(steering, &root_fs, &steering->root_ns->ns.node))
-- 
2.9.3

