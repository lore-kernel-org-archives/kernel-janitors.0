From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 27 Nov 2020 07:43:49 +0000
Subject: [PATCH] RDMA/mlx5: Fix a error code in devx_umem_reg_cmd_alloc()
Message-Id: <20201127074349.GA7391@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Leon Romanovsky <leon@kernel.org>
Cc: Doug Ledford <dledford@redhat.com>, Jason Gunthorpe <jgg@ziepe.ca>, linux-rdma@vger.kernel.org, kernel-janitors@vger.kernel.org

This code returns PTR_ERR(NULL) which is zero or success but it should
return -ENOMEM.

Fixes: 878f7b31c3a7 ("RDMA/mlx5: Use ib_umem_find_best_pgsz() for devx")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/infiniband/hw/mlx5/devx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/infiniband/hw/mlx5/devx.c b/drivers/infiniband/hw/mlx5/devx.c
index 7c3eefba6197..0b87c74281d3 100644
--- a/drivers/infiniband/hw/mlx5/devx.c
+++ b/drivers/infiniband/hw/mlx5/devx.c
@@ -2107,7 +2107,7 @@ static int devx_umem_reg_cmd_alloc(struct mlx5_ib_dev *dev,
 		      ib_umem_num_dma_blocks(obj->umem, page_size));
 	cmd->in = uverbs_zalloc(attrs, cmd->inlen);
 	if (!cmd->in)
-		return PTR_ERR(cmd->in);
+		return -ENOMEM;
 
 	umem = MLX5_ADDR_OF(create_umem_in, cmd->in, umem);
 	mtt = (__be64 *)MLX5_ADDR_OF(umem, umem, mtt);
-- 
2.29.2
