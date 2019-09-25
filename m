From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 25 Sep 2019 10:57:14 +0000
Subject: [PATCH net] enetc: Fix a signedness bug in enetc_of_get_phy()
Message-Id: <20190925105714.GF3264@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Claudiu Manoil <claudiu.manoil@nxp.com>
Cc: "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

The "priv->if_mode" is type phy_interface_t which is an enum.  In this
context GCC will treat the enum as an unsigned int so this error
handling is never triggered.

Fixes: d4fd0404c1c9 ("enetc: Introduce basic PF and VF ENETC ethernet drivers")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/net/ethernet/freescale/enetc/enetc_pf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/freescale/enetc/enetc_pf.c b/drivers/net/ethernet/freescale/enetc/enetc_pf.c
index 7d6513ff8507..b73421c3e25b 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc_pf.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc_pf.c
@@ -785,7 +785,7 @@ static int enetc_of_get_phy(struct enetc_ndev_priv *priv)
 	}
 
 	priv->if_mode = of_get_phy_mode(np);
-	if (priv->if_mode < 0) {
+	if ((int)priv->if_mode < 0) {
 		dev_err(priv->dev, "missing phy type\n");
 		of_node_put(priv->phy_node);
 		if (of_phy_is_fixed_link(np))
-- 
2.20.1
