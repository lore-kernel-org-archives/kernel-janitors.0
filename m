From: YueHaibing <yuehaibing@huawei.com>
Date: Wed, 03 Jul 2019 03:10:21 +0000
Subject: [PATCH -next] RDMA/hns: Remove set but not used variable 'fclr_write_fail_flag'
Message-Id: <20190703031021.14896-1-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/infiniband/hw/hns/hns_roce_hw_v2.c: In function 'hns_roce_function_clear':
drivers/infiniband/hw/hns/hns_roce_hw_v2.c:1135:7: warning:
 variable 'fclr_write_fail_flag' set but not used [-Wunused-but-set-variable]

It is never used, so can be removed.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/infiniband/hw/hns/hns_roce_hw_v2.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/infiniband/hw/hns/hns_roce_hw_v2.c b/drivers/infiniband/hw/hns/hns_roce_hw_v2.c
index edd62b4dc0a0..edaf900b739c 100644
--- a/drivers/infiniband/hw/hns/hns_roce_hw_v2.c
+++ b/drivers/infiniband/hw/hns/hns_roce_hw_v2.c
@@ -1132,7 +1132,6 @@ static int hns_roce_cmq_query_hw_info(struct hns_roce_dev *hr_dev)
 
 static void hns_roce_function_clear(struct hns_roce_dev *hr_dev)
 {
-	bool fclr_write_fail_flag = false;
 	struct hns_roce_func_clear *resp;
 	struct hns_roce_cmq_desc desc;
 	unsigned long end;
@@ -1143,7 +1142,6 @@ static void hns_roce_function_clear(struct hns_roce_dev *hr_dev)
 
 	ret = hns_roce_cmq_send(hr_dev, &desc, 1);
 	if (ret) {
-		fclr_write_fail_flag = true;
 		dev_err(hr_dev->dev, "Func clear write failed, ret = %d.\n",
 			 ret);
 		return;
