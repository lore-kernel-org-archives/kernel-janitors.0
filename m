From: Julia Lawall <julia.lawall@lip6.fr>
Date: Fri, 05 Aug 2016 11:24:12 +0000
Subject: [PATCH 08/11 v2] net/fsl: use of_property_read_bool
Message-Id: <alpine.DEB.2.10.1608051323170.2999@hadrien>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1470387411-15879-1-git-send-email-Julia.Lawall@lip6.fr> <1470387411-15879-9-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1470387411-15879-9-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Use of_property_read_bool to check for the existence of a property.

The semantic patch that makes this change is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@
expression e1,e2,x;
@@
-	if (of_get_property(e1,e2,NULL))
-		x = true;
-	else
-		x = false;
+	x = of_property_read_bool(e1,e2);
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
v2: special case for propagating true and false

 drivers/net/ethernet/freescale/xgmac_mdio.c |    7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/freescale/xgmac_mdio.c b/drivers/net/ethernet/freescale/xgmac_mdio.c
index 7b8fe86..e03b30c 100644
--- a/drivers/net/ethernet/freescale/xgmac_mdio.c
+++ b/drivers/net/ethernet/freescale/xgmac_mdio.c
@@ -271,11 +271,8 @@ static int xgmac_mdio_probe(struct platform_device *pdev)
 		goto err_ioremap;
 	}

-	if (of_get_property(pdev->dev.of_node,
-			    "little-endian", NULL))
-		priv->is_little_endian = true;
-	else
-		priv->is_little_endian = false;
+	priv->is_little_endian = of_property_read_bool(pdev->dev.of_node,
+						       "little-endian");

 	ret = of_mdiobus_register(bus, np);
 	if (ret) {

