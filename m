From: Colin King <colin.king@canonical.com>
Date: Fri, 14 Feb 2020 00:33:38 +0000
Subject: [PATCH][next] RDMA/hns: fix spelling mistake: "attatch" -> "attach"
Message-Id: <20200214003338.6573-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190625193427.GA13242@mellanox.com>
In-Reply-To: <20190625193427.GA13242@mellanox.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lijun Ou <oulijun@huawei.com>, Wei Hu <xavier.huwei@huawei.com>, Doug Ledford <dledford@redhat.com>, Jason Gunthorpe <jgg@ziepe.ca>, linux-rdma@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in a dev_err error message. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/infiniband/hw/hns/hns_roce_hw_v2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/infiniband/hw/hns/hns_roce_hw_v2.c b/drivers/infiniband/hw/hns/hns_roce_hw_v2.c
index 29a5ee0cf07e..b127c6fcbcd6 100644
--- a/drivers/infiniband/hw/hns/hns_roce_hw_v2.c
+++ b/drivers/infiniband/hw/hns/hns_roce_hw_v2.c
@@ -5776,7 +5776,7 @@ static int map_eq_buf(struct hns_roce_dev *hr_dev, struct hns_roce_eq *eq,
 			  page_shift);
 	ret = hns_roce_mtr_attach(hr_dev, &eq->mtr, &buf_list, &region, 1);
 	if (ret)
-		dev_err(hr_dev->dev, "mtr attatch error for eqe\n");
+		dev_err(hr_dev->dev, "mtr attach error for eqe\n");
 
 	goto done;
 
-- 
2.25.0
