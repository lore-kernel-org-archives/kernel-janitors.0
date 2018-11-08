From: Colin King <colin.king@canonical.com>
Date: Thu, 08 Nov 2018 10:32:02 +0000
Subject: [PATCH][net-hns3-next] net: hns3: fix spelling mistake, "assertting" -> "asserting"
Message-Id: <20181108103202.1212-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Yisen Zhuang <yisen.zhuang@huawei.com>, Salil Mehta <salil.mehta@huawei.com>, "David S . Miller" <davem@davemloft.net>, Peng Li <lipeng321@huawei.com>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to spelling mistake in dev_err error message

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c b/drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c
index 579945bdcc76..77980e54ad09 100644
--- a/drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c
+++ b/drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c
@@ -2504,7 +2504,7 @@ static int hclge_reset_prepare_wait(struct hclge_dev *hdev)
 		ret = hclge_func_reset_cmd(hdev, 0);
 		if (ret) {
 			dev_err(&hdev->pdev->dev,
-				"assertting function reset fail %d!\n", ret);
+				"asserting function reset fail %d!\n", ret);
 			return ret;
 		}
 
-- 
2.19.1
