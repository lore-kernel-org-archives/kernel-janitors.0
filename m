From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 18 Feb 2017 21:17:03 +0000
Subject: [PATCH 27/29] IB/mlx5: Use kmalloc_array() in create_kernel_qp()
Message-Id: <afd15d0b-cc4f-4d59-14ab-bd59f3536c39@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1935365a-bd7c-461e-6a84-0c5d3a501fff@users.sourceforge.net>
In-Reply-To: <1935365a-bd7c-461e-6a84-0c5d3a501fff-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Doug Ledford <dledford-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Hal Rosenstock <hal.rosenstock-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Leon Romanovsky <leonro-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>, Matan Barak <matanb-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>, Sean Hefty <sean.hefty-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Yishai Hadas <yishaih-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
Cc: LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 18 Feb 2017 20:12:44 +0100

Multiplications for the size determination of memory allocations
indicated that array data structures should be processed.
Thus use the corresponding function "kmalloc_array".

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/infiniband/hw/mlx5/qp.c | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/drivers/infiniband/hw/mlx5/qp.c b/drivers/infiniband/hw/mlx5/qp.c
index 5ed5208d0ddd..e6e9b468b206 100644
--- a/drivers/infiniband/hw/mlx5/qp.c
+++ b/drivers/infiniband/hw/mlx5/qp.c
@@ -955,12 +955,21 @@ static int create_kernel_qp(struct mlx5_ib_dev *dev,
 		goto err_free;
 	}
 
-	qp->sq.wrid = kmalloc(qp->sq.wqe_cnt * sizeof(*qp->sq.wrid), GFP_KERNEL);
-	qp->sq.wr_data = kmalloc(qp->sq.wqe_cnt * sizeof(*qp->sq.wr_data), GFP_KERNEL);
-	qp->rq.wrid = kmalloc(qp->rq.wqe_cnt * sizeof(*qp->rq.wrid), GFP_KERNEL);
-	qp->sq.w_list = kmalloc(qp->sq.wqe_cnt * sizeof(*qp->sq.w_list), GFP_KERNEL);
-	qp->sq.wqe_head = kmalloc(qp->sq.wqe_cnt * sizeof(*qp->sq.wqe_head), GFP_KERNEL);
-
+	qp->sq.wrid = kmalloc_array(qp->sq.wqe_cnt,
+				    sizeof(*qp->sq.wrid),
+				    GFP_KERNEL);
+	qp->sq.wr_data = kmalloc_array(qp->sq.wqe_cnt,
+				       sizeof(*qp->sq.wr_data),
+				       GFP_KERNEL);
+	qp->rq.wrid = kmalloc_array(qp->rq.wqe_cnt,
+				    sizeof(*qp->rq.wrid),
+				    GFP_KERNEL);
+	qp->sq.w_list = kmalloc_array(qp->sq.wqe_cnt,
+				      sizeof(*qp->sq.w_list),
+				      GFP_KERNEL);
+	qp->sq.wqe_head = kmalloc_array(qp->sq.wqe_cnt,
+					sizeof(*qp->sq.wqe_head),
+					GFP_KERNEL);
 	if (!qp->sq.wrid || !qp->sq.wr_data || !qp->rq.wrid ||
 	    !qp->sq.w_list || !qp->sq.wqe_head) {
 		err = -ENOMEM;
-- 
2.11.1

