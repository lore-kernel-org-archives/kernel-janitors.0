From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 08 Jun 2019 09:25:14 +0000
Subject: [PATCH] RDMA/hns: prevent undefined behavior in hns_roce_set_user_sq_size()
Message-Id: <20190608092514.GC28890@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

The "ucmd->log_sq_bb_count" variable is a user controlled variable in
the 0-255 range.  If we shift more than then number of bits in an int
then it's undefined behavior (it shift wraps).  It turns out this
doesn't cause any real issues at runtime, but it's good to check anyway.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/infiniband/hw/hns/hns_roce_qp.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/infiniband/hw/hns/hns_roce_qp.c b/drivers/infiniband/hw/hns/hns_roce_qp.c
index 8db2817a249e..006b3e7f4ed5 100644
--- a/drivers/infiniband/hw/hns/hns_roce_qp.c
+++ b/drivers/infiniband/hw/hns/hns_roce_qp.c
@@ -342,7 +342,8 @@ static int hns_roce_set_user_sq_size(struct hns_roce_dev *hr_dev,
 	u32 max_cnt;
 
 	/* Sanity check SQ size before proceeding */
-	if ((u32)(1 << ucmd->log_sq_bb_count) > hr_dev->caps.max_wqes ||
+	if (ucmd->log_sq_bb_count > 31 ||
+	    (u32)(1 << ucmd->log_sq_bb_count) > hr_dev->caps.max_wqes ||
 	     ucmd->log_sq_stride > max_sq_stride ||
 	     ucmd->log_sq_stride < HNS_ROCE_IB_MIN_SQ_STRIDE) {
 		dev_err(hr_dev->dev, "check SQ size error!\n");
-- 
2.20.1
