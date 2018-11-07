From: YueHaibing <yuehaibing@huawei.com>
Date: Wed, 07 Nov 2018 02:33:53 +0000
Subject: [PATCH net-next] net: hns3: Remove set but not used variable 'reset_level'
Message-Id: <1541558033-100068-1-git-send-email-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Yisen Zhuang <yisen.zhuang@huawei.com>, Salil Mehta <salil.mehta@huawei.com>, Shiju Jose <shiju.jose@huawei.com>, davem@davemloft.net, Colin Ian King <colin.king@canonical.com>
Cc: YueHaibing <yuehaibing@huawei.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_err.c: In function 'hclge_log_and_clear_ppp_error':
drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_err.c:821:24: warning:
 variable 'reset_level' set but not used [-Wunused-but-set-variable]
  enum hnae3_reset_type reset_level = HNAE3_NONE_RESET;

It never used since introduction in commit
01865a50d78f ("net: hns3: Add enable and process hw errors of TM scheduler")

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_err.c | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_err.c b/drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_err.c
index 123c37e..6da9e22 100644
--- a/drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_err.c
+++ b/drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_err.c
@@ -818,7 +818,6 @@ static void hclge_process_igu_egu_error(struct hclge_dev *hdev,
 static int hclge_log_and_clear_ppp_error(struct hclge_dev *hdev, u32 cmd,
 					 enum hclge_err_int_type int_type)
 {
-	enum hnae3_reset_type reset_level = HNAE3_NONE_RESET;
 	struct device *dev = &hdev->pdev->dev;
 	const struct hclge_hw_error *hw_err_lst1, *hw_err_lst2, *hw_err_lst3;
 	struct hclge_desc desc[2];
@@ -848,23 +847,17 @@ static int hclge_log_and_clear_ppp_error(struct hclge_dev *hdev, u32 cmd,
 	}
 
 	err_sts = le32_to_cpu(desc[0].data[2]);
-	if (err_sts) {
+	if (err_sts)
 		hclge_log_error(dev, hw_err_lst1, err_sts);
-		reset_level = HNAE3_FUNC_RESET;
-	}
 
 	err_sts = le32_to_cpu(desc[0].data[3]);
-	if (err_sts) {
+	if (err_sts)
 		hclge_log_error(dev, hw_err_lst2, err_sts);
-		reset_level = HNAE3_FUNC_RESET;
-	}
 
 	if (cmd = HCLGE_PPP_CMD0_INT_CMD) {
 		err_sts = (le32_to_cpu(desc[0].data[4]) >> 8) & 0x3;
-		if (err_sts) {
+		if (err_sts)
 			hclge_log_error(dev, hw_err_lst3, err_sts);
-			reset_level = HNAE3_FUNC_RESET;
-		}
 	}
 
 	/* clear PPP INT */
