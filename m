From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Wed, 20 May 2020 03:41:16 +0000
Subject: [PATCH 2/2 v3] net: ethernet: ti: am65-cpsw-nuss: fix error handling of am65_cpsw_nuss_probe
Message-Id: <20200520034116.170946-3-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200520034116.170946-1-weiyongjun1@huawei.com>
In-Reply-To: <20200520034116.170946-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netdev@vger.kernel.org, Grygorii Strashko <grygorii.strashko@ti.com>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Colin Ian King <colin.king@canonical.com>, Jakub Kicinski <kuba@kernel.org>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, kernel-janitors@vger.kernel.org, Hulk Robot <hulkci@huawei.com>

Convert to using IS_ERR() instead of NULL test for cpsw_ale_create()
error handling. Also fix to return negative error code from this error
handling case instead of 0 in.

Fixes: 93a76530316a ("net: ethernet: ti: introduce am65x/j721e gigabit eth subsystem driver")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/net/ethernet/ti/am65-cpsw-nuss.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/ti/am65-cpsw-nuss.c b/drivers/net/ethernet/ti/am65-cpsw-nuss.c
index 2517ffba8178..88f52a2f85b3 100644
--- a/drivers/net/ethernet/ti/am65-cpsw-nuss.c
+++ b/drivers/net/ethernet/ti/am65-cpsw-nuss.c
@@ -1895,8 +1895,9 @@ static int am65_cpsw_nuss_probe(struct platform_device *pdev)
 	ale_params.nu_switch_ale = true;
 
 	common->ale = cpsw_ale_create(&ale_params);
-	if (!common->ale) {
+	if (IS_ERR(common->ale)) {
 		dev_err(dev, "error initializing ale engine\n");
+		ret = PTR_ERR(common->ale);
 		goto err_of_clear;
 	}
 
-- 
2.25.1
