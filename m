From: Markus Elfring <Markus.Elfring@web.de>
Date: Sat, 09 Nov 2019 09:03:15 +0000
Subject: [PATCH 2/3] fsl/fman: Use common error handling code in mac_probe()
Message-Id: <8af4d161-cf85-b40f-6cc1-7ccf6d505918@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <132e8369-c4da-249f-76b8-834e394dc6d5@web.de>
In-Reply-To: <132e8369-c4da-249f-76b8-834e394dc6d5@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Madalin Bucur <madalin.bucur@nxp.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 9 Nov 2019 09:13:01 +0100

Adjust jump targets so that exception handling code can be better reused
at the end of this function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/net/ethernet/freescale/fman/mac.c | 42 ++++++++++++-----------
 1 file changed, 22 insertions(+), 20 deletions(-)

diff --git a/drivers/net/ethernet/freescale/fman/mac.c b/drivers/net/ethernet/freescale/fman/mac.c
index e0680257532c..7fbd7cc24ede 100644
--- a/drivers/net/ethernet/freescale/fman/mac.c
+++ b/drivers/net/ethernet/freescale/fman/mac.c
@@ -659,16 +659,14 @@ static int mac_probe(struct platform_device *_of_dev)
 	of_dev = of_find_device_by_node(dev_node);
 	if (!of_dev) {
 		dev_err(dev, "of_find_device_by_node(%pOF) failed\n", dev_node);
-		err = -EINVAL;
-		goto _return_of_node_put;
+		goto _e_inval_put_node;
 	}

 	/* Get the FMan cell-index */
 	err = of_property_read_u32(dev_node, "cell-index", &val);
 	if (err) {
 		dev_err(dev, "failed to read cell-index for %pOF\n", dev_node);
-		err = -EINVAL;
-		goto _put_device;
+		goto _e_inval_put_device;
 	}
 	/* cell-index 0 => FMan id 1 */
 	fman_id = (u8)(val + 1);
@@ -717,8 +715,7 @@ static int mac_probe(struct platform_device *_of_dev)
 	err = of_property_read_u32(mac_node, "cell-index", &val);
 	if (err) {
 		dev_err(dev, "failed to read cell-index for %pOF\n", mac_node);
-		err = -EINVAL;
-		goto _put_parent_device;
+		goto _e_inval_put_parent_device;
 	}
 	priv->cell_index = (u8)val;

@@ -726,8 +723,7 @@ static int mac_probe(struct platform_device *_of_dev)
 	mac_addr = of_get_mac_address(mac_node);
 	if (IS_ERR(mac_addr)) {
 		dev_err(dev, "of_get_mac_address(%pOF) failed\n", mac_node);
-		err = -EINVAL;
-		goto _put_parent_device;
+		goto _e_inval_put_parent_device;
 	}
 	ether_addr_copy(mac_dev->addr, mac_addr);

@@ -743,8 +739,7 @@ static int mac_probe(struct platform_device *_of_dev)
 	if (nph != ARRAY_SIZE(mac_dev->port)) {
 		dev_err(dev, "Not supported number of fman-ports handles of mac node %pOF from device tree\n",
 			mac_node);
-		err = -EINVAL;
-		goto _put_parent_device;
+		goto _e_inval_put_parent_device;
 	}

 	for (i = 0; i < ARRAY_SIZE(mac_dev->port); i++) {
@@ -753,24 +748,21 @@ static int mac_probe(struct platform_device *_of_dev)
 		if (!dev_node) {
 			dev_err(dev, "of_parse_phandle(%pOF, fsl,fman-ports) failed\n",
 				mac_node);
-			err = -EINVAL;
-			goto _return_of_node_put;
+			goto _e_inval_put_node;
 		}

 		of_dev = of_find_device_by_node(dev_node);
 		if (!of_dev) {
 			dev_err(dev, "of_find_device_by_node(%pOF) failed\n",
 				dev_node);
-			err = -EINVAL;
-			goto _return_of_node_put;
+			goto _e_inval_put_node;
 		}

 		mac_dev->port[i] = fman_port_bind(&of_dev->dev);
 		if (!mac_dev->port[i]) {
 			dev_err(dev, "dev_get_drvdata(%pOF) failed\n",
 				dev_node);
-			err = -EINVAL;
-			goto _put_device;
+			goto _e_inval_put_device;
 		}
 		of_node_put(dev_node);
 	}
@@ -821,8 +813,7 @@ static int mac_probe(struct platform_device *_of_dev)
 		phy = of_phy_find_device(mac_dev->phy_node);
 		if (!phy) {
 			err = -EINVAL;
-			of_node_put(mac_dev->phy_node);
-			goto _return_of_get_parent;
+			goto _put_phy_node;
 		}

 		priv->fixed_link->link = phy->link;
@@ -837,8 +828,7 @@ static int mac_probe(struct platform_device *_of_dev)
 	err = mac_dev->init(mac_dev);
 	if (err < 0) {
 		dev_err(dev, "mac_dev->init() = %d\n", err);
-		of_node_put(mac_dev->phy_node);
-		goto _return_of_get_parent;
+		goto _put_phy_node;
 	}

 	/* pause frame autonegotiation enabled */
@@ -866,10 +856,22 @@ static int mac_probe(struct platform_device *_of_dev)

 	goto _return;

+_put_phy_node:
+	of_node_put(mac_dev->phy_node);
+	goto _return_of_get_parent;
+
+_e_inval_put_node:
+	err = -EINVAL;
+	goto _return_of_node_put;
+
+_e_inval_put_parent_device:
+	err = -EINVAL;
 _put_parent_device:
 	put_device(&of_dev->dev);
 	goto _return_of_get_parent;

+_e_inval_put_device:
+	err = -EINVAL;
 _put_device:
 	put_device(&of_dev->dev);
 _return_of_node_put:
--
2.24.0
