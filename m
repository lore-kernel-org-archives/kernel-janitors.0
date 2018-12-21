From: YueHaibing <yuehaibing@huawei.com>
Date: Fri, 21 Dec 2018 01:58:41 +0000
Subject: [PATCH -next] IB/mlx4: Remove set but not used variable 'pd'
Message-Id: <1545357957-67309-1-git-send-email-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/infiniband/hw/mlx4/qp.c: In function '_mlx4_ib_destroy_qp':
drivers/infiniband/hw/mlx4/qp.c:1612:22: warning:
 variable 'pd' set but not used [-Wunused-but-set-variable]

It not used since commit e00b64f7c54c ("RDMA: Cleanup undesired
pd->uobject usage")

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/infiniband/hw/mlx4/qp.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/infiniband/hw/mlx4/qp.c b/drivers/infiniband/hw/mlx4/qp.c
index 24ee30f..971e9a9 100644
--- a/drivers/infiniband/hw/mlx4/qp.c
+++ b/drivers/infiniband/hw/mlx4/qp.c
@@ -1609,9 +1609,6 @@ static int _mlx4_ib_destroy_qp(struct ib_qp *qp)
 	if (qp->rwq_ind_tbl) {
 		destroy_qp_rss(dev, mqp);
 	} else {
-		struct mlx4_ib_pd *pd;
-
-		pd = get_pd(mqp);
 		destroy_qp_common(dev, mqp, MLX4_IB_QP_SRC, qp->uobject);
 	}
