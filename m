From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 03 May 2019 12:28:39 +0000
Subject: [PATCH] net/mlx5: potential error pointer dereference in error handling
Message-Id: <20190503122839.GB29695@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

The error handling was a bit flipped around.  If the mlx5_create_flow_group()
function failed then it would have resulted in dereferencing "fg" when
it was an error pointer.

Fixes: 80f09dfc237f ("net/mlx5: Eswitch, enable RoCE loopback traffic")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/net/ethernet/mellanox/mlx5/core/rdma.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/mellanox/mlx5/core/rdma.c b/drivers/net/ethernet/mellanox/mlx5/core/rdma.c
index 86f77456f873..401441aefbcb 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/rdma.c
+++ b/drivers/net/ethernet/mellanox/mlx5/core/rdma.c
@@ -106,10 +106,10 @@ static int mlx5_rdma_enable_roce_steering(struct mlx5_core_dev *dev)
 
 	return 0;
 
-destroy_flow_table:
-	mlx5_destroy_flow_table(ft);
 destroy_flow_group:
 	mlx5_destroy_flow_group(fg);
+destroy_flow_table:
+	mlx5_destroy_flow_table(ft);
 free:
 	kvfree(spec);
 	kvfree(flow_group_in);
-- 
2.18.0
