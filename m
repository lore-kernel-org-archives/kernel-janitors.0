From: YueHaibing <yuehaibing@huawei.com>
Date: Fri, 28 Sep 2018 10:59:53 +0000
Subject: [PATCH -next] RDMA/hns: remove set but not used variable 'dseg'
Message-Id: <1538132393-54509-1-git-send-email-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/infiniband/hw/hns/hns_roce_hw_v2.c: In function 'hns_roce_v2_post_send':
drivers/infiniband/hw/hns/hns_roce_hw_v2.c:194:35: warning:
 variable 'dseg' set but not used [-Wunused-but-set-variable]

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/infiniband/hw/hns/hns_roce_hw_v2.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/infiniband/hw/hns/hns_roce_hw_v2.c b/drivers/infiniband/hw/hns/hns_roce_hw_v2.c
index 0d7568e..8136dd8 100644
--- a/drivers/infiniband/hw/hns/hns_roce_hw_v2.c
+++ b/drivers/infiniband/hw/hns/hns_roce_hw_v2.c
@@ -191,7 +191,6 @@ static int hns_roce_v2_post_send(struct ib_qp *ibqp,
 	struct hns_roce_v2_ud_send_wqe *ud_sq_wqe;
 	struct hns_roce_v2_rc_send_wqe *rc_sq_wqe;
 	struct hns_roce_qp *qp = to_hr_qp(ibqp);
-	struct hns_roce_v2_wqe_data_seg *dseg;
 	struct device *dev = hr_dev->dev;
 	struct hns_roce_v2_db sq_db;
 	struct ib_qp_attr attr;
@@ -492,12 +491,6 @@ static int hns_roce_v2_post_send(struct ib_qp *ibqp,
 			roce_set_field(rc_sq_wqe->byte_4,
 				       V2_RC_SEND_WQE_BYTE_4_OPCODE_M,
 				       V2_RC_SEND_WQE_BYTE_4_OPCODE_S, hr_op);
-			if (wr->opcode = IB_WR_ATOMIC_CMP_AND_SWP ||
-			    wr->opcode = IB_WR_ATOMIC_FETCH_AND_ADD)
-				dseg -				  wqe - sizeof(struct hns_roce_v2_wqe_data_seg);
-			else
-				dseg = wqe;
 
 			ret = set_rwqe_data_seg(ibqp, wr, rc_sq_wqe, wqe,
 						&sge_ind, bad_wr);
