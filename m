From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Tue, 13 Nov 2018 17:42:24 +0000
Subject: [PATCH] net: lantiq: Fix returned value in case of error in 'xrx200_probe()'
Message-Id: <20181113174224.7884-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: hauke@hauke-m.de, davem@davemloft.net
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Return 'err' in the error handling path instead of 0.
Return explicitly 0 in the normal path, instead of 'err', which is known
to be 0 at this point.

Fixes: fe1a56420cf2 ("net: lantiq: Add Lantiq / Intel VRX200 Ethernet driver")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/net/ethernet/lantiq_xrx200.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/lantiq_xrx200.c b/drivers/net/ethernet/lantiq_xrx200.c
index 8c5ba4b81fb7..2d4d10a017e5 100644
--- a/drivers/net/ethernet/lantiq_xrx200.c
+++ b/drivers/net/ethernet/lantiq_xrx200.c
@@ -512,7 +512,8 @@ static int xrx200_probe(struct platform_device *pdev)
 	err = register_netdev(net_dev);
 	if (err)
 		goto err_unprepare_clk;
-	return err;
+
+	return 0;
 
 err_unprepare_clk:
 	clk_disable_unprepare(priv->clk);
@@ -520,7 +521,7 @@ static int xrx200_probe(struct platform_device *pdev)
 err_uninit_dma:
 	xrx200_hw_cleanup(priv);
 
-	return 0;
+	return err;
 }
 
 static int xrx200_remove(struct platform_device *pdev)
-- 
2.17.1
