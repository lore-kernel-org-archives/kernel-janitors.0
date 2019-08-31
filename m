From: Colin King <colin.king@canonical.com>
Date: Sat, 31 Aug 2019 07:29:49 +0000
Subject: [PATCH][next] net: hns3: remove redundant assignment to pointer reg_info
Message-Id: <20190831072949.7505-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Yisen Zhuang <yisen.zhuang@huawei.com>, Salil Mehta <salil.mehta@huawei.com>, "David S . Miller" <davem@davemloft.net>, Huazhong Tan <tanhuazhong@huawei.com>, Zhongzhu Liu <liuzhongzhu@huawei.com>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Pointer reg_info is being initialized with a value that is never read and
is being re-assigned a little later on. The assignment is redundant
and hence can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_debugfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_debugfs.c b/drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_debugfs.c
index 1debe37fe735..1c6b501fb7ca 100644
--- a/drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_debugfs.c
+++ b/drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_debugfs.c
@@ -279,7 +279,7 @@ static void hclge_dbg_dump_dcb(struct hclge_dev *hdev, const char *cmd_buf)
 
 static void hclge_dbg_dump_reg_cmd(struct hclge_dev *hdev, const char *cmd_buf)
 {
-	struct hclge_dbg_reg_type_info *reg_info = &hclge_dbg_reg_info[0];
+	struct hclge_dbg_reg_type_info *reg_info;
 	bool has_dump = false;
 	int i;
 
-- 
2.20.1
