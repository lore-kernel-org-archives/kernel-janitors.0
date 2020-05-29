From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 29 May 2020 08:39:18 +0000
Subject: [PATCH] RDMA/hns: Uninitialized variable in modify_qp_init_to_rtr()
Message-Id: <20200529083918.GA1298465@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lijun Ou <oulijun@huawei.com>, Xi Wang <wangxi11@huawei.com>
Cc: "Wei Hu(Xavier)" <huwei87@hisilicon.com>, Weihang Li <liweihang@huawei.com>, Doug Ledford <dledford@redhat.com>, Jason Gunthorpe <jgg@ziepe.ca>, linux-rdma@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

The "dmac" variable is used before it is initialized.

Fixes: 494c3b312255 ("RDMA/hns: Refactor the QP context filling process related to WQE buffer configure")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/infiniband/hw/hns/hns_roce_hw_v2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/infiniband/hw/hns/hns_roce_hw_v2.c b/drivers/infiniband/hw/hns/hns_roce_hw_v2.c
index 6454ac4ad06f0..c597d7281629b 100644
--- a/drivers/infiniband/hw/hns/hns_roce_hw_v2.c
+++ b/drivers/infiniband/hw/hns/hns_roce_hw_v2.c
@@ -4030,6 +4030,7 @@ static int modify_qp_init_to_rtr(struct ib_qp *ibqp,
 	port = (attr_mask & IB_QP_PORT) ? (attr->port_num - 1) : hr_qp->port;
 
 	smac = (u8 *)hr_dev->dev_addr[port];
+	dmac = (u8 *)attr->ah_attr.roce.dmac;
 	/* when dmac equals smac or loop_idc is 1, it should loopback */
 	if (ether_addr_equal_unaligned(dmac, smac) ||
 	    hr_dev->loop_idc = 0x1) {
@@ -4053,7 +4054,6 @@ static int modify_qp_init_to_rtr(struct ib_qp *ibqp,
 	roce_set_field(qpc_mask->byte_20_smac_sgid_idx,
 		       V2_QPC_BYTE_20_SGID_IDX_M, V2_QPC_BYTE_20_SGID_IDX_S, 0);
 
-	dmac = (u8 *)attr->ah_attr.roce.dmac;
 	memcpy(&(context->dmac), dmac, sizeof(u32));
 	roce_set_field(context->byte_52_udpspn_dmac, V2_QPC_BYTE_52_DMAC_M,
 		       V2_QPC_BYTE_52_DMAC_S, *((u16 *)(&dmac[4])));
-- 
2.26.2
