From: Colin King <colin.king@canonical.com>
Date: Fri, 31 May 2019 09:21:01 +0000
Subject: [PATCH 2/2][next] RDMA/hns: fix inverted logic of readl read and shift
Message-Id: <20190531092101.28772-2-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190531092101.28772-1-colin.king@canonical.com>
In-Reply-To: <20190531092101.28772-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lijun Ou <oulijun@huawei.com>, Wei Hu <xavier.huwei@huawei.com>, Doug Ledford <dledford@redhat.com>, Jason Gunthorpe <jgg@ziepe.ca>, linux-rdma@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

A previous change incorrectly changed the inverted logic and logically
negated the readl rather than the shifted readl result. Fix this by
adding in missing parentheses around the expression that needs to be
logically negated.

Addresses-Coverity: ("Logically dead code")
Fixes: 669cefb654cb ("RDMA/hns: Remove jiffies operation in disable interrupt context")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/infiniband/hw/hns/hns_roce_hem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/infiniband/hw/hns/hns_roce_hem.c b/drivers/infiniband/hw/hns/hns_roce_hem.c
index b3641aeff27a..a8e9329cbf4e 100644
--- a/drivers/infiniband/hw/hns/hns_roce_hem.c
+++ b/drivers/infiniband/hw/hns/hns_roce_hem.c
@@ -378,7 +378,7 @@ static int hns_roce_set_hem(struct hns_roce_dev *hr_dev,
 
 		end = HW_SYNC_TIMEOUT_MSECS;
 		while (end > 0) {
-			if (!readl(bt_cmd) >> BT_CMD_SYNC_SHIFT)
+			if (!(readl(bt_cmd) >> BT_CMD_SYNC_SHIFT))
 				break;
 
 			mdelay(HW_SYNC_SLEEP_TIME_INTERVAL);
-- 
2.20.1
