From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Wed, 28 Mar 2018 12:51:01 +0000
Subject: [PATCH net-next] net: hns3: remove unnecessary pci_set_drvdata() and devm_kfree()
Message-Id: <1522241461-77556-1-git-send-email-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Yisen Zhuang <yisen.zhuang@huawei.com>, Salil Mehta <salil.mehta@huawei.com>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

The devm_kfree function allocates memory that is released when a
driver detaches. Also the driver core clears the driver data to NULL
after device release. So remove the unnecessary pci_set_drvdata()
and devm_kfree().

Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/net/ethernet/hisilicon/hns3/hns3_enet.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/net/ethernet/hisilicon/hns3/hns3_enet.c b/drivers/net/ethernet/hisilicon/hns3/hns3_enet.c
index a31b4ad..8c55965 100644
--- a/drivers/net/ethernet/hisilicon/hns3/hns3_enet.c
+++ b/drivers/net/ethernet/hisilicon/hns3/hns3_enet.c
@@ -1614,10 +1614,6 @@ static void hns3_remove(struct pci_dev *pdev)
 	struct hnae3_ae_dev *ae_dev = pci_get_drvdata(pdev);
 
 	hnae3_unregister_ae_dev(ae_dev);
-
-	devm_kfree(&pdev->dev, ae_dev);
-
-	pci_set_drvdata(pdev, NULL);
 }
 
 static struct pci_driver hns3_driver = {

