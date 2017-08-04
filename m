From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 04 Aug 2017 08:12:08 +0000
Subject: [PATCH] IB/hns: checking for IS_ERR() instead of NULL
Message-Id: <20170804081208.qkkj3yons7ljccjp@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lijun Ou <oulijun-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, Shaobo Xu <xushaobo2-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Cc: "Wei Hu(Xavier)" <xavier.huwei-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, Doug Ledford <dledford-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Sean Hefty <sean.hefty-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Hal Rosenstock <hal.rosenstock-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

The hns_roce_v1_create_lp_qp() returns NULL on error, not error pointers.

Fixes: bfcc681bd09d ("IB/hns: Fix the bug when free mr")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/infiniband/hw/hns/hns_roce_hw_v1.c b/drivers/infiniband/hw/hns/hns_roce_hw_v1.c
index 38f5c77baabf..747efd1ae5a6 100644
--- a/drivers/infiniband/hw/hns/hns_roce_hw_v1.c
+++ b/drivers/infiniband/hw/hns/hns_roce_hw_v1.c
@@ -733,7 +733,7 @@ static int hns_roce_v1_rsv_lp_qp(struct hns_roce_dev *hr_dev)
 			continue;
 
 		free_mr->mr_free_qp[i] = hns_roce_v1_create_lp_qp(hr_dev, pd);
-		if (IS_ERR(free_mr->mr_free_qp[i])) {
+		if (!free_mr->mr_free_qp[i]) {
 			dev_err(dev, "Create loop qp failed!\n");
 			goto create_lp_qp_failed;
 		}
