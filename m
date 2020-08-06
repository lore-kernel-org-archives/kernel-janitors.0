From: Colin King <colin.king@canonical.com>
Date: Thu, 06 Aug 2020 11:42:56 +0000
Subject: [PATCH] net: hns3: fix spelling mistake "could'nt" -> "couldn't"
Message-Id: <20200806114256.58845-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Yisen Zhuang <yisen.zhuang@huawei.com>, Salil Mehta <salil.mehta@huawei.com>, "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Huazhong Tan <tanhuazhong@huawei.com>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in a dev_err message. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/ethernet/hisilicon/hns3/hns3vf/hclgevf_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/hisilicon/hns3/hns3vf/hclgevf_main.c b/drivers/net/ethernet/hisilicon/hns3/hns3vf/hclgevf_main.c
index 9162856de1b1..e972138a14ad 100644
--- a/drivers/net/ethernet/hisilicon/hns3/hns3vf/hclgevf_main.c
+++ b/drivers/net/ethernet/hisilicon/hns3/hns3vf/hclgevf_main.c
@@ -1728,7 +1728,7 @@ static int hclgevf_reset_wait(struct hclgevf_dev *hdev)
 	/* hardware completion status should be available by this time */
 	if (ret) {
 		dev_err(&hdev->pdev->dev,
-			"could'nt get reset done status from h/w, timeout!\n");
+			"couldn't get reset done status from h/w, timeout!\n");
 		return ret;
 	}
 
-- 
2.27.0
