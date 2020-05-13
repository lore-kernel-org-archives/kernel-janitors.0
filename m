From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 13 May 2020 09:37:41 +0000
Subject: [PATCH] RDMA/mlx5: Fix query_srq_cmd() function
Message-Id: <20200513093741.GC347693@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Leon Romanovsky <leon@kernel.org>
Cc: Doug Ledford <dledford@redhat.com>, Jason Gunthorpe <jgg@ziepe.ca>, linux-rdma@vger.kernel.org, kernel-janitors@vger.kernel.org

The "srq_out" pointer is never freed so that causes a memory leak.  It's
never used and can be deleted.  Freeing "out" will lead to a double in
mlx5_ib_query_srq().

Fixes: 31578defe4eb ("RDMA/mlx5: Update mlx5_ib to use new cmd interface")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/infiniband/hw/mlx5/srq_cmd.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/drivers/infiniband/hw/mlx5/srq_cmd.c b/drivers/infiniband/hw/mlx5/srq_cmd.c
index bc50a712bf2ed..ee85b8087a718 100644
--- a/drivers/infiniband/hw/mlx5/srq_cmd.c
+++ b/drivers/infiniband/hw/mlx5/srq_cmd.c
@@ -159,27 +159,20 @@ static int query_srq_cmd(struct mlx5_ib_dev *dev, struct mlx5_core_srq *srq,
 			 struct mlx5_srq_attr *out)
 {
 	u32 in[MLX5_ST_SZ_DW(query_srq_in)] = {};
-	u32 *srq_out;
 	void *srqc;
 	int err;
 
-	srq_out = kvzalloc(MLX5_ST_SZ_BYTES(query_srq_out), GFP_KERNEL);
-	if (!srq_out)
-		return -ENOMEM;
-
 	MLX5_SET(query_srq_in, in, opcode, MLX5_CMD_OP_QUERY_SRQ);
 	MLX5_SET(query_srq_in, in, srqn, srq->srqn);
 	err = mlx5_cmd_exec_inout(dev->mdev, query_srq, in, out);
 	if (err)
-		goto out;
+		return err;
 
 	srqc = MLX5_ADDR_OF(query_srq_out, out, srq_context_entry);
 	get_srqc(srqc, out);
 	if (MLX5_GET(srqc, srqc, state) != MLX5_SRQC_STATE_GOOD)
 		out->flags |= MLX5_SRQ_FLAG_ERR;
-out:
-	kvfree(out);
-	return err;
+	return 0;
 }
 
 static int create_xrc_srq_cmd(struct mlx5_ib_dev *dev,
-- 
2.26.2
