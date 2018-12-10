From: Colin King <colin.king@canonical.com>
Date: Mon, 10 Dec 2018 09:29:48 +0000
Subject: [PATCH][net-next] net: hns3: fix spelling mistake "offser" -> "offset"
Message-Id: <20181210092948.4244-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181031.123329.534080519656916446.davem@davemloft.net>
In-Reply-To: <20181031.123329.534080519656916446.davem@davemloft.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Yisen Zhuang <yisen.zhuang@huawei.com>, Salil Mehta <salil.mehta@huawei.com>, "David S . Miller" <davem@davemloft.net>, Shiju Jose <shiju.jose@huawei.com>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in a msg string, fix this.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_err.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_err.c b/drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_err.c
index 77deea0beeba..d0f654123b9b 100644
--- a/drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_err.c
+++ b/drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_err.c
@@ -183,7 +183,7 @@ static const struct hclge_hw_error hclge_qcn_fifo_rint[] = {
 	{ .int_msk = BIT(6), .msg = "qcn_shap_gp3_sch_fifo_rd_err" },
 	{ .int_msk = BIT(7), .msg = "qcn_shap_gp3_sch_fifo_wr_err" },
 	{ .int_msk = BIT(8), .msg = "qcn_shap_gp0_offset_fifo_rd_err" },
-	{ .int_msk = BIT(9), .msg = "qcn_shap_gp0_offser_fifo_wr_err" },
+	{ .int_msk = BIT(9), .msg = "qcn_shap_gp0_offset_fifo_wr_err" },
 	{ .int_msk = BIT(10), .msg = "qcn_shap_gp1_offset_fifo_rd_err" },
 	{ .int_msk = BIT(11), .msg = "qcn_shap_gp1_offset_fifo_wr_err" },
 	{ .int_msk = BIT(12), .msg = "qcn_shap_gp2_offset_fifo_rd_err" },
-- 
2.19.1
