From: Colin King <colin.king@canonical.com>
Date: Wed, 04 Mar 2020 08:10:45 +0000
Subject: [PATCH][next] RDMA/hns: fix spelling mistake "attatch" -> "attach"
Message-Id: <20200304081045.81164-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190625193427.GA13242@mellanox.com>
In-Reply-To: <20190625193427.GA13242@mellanox.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lijun Ou <oulijun@huawei.com>, Wei Hu <xavier.huwei@huawei.com>, Doug Ledford <dledford@redhat.com>, Jason Gunthorpe <jgg@ziepe.ca>, linux-rdma@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in an error message. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/infiniband/hw/hns/hns_roce_qp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/infiniband/hw/hns/hns_roce_qp.c b/drivers/infiniband/hw/hns/hns_roce_qp.c
index 2a7535534ea8..bddae625f447 100644
--- a/drivers/infiniband/hw/hns/hns_roce_qp.c
+++ b/drivers/infiniband/hw/hns/hns_roce_qp.c
@@ -812,7 +812,7 @@ static int map_wqe_buf(struct hns_roce_dev *hr_dev, struct hns_roce_qp *hr_qp,
 	ret = hns_roce_mtr_attach(hr_dev, &hr_qp->mtr, buf_list, hr_qp->regions,
 				  region_count);
 	if (ret)
-		ibdev_err(ibdev, "Failed to attatch WQE's mtr\n");
+		ibdev_err(ibdev, "Failed to attach WQE's mtr\n");
 
 	goto done;
 
-- 
2.25.0
