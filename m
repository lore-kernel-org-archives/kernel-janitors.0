From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Thu, 11 Jan 2018 11:21:38 +0000
Subject: [PATCH net-next] net: socionext: Fix error return code in netsec_netdev_open()
Message-Id: <1515669698-126382-1-git-send-email-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jassi Brar <jaswinder.singh@linaro.org>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

Fix to return error code -ENODEV from the of_phy_connect() error
handling case instead of 0, as done elsewhere in this function.

Fixes: 533dd11a12f6 ("net: socionext: Add Synquacer NetSec driver")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/net/ethernet/socionext/netsec.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/socionext/netsec.c b/drivers/net/ethernet/socionext/netsec.c
index a8edcf3..78e4ff6 100644
--- a/drivers/net/ethernet/socionext/netsec.c
+++ b/drivers/net/ethernet/socionext/netsec.c
@@ -1292,6 +1292,7 @@ static int netsec_netdev_open(struct net_device *ndev)
 				    netsec_phy_adjust_link, 0,
 				    priv->phy_interface)) {
 			netif_err(priv, link, priv->ndev, "missing PHY\n");
+			ret = -ENODEV;
 			goto err3;
 		}
 	} else {

