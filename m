From: Colin King <colin.king@canonical.com>
Date: Thu, 07 May 2020 15:16:10 +0000
Subject: [PATCH][next] RDMA/mlx5: remove duplicated assignment to variable rcqe_sz
Message-Id: <20200507151610.52636-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Leon Romanovsky <leon@kernel.org>, Doug Ledford <dledford@redhat.com>, Jason Gunthorpe <jgg@ziepe.ca>, linux-rdma@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable rcqe_sz is being unnecessarily assigned twice, fix this
by removing one of the duplicates.

Addresses-Coverity: ("Evaluation order violation")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/infiniband/hw/mlx5/qp.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/infiniband/hw/mlx5/qp.c b/drivers/infiniband/hw/mlx5/qp.c
index e5891d3da945..0d292d93f5e7 100644
--- a/drivers/infiniband/hw/mlx5/qp.c
+++ b/drivers/infiniband/hw/mlx5/qp.c
@@ -2043,8 +2043,7 @@ static int create_user_qp(struct mlx5_ib_dev *dev, struct ib_pd *pd,
 	if ((qp->flags_en & MLX5_QP_FLAG_SCATTER_CQE) &&
 	    (init_attr->qp_type = IB_QPT_RC ||
 	     init_attr->qp_type = IB_QPT_UC)) {
-		int rcqe_sz = rcqe_sz -			mlx5_ib_get_cqe_size(init_attr->recv_cq);
+		int rcqe_sz = mlx5_ib_get_cqe_size(init_attr->recv_cq);
 
 		MLX5_SET(qpc, qpc, cs_res,
 			 rcqe_sz = 128 ? MLX5_RES_SCAT_DATA64_CQE :
-- 
2.25.1
