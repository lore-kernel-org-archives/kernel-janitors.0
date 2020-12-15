From: Colin King <colin.king@canonical.com>
Date: Tue, 15 Dec 2020 00:00:33 +0000
Subject: [PATCH][next] net: hns3: fix expression that is currently always true
Message-Id: <20201215000033.85383-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Yisen Zhuang <yisen.zhuang@huawei.com>, Salil Mehta <salil.mehta@huawei.com>, "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Huazhong Tan <tanhuazhong@huawei.com>, Jian Shen <shenjian15@huawei.com>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The ||  condition in hdev->fd_active_type != HCLGE_FD_ARFS_ACTIVE ||
hdev->fd_active_type != HCLGE_FD_RULE_NONE will always be true because
hdev->fd_active_type cannot be equal to two different values at the same
time. The expression is always true which is not correct. Fix this by
replacing || with && to correct the logic in the expression.

Addresses-Coverity: ("Constant expression result")
Fixes: 0205ec041ec6 ("net: hns3: add support for hw tc offload of tc flower")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c b/drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c
index 7a164115c845..e6f37f91c489 100644
--- a/drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c
+++ b/drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c
@@ -6485,7 +6485,7 @@ static int hclge_add_fd_entry_by_arfs(struct hnae3_handle *handle, u16 queue_id,
 	 * arfs should not work
 	 */
 	spin_lock_bh(&hdev->fd_rule_lock);
-	if (hdev->fd_active_type != HCLGE_FD_ARFS_ACTIVE ||
+	if (hdev->fd_active_type != HCLGE_FD_ARFS_ACTIVE &&
 	    hdev->fd_active_type != HCLGE_FD_RULE_NONE) {
 		spin_unlock_bh(&hdev->fd_rule_lock);
 		return -EOPNOTSUPP;
-- 
2.29.2
