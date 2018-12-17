From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 17 Dec 2018 07:08:15 +0000
Subject: [PATCH] RDMA/hns: Fix an error code in hns_roce_create_srq()
Message-Id: <20181217070815.GF12159@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

The function accidentally returns success on this error path.

Fixes: c7bcb13442e1 ("RDMA/hns: Add SRQ support for hip08 kernel mode")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/infiniband/hw/hns/hns_roce_srq.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/infiniband/hw/hns/hns_roce_srq.c b/drivers/infiniband/hw/hns/hns_roce_srq.c
index 463df60094e8..6377e734e28e 100644
--- a/drivers/infiniband/hw/hns/hns_roce_srq.c
+++ b/drivers/infiniband/hw/hns/hns_roce_srq.c
@@ -286,6 +286,7 @@ struct ib_srq *hns_roce_create_srq(struct ib_pd *pd,
 		if (IS_ERR(srq->idx_que.umem)) {
 			dev_err(hr_dev->dev,
 				"ib_umem_get error for index queue\n");
+			ret = PTR_ERR(srq->idx_que.umem);
 			goto err_srq_mtt;
 		}
 
-- 
2.17.1
