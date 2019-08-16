From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 16 Aug 2019 11:39:07 +0000
Subject: [PATCH] RDMA/hns: Fix some white space check_mtu_validate()
Message-Id: <20190816113907.GA30799@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lijun Ou <oulijun@huawei.com>
Cc: "Wei Hu(Xavier)" <xavier.huwei@huawei.com>, Doug Ledford <dledford@redhat.com>, Jason Gunthorpe <jgg@ziepe.ca>, linux-rdma@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

This line was indented a bit too far.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/infiniband/hw/hns/hns_roce_qp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/infiniband/hw/hns/hns_roce_qp.c b/drivers/infiniband/hw/hns/hns_roce_qp.c
index b729f8ef90a2..f972127edbf6 100644
--- a/drivers/infiniband/hw/hns/hns_roce_qp.c
+++ b/drivers/infiniband/hw/hns/hns_roce_qp.c
@@ -1080,7 +1080,7 @@ static int check_mtu_validate(struct hns_roce_dev *hr_dev,
 	int p;
 
 	p = attr_mask & IB_QP_PORT ? (attr->port_num - 1) : hr_qp->port;
-	    active_mtu = iboe_get_mtu(hr_dev->iboe.netdevs[p]->mtu);
+	active_mtu = iboe_get_mtu(hr_dev->iboe.netdevs[p]->mtu);
 
 	if ((hr_dev->caps.max_mtu >= IB_MTU_2048 &&
 	    attr->path_mtu > hr_dev->caps.max_mtu) ||
-- 
2.20.1
