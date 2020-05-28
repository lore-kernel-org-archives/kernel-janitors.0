From: Colin King <colin.king@canonical.com>
Date: Thu, 28 May 2020 15:04:27 +0000
Subject: [PATCH][next] RDMA/hns: remove duplicate assignment to pointer raq
Message-Id: <20200528150427.420624-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lijun Ou <oulijun@huawei.com>, Wei Hu <huwei87@hisilicon.com>, Weihang Li <liweihang@huawei.com>, Doug Ledford <dledford@redhat.com>, Jason Gunthorpe <jgg@ziepe.ca>, linux-rdma@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The pointer raq is being assigned twice. Fix this by removing
one of the redundant assignments.

Fixes: 14ba87304bf9 ("RDMA/hns: Remove redundant type cast for general pointers")
Addressses-Coverity: ("Evaluation order violation")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/infiniband/hw/hns/hns_roce_hw_v1.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/infiniband/hw/hns/hns_roce_hw_v1.c b/drivers/infiniband/hw/hns/hns_roce_hw_v1.c
index 8ff6b922b4d7..d02207cd30df 100644
--- a/drivers/infiniband/hw/hns/hns_roce_hw_v1.c
+++ b/drivers/infiniband/hw/hns/hns_roce_hw_v1.c
@@ -1146,7 +1146,7 @@ static void hns_roce_db_free(struct hns_roce_dev *hr_dev)
 static int hns_roce_raq_init(struct hns_roce_dev *hr_dev)
 {
 	struct hns_roce_v1_priv *priv = hr_dev->priv;
-	struct hns_roce_raq_table *raq = raq = &priv->raq_table;
+	struct hns_roce_raq_table *raq = &priv->raq_table;
 	struct device *dev = &hr_dev->pdev->dev;
 	int raq_shift = 0;
 	dma_addr_t addr;
-- 
2.25.1
