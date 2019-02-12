From: Colin King <colin.king@canonical.com>
Date: Tue, 12 Feb 2019 11:22:33 +0000
Subject: [PATCH][next] RDMA: fix allocation failure on pointer pd
Message-Id: <20190212112233.25667-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Leon Romanovsky <leonro@mellanox.com>, Lijun Ou <oulijun@huawei.com>, Wei Hu <xavier.huwei@huawei.com>, Doug Ledford <dledford@redhat.com>, Jason Gunthorpe <jgg@ziepe.ca>, linux-rdma@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The null check on an allocation failure on pd is currently checking
if pd is non-null rather than null. Fix this by adding the missing !
operator.

Fixes: 21a428a019c9 ("RDMA: Handle PD allocations by IB/core")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/infiniband/hw/hns/hns_roce_hw_v1.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/infiniband/hw/hns/hns_roce_hw_v1.c b/drivers/infiniband/hw/hns/hns_roce_hw_v1.c
index a18b88c95995..77c3678f4829 100644
--- a/drivers/infiniband/hw/hns/hns_roce_hw_v1.c
+++ b/drivers/infiniband/hw/hns/hns_roce_hw_v1.c
@@ -745,7 +745,7 @@ static int hns_roce_v1_rsv_lp_qp(struct hns_roce_dev *hr_dev)
 
 	ibdev = &hr_dev->ib_dev;
 	pd = rdma_zalloc_drv_obj(ibdev, ib_pd);
-	if (pd)
+	if (!pd)
 		goto alloc_mem_failed;
 
 	pd->device  = ibdev;
-- 
2.20.1
