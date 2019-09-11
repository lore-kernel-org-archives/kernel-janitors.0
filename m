From: Colin King <colin.king@canonical.com>
Date: Wed, 11 Sep 2019 14:08:16 +0000
Subject: [PATCH] net: hns3: fix spelling mistake "undeflow" -> "underflow"
Message-Id: <20190911140817.20173-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Yisen Zhuang <yisen.zhuang@huawei.com>, Salil Mehta <salil.mehta@huawei.com>, "David S . Miller" <davem@davemloft.net>, Huazhong Tan <tanhuazhong@huawei.com>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in a .msg literal string. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_err.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_err.c b/drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_err.c
index 58c6231aaa00..87dece0e745d 100644
--- a/drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_err.c
+++ b/drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_err.c
@@ -98,7 +98,7 @@ static const struct hclge_hw_error hclge_igu_egu_tnl_int[] = {
 	  .reset_level = HNAE3_GLOBAL_RESET },
 	{ .int_msk = BIT(1), .msg = "rx_stp_fifo_overflow",
 	  .reset_level = HNAE3_GLOBAL_RESET },
-	{ .int_msk = BIT(2), .msg = "rx_stp_fifo_undeflow",
+	{ .int_msk = BIT(2), .msg = "rx_stp_fifo_underflow",
 	  .reset_level = HNAE3_GLOBAL_RESET },
 	{ .int_msk = BIT(3), .msg = "tx_buf_overflow",
 	  .reset_level = HNAE3_GLOBAL_RESET },
-- 
2.20.1
