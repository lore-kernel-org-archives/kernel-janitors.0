From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Fri, 08 May 2020 02:10:59 +0000
Subject: [PATCH net-next] net: ethernet: ti: fix error return code in am65_cpsw_nuss_probe()
Message-Id: <20200508021059.172001-1-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200427093343.157119-1-weiyongjun1@huawei.com>
In-Reply-To: <20200427093343.157119-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "David S . Miller" <davem@davemloft.net>, Grygorii Strashko <grygorii.strashko@ti.com>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Colin Ian King <colin.king@canonical.com>, Jakub Kicinski <kuba@kernel.org>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, Hulk Robot <hulkci@huawei.com>

Fix to return negative error code -ENOMEM from the cpsw_ale_create()
error handling case instead of 0, as done elsewhere in this function.

Fixes: 93a76530316a ("net: ethernet: ti: introduce am65x/j721e gigabit eth subsystem driver")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/net/ethernet/ti/am65-cpsw-nuss.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/ti/am65-cpsw-nuss.c b/drivers/net/ethernet/ti/am65-cpsw-nuss.c
index f8c589929308..066ba52f57cb 100644
--- a/drivers/net/ethernet/ti/am65-cpsw-nuss.c
+++ b/drivers/net/ethernet/ti/am65-cpsw-nuss.c
@@ -2065,6 +2065,7 @@ static int am65_cpsw_nuss_probe(struct platform_device *pdev)
 	common->ale = cpsw_ale_create(&ale_params);
 	if (!common->ale) {
 		dev_err(dev, "error initializing ale engine\n");
+		ret = -ENOMEM;
 		goto err_of_clear;
 	}
