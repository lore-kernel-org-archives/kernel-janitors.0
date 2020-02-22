From: Colin King <colin.king@canonical.com>
Date: Sat, 22 Feb 2020 19:52:31 +0000
Subject: [PATCH] net: hns3: remove redundant initialization of pointer 'client'
Message-Id: <20200222195231.200089-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Yisen Zhuang <yisen.zhuang@huawei.com>, Salil Mehta <salil.mehta@huawei.com>, "David S . Miller" <davem@davemloft.net>, Huazhong Tan <tanhuazhong@huawei.com>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The pointer 'client' is being initialized with a value that is never
read, it is being updated later on. The initialization is redundant
and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c b/drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c
index 51399dbed77a..a121af513704 100644
--- a/drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c
+++ b/drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c
@@ -9076,7 +9076,7 @@ static int hclge_init_nic_client_instance(struct hnae3_ae_dev *ae_dev,
 static int hclge_init_roce_client_instance(struct hnae3_ae_dev *ae_dev,
 					   struct hclge_vport *vport)
 {
-	struct hnae3_client *client = vport->roce.client;
+	struct hnae3_client *client;
 	struct hclge_dev *hdev = ae_dev->priv;
 	int rst_cnt;
 	int ret;
-- 
2.25.0
