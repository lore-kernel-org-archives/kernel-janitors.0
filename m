From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Wed, 17 Jul 2019 11:52:25 +0000
Subject: [PATCH] net: ag71xx: fix return value check in ag71xx_probe()
Message-Id: <20190717115225.23047-1-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jay Cliburn <jcliburn@gmail.com>, Chris Snook <chris.snook@gmail.com>, Oleksij Rempel <o.rempel@pengutronix.de>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

In case of error, the function of_get_mac_address() returns ERR_PTR()
and never returns NULL. The NULL test in the return value check should
be replaced with IS_ERR().

Fixes: d51b6ce441d3 ("net: ethernet: add ag71xx driver")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/net/ethernet/atheros/ag71xx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/atheros/ag71xx.c b/drivers/net/ethernet/atheros/ag71xx.c
index 72a57c6cd254..3088a43e6436 100644
--- a/drivers/net/ethernet/atheros/ag71xx.c
+++ b/drivers/net/ethernet/atheros/ag71xx.c
@@ -1732,9 +1732,9 @@ static int ag71xx_probe(struct platform_device *pdev)
 	ag->stop_desc->next = (u32)ag->stop_desc_dma;
 
 	mac_addr = of_get_mac_address(np);
-	if (mac_addr)
+	if (!IS_ERR(mac_addr))
 		memcpy(ndev->dev_addr, mac_addr, ETH_ALEN);
-	if (!mac_addr || !is_valid_ether_addr(ndev->dev_addr)) {
+	if (IS_ERR(mac_addr) || !is_valid_ether_addr(ndev->dev_addr)) {
 		netif_err(ag, probe, ndev, "invalid MAC address, using random address\n");
 		eth_random_addr(ndev->dev_addr);
 	}
