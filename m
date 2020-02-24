From: Colin King <colin.king@canonical.com>
Date: Mon, 24 Feb 2020 19:20:22 +0000
Subject: [PATCH][V2] net: hns3: remove redundant initialization of pointer 'client'
Message-Id: <20200224192022.407524-1-colin.king@canonical.com>
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

V2: use reverse christmas tree ordering of local variables

---
 drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c b/drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c
index 51399dbed77a..89d352385260 100644
--- a/drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c
+++ b/drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c
@@ -9076,8 +9076,8 @@ static int hclge_init_nic_client_instance(struct hnae3_ae_dev *ae_dev,
 static int hclge_init_roce_client_instance(struct hnae3_ae_dev *ae_dev,
 					   struct hclge_vport *vport)
 {
-	struct hnae3_client *client = vport->roce.client;
 	struct hclge_dev *hdev = ae_dev->priv;
+	struct hnae3_client *client;
 	int rst_cnt;
 	int ret;
 
-- 
2.25.0
