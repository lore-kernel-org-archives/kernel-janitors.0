From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Sat, 15 Sep 2018 01:33:50 +0000
Subject: [PATCH net-next] net: lantiq: Fix return value check in xrx200_probe()
Message-Id: <1536975230-185101-1-git-send-email-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hauke Mehrtens <hauke@hauke-m.de>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

In case of error, the function devm_ioremap_resource() returns ERR_PTR()
and never returns NULL. The NULL test in the return value check should
be replaced with IS_ERR().

Fixes: fe1a56420cf2 ("net: lantiq: Add Lantiq / Intel VRX200 Ethernet driver")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/net/ethernet/lantiq_xrx200.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/lantiq_xrx200.c b/drivers/net/ethernet/lantiq_xrx200.c
index c8b6d90..4a16076 100644
--- a/drivers/net/ethernet/lantiq_xrx200.c
+++ b/drivers/net/ethernet/lantiq_xrx200.c
@@ -461,9 +461,9 @@ static int xrx200_probe(struct platform_device *pdev)
 	}
 
 	priv->pmac_reg = devm_ioremap_resource(dev, res);
-	if (!priv->pmac_reg) {
+	if (IS_ERR(priv->pmac_reg)) {
 		dev_err(dev, "failed to request and remap io ranges\n");
-		return -ENOMEM;
+		return PTR_ERR(priv->pmac_reg);
 	}
 
 	priv->chan_rx.dma.irq = platform_get_irq_byname(pdev, "rx");
