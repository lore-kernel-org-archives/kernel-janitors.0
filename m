From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Sat, 16 Feb 2019 08:15:52 +0000
Subject: [PATCH net-next] net: hns3: make function hclge_set_all_vf_rst() static
Message-Id: <20190216081552.91298-1-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Yisen Zhuang <yisen.zhuang@huawei.com>, Salil Mehta <salil.mehta@huawei.com>, Huazhong Tan <tanhuazhong@huawei.com>, Yunsheng Lin <linyunsheng@huawei.com>, Peng Li <lipeng321@huawei.com>, Jian Shen <shenjian15@huawei.com>, Fuyun Liang <liangfuyun1@huawei.com>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

Fixes the following sparse warning:

drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c:2431:5: warning:
 symbol 'hclge_set_all_vf_rst' was not declared. Should it be static?

Fixes: aa5c4f175be6 ("net: hns3: add reset handling for VF when doing PF reset")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c b/drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c
index ab90108..362b03c 100644
--- a/drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c
+++ b/drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c
@@ -2428,7 +2428,7 @@ static int hclge_set_vf_rst(struct hclge_dev *hdev, int func_id, bool reset)
 	return hclge_cmd_send(&hdev->hw, &desc, 1);
 }
 
-int hclge_set_all_vf_rst(struct hclge_dev *hdev, bool reset)
+static int hclge_set_all_vf_rst(struct hclge_dev *hdev, bool reset)
 {
 	int i;
