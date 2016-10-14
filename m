From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 14 Oct 2016 07:28:37 +0000
Subject: [patch 1/2] IB/hns: Fix a couple pointer math bugs
Message-Id: <20161014072837.GA15238@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lijun Ou <oulijun-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Cc: "Wei Hu(Xavier)" <xavier.huwei-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, Doug Ledford <dledford-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Sean Hefty <sean.hefty-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Hal Rosenstock <hal.rosenstock-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

"wqe" is a void pointer so adding sizeof() works.  The original code
adds sizeof() multiplied by sizeof() so it doesn't work at all.

Fixes: 9a4435375cd1 ('IB/hns: Add driver files for hns RoCE driver')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/infiniband/hw/hns/hns_roce_hw_v1.c b/drivers/infiniband/hw/hns/hns_roce_hw_v1.c
index 399f5de..58b150e 100644
--- a/drivers/infiniband/hw/hns/hns_roce_hw_v1.c
+++ b/drivers/infiniband/hw/hns/hns_roce_hw_v1.c
@@ -205,8 +205,7 @@ int hns_roce_v1_post_send(struct ib_qp *ibqp, struct ib_send_wr *wr,
 				      (wr->send_flags & IB_SEND_FENCE ?
 				      (cpu_to_le32(HNS_ROCE_WQE_FENCE)) : 0);
 
-			wqe = (struct hns_roce_wqe_ctrl_seg *)wqe +
-			       sizeof(struct hns_roce_wqe_ctrl_seg);
+			wqe = wqe + sizeof(struct hns_roce_wqe_ctrl_seg);
 
 			switch (wr->opcode) {
 			case IB_WR_RDMA_READ:
@@ -235,8 +234,7 @@ int hns_roce_v1_post_send(struct ib_qp *ibqp, struct ib_send_wr *wr,
 				break;
 			}
 			ctrl->flag |= cpu_to_le32(ps_opcode);
-			wqe = (struct hns_roce_wqe_raddr_seg *)wqe +
-			       sizeof(struct hns_roce_wqe_raddr_seg);
+			wqe = wqe + sizeof(struct hns_roce_wqe_raddr_seg);
 
 			dseg = wqe;
 			if (wr->send_flags & IB_SEND_INLINE && wr->num_sge) {
