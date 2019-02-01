From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 01 Feb 2019 08:32:26 +0000
Subject: [PATCH net-next] net: hns3: Check for allocation failure
Message-Id: <20190201083226.GF8459@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Yisen Zhuang <yisen.zhuang@huawei.com>, liuzhongzhu <liuzhongzhu@huawei.com>
Cc: Salil Mehta <salil.mehta@huawei.com>, "David S. Miller" <davem@davemloft.net>, Peng Li <lipeng321@huawei.com>, Jian Shen <shenjian15@huawei.com>, Huazhong Tan <tanhuazhong@huawei.com>, Yunsheng Lin <linyunsheng@huawei.com>, Fuyun Liang <liangfuyun1@huawei.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

We should return -ENOMEM if the kcalloc() fails.

Fixes: d174ea75c96a ("net: hns3: add statistics for PFC frames and MAC control frame")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c b/drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c
index ae8336c18264..afd9a0176923 100644
--- a/drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c
+++ b/drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c
@@ -343,6 +343,8 @@ static int hclge_mac_update_stats_complete(struct hclge_dev *hdev, u32 desc_num)
 	int ret;
 
 	desc = kcalloc(desc_num, sizeof(struct hclge_desc), GFP_KERNEL);
+	if (!desc)
+		return -ENOMEM;
 	hclge_cmd_setup_basic_desc(&desc[0], HCLGE_OPC_STATS_MAC_ALL, true);
 	ret = hclge_cmd_send(&hdev->hw, desc, desc_num);
 	if (ret) {
-- 
2.17.1
