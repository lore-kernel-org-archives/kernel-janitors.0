From: Colin King <colin.king@canonical.com>
Date: Mon, 23 Nov 2020 10:34:52 +0000
Subject: [PATCH][next] net: hns3: fix spelling mistake "memroy" -> "memory"
Message-Id: <20201123103452.197708-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Yisen Zhuang <yisen.zhuang@huawei.com>, Salil Mehta <salil.mehta@huawei.com>, "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Huazhong Tan <tanhuazhong@huawei.com>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There are spelling mistakes in two dev_err messages. Fix them.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c   | 2 +-
 drivers/net/ethernet/hisilicon/hns3/hns3vf/hclgevf_main.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c b/drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c
index 500cc19225f3..ca668a47121e 100644
--- a/drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c
+++ b/drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c
@@ -9924,7 +9924,7 @@ static int hclge_dev_mem_map(struct hclge_dev *hdev)
 				       pci_resource_start(pdev, HCLGE_MEM_BAR),
 				       pci_resource_len(pdev, HCLGE_MEM_BAR));
 	if (!hw->mem_base) {
-		dev_err(&pdev->dev, "failed to map device memroy\n");
+		dev_err(&pdev->dev, "failed to map device memory\n");
 		return -EFAULT;
 	}
 
diff --git a/drivers/net/ethernet/hisilicon/hns3/hns3vf/hclgevf_main.c b/drivers/net/ethernet/hisilicon/hns3/hns3vf/hclgevf_main.c
index 5d6b419b8a78..5b2f9a56f1d8 100644
--- a/drivers/net/ethernet/hisilicon/hns3/hns3vf/hclgevf_main.c
+++ b/drivers/net/ethernet/hisilicon/hns3/hns3vf/hclgevf_main.c
@@ -2904,7 +2904,7 @@ static int hclgevf_dev_mem_map(struct hclgevf_dev *hdev)
 							  HCLGEVF_MEM_BAR),
 				       pci_resource_len(pdev, HCLGEVF_MEM_BAR));
 	if (!hw->mem_base) {
-		dev_err(&pdev->dev, "failed to map device memroy\n");
+		dev_err(&pdev->dev, "failed to map device memory\n");
 		return -EFAULT;
 	}
 
-- 
2.28.0
