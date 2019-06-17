From: Colin King <colin.king@canonical.com>
Date: Mon, 17 Jun 2019 11:42:14 +0000
Subject: [PATCH][next] net: hns3: fix dereference of ae_dev before it is null checked
Message-Id: <20190617114214.25276-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Yisen Zhuang <yisen.zhuang@huawei.com>, Salil Mehta <salil.mehta@huawei.com>, "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Pointer ae_dev is null checked however, prior to that it is dereferenced
when assigned pointer ops. Fix this by assigning pointer ops after ae_dev
has been null checked.

Addresses-Coverity: ("Dereference before null check")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/ethernet/hisilicon/hns3/hns3_enet.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/hisilicon/hns3/hns3_enet.c b/drivers/net/ethernet/hisilicon/hns3/hns3_enet.c
index 951a8125ea0c..58633cdcdcfd 100644
--- a/drivers/net/ethernet/hisilicon/hns3/hns3_enet.c
+++ b/drivers/net/ethernet/hisilicon/hns3/hns3_enet.c
@@ -1940,13 +1940,14 @@ static pci_ers_result_t hns3_error_detected(struct pci_dev *pdev,
 static pci_ers_result_t hns3_slot_reset(struct pci_dev *pdev)
 {
 	struct hnae3_ae_dev *ae_dev = pci_get_drvdata(pdev);
-	const struct hnae3_ae_ops *ops = ae_dev->ops;
+	const struct hnae3_ae_ops *ops;
 	enum hnae3_reset_type reset_type;
 	struct device *dev = &pdev->dev;
 
 	if (!ae_dev || !ae_dev->ops)
 		return PCI_ERS_RESULT_NONE;
 
+	ops = ae_dev->ops;
 	/* request the reset */
 	if (ops->reset_event) {
 		if (!ae_dev->override_pci_need_reset) {
-- 
2.20.1
