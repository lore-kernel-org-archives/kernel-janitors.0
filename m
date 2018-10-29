From: Colin King <colin.king@canonical.com>
Date: Mon, 29 Oct 2018 22:46:11 +0000
Subject: [PATCH][net-next] net: hns3: fix spelling mistake "intrerrupt" -> "interrupt"
Message-Id: <20181029224611.20008-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Yisen Zhuang <yisen.zhuang@huawei.com>, Salil Mehta <salil.mehta@huawei.com>, "David S . Miller" <davem@davemloft.net>, Shiju Jose <shiju.jose@huawei.com>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to spelling mistake in dev_err message

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_err.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_err.c b/drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_err.c
index dca6f2326c26..123c37e653f3 100644
--- a/drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_err.c
+++ b/drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_err.c
@@ -751,7 +751,7 @@ static void hclge_process_ncsi_error(struct hclge_dev *hdev,
 	ret = hclge_cmd_clear_error(hdev, &desc_wr, &desc_rd,
 				    HCLGE_NCSI_INT_CLR, 0);
 	if (ret)
-		dev_err(dev, "failed(=%d) to clear NCSI intrerrupt status\n",
+		dev_err(dev, "failed(=%d) to clear NCSI interrupt status\n",
 			ret);
 }
 
-- 
2.19.1
