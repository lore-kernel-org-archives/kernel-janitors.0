From: YueHaibing <yuehaibing@huawei.com>
Date: Thu, 31 Jan 2019 15:19:21 +0000
Subject: [PATCH -next] RDMA/hns: Remove set but not used variable 'rst'
Message-Id: <20190131151921.40349-1-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1538132393-54509-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1538132393-54509-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/infiniband/hw/hns/hns_roce_hw_v2.c: In function 'hns_roce_v2_qp_flow_control_init':
drivers/infiniband/hw/hns/hns_roce_hw_v2.c:4384:33: warning:
 variable 'rst' set but not used [-Wunused-but-set-variable]

It never used since introduction.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/infiniband/hw/hns/hns_roce_hw_v2.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/infiniband/hw/hns/hns_roce_hw_v2.c b/drivers/infiniband/hw/hns/hns_roce_hw_v2.c
index 5c483b437bdd..f1badcd244d1 100644
--- a/drivers/infiniband/hw/hns/hns_roce_hw_v2.c
+++ b/drivers/infiniband/hw/hns/hns_roce_hw_v2.c
@@ -4381,7 +4381,7 @@ static int hns_roce_v2_destroy_qp(struct ib_qp *ibqp)
 static int hns_roce_v2_qp_flow_control_init(struct hns_roce_dev *hr_dev,
 						struct hns_roce_qp *hr_qp)
 {
-	struct hns_roce_sccc_clr_done *rst, *resp;
+	struct hns_roce_sccc_clr_done *resp;
 	struct hns_roce_sccc_clr *clr;
 	struct hns_roce_cmq_desc desc;
 	int ret, i;
@@ -4390,7 +4390,6 @@ static int hns_roce_v2_qp_flow_control_init(struct hns_roce_dev *hr_dev,
 
 	/* set scc ctx clear done flag */
 	hns_roce_cmq_setup_basic_desc(&desc, HNS_ROCE_OPC_RESET_SCCC, false);
-	rst = (struct hns_roce_sccc_clr_done *)desc.data;
 	ret =  hns_roce_cmq_send(hr_dev, &desc, 1);
 	if (ret) {
 		dev_err(hr_dev->dev, "Reset SCC ctx  failed(%d)\n", ret);
