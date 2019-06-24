From: Colin King <colin.king@canonical.com>
Date: Mon, 24 Jun 2019 12:16:49 +0000
Subject: [PATCH][next] RDMA/hns: fix spelling mistake "attatch" -> "attach"
Message-Id: <20190624121649.3281-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lijun Ou <oulijun@huawei.com>, Wei Hu <xavier.huwei@huawei.com>, Doug Ledford <dledford@redhat.com>, Jason Gunthorpe <jgg@ziepe.ca>, linux-rdma@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in an dev_err message. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/infiniband/hw/hns/hns_roce_qp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/infiniband/hw/hns/hns_roce_qp.c b/drivers/infiniband/hw/hns/hns_roce_qp.c
index 99ec5d43b99b..13a1916b0cdc 100644
--- a/drivers/infiniband/hw/hns/hns_roce_qp.c
+++ b/drivers/infiniband/hw/hns/hns_roce_qp.c
@@ -858,7 +858,7 @@ static int hns_roce_create_qp_common(struct hns_roce_dev *hr_dev,
 	ret = hns_roce_mtr_attach(hr_dev, &hr_qp->mtr, buf_list,
 				  hr_qp->regions, hr_qp->region_cnt);
 	if (ret) {
-		dev_err(dev, "mtr attatch error for create qp\n");
+		dev_err(dev, "mtr attach error for create qp\n");
 		goto err_mtr;
 	}
 
-- 
2.20.1
