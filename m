From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 03 Jun 2020 17:50:25 +0000
Subject: [PATCH net-next] net: ethernet: dwmac: Fix an error code in imx_dwmac_probe()
Message-Id: <20200603175025.GA19353@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>, Fugang Duan <fugang.duan@nxp.com>
Cc: Alexandre Torgue <alexandre.torgue@st.com>, Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, kernel-janitors@vger.kernel.org

The code is return PTR_ERR(NULL) which is zero or success.  We should
return -ENOMEM instead.

Fixes: 94abdad6974a5 ("net: ethernet: dwmac: add ethernet glue logic for NXP imx8 chip")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
index 5010af7dab4af..3c5df5eeed6c8 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
@@ -225,7 +225,7 @@ static int imx_dwmac_probe(struct platform_device *pdev)
 
 	dwmac = devm_kzalloc(&pdev->dev, sizeof(*dwmac), GFP_KERNEL);
 	if (!dwmac)
-		return PTR_ERR(dwmac);
+		return -ENOMEM;
 
 	plat_dat = stmmac_probe_config_dt(pdev, &stmmac_res.mac);
 	if (IS_ERR(plat_dat))
-- 
2.26.2
