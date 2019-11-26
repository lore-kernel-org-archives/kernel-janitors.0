From: Dan Murphy <dmurphy@ti.com>
Date: Tue, 26 Nov 2019 14:38:56 +0000
Subject: [PATCH] net: phy: dp83869: Fix return paths to return proper values
Message-Id: <20191126143856.26451-1-dmurphy@ti.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: andrew@lunn.ch, f.fainelli@gmail.com, hkallweit1@gmail.com, davem@davemloft.net, netdev@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Dan Murphy <dmurphy@ti.com>

Fix the return paths for all I/O operations to ensure
that the I/O completed successfully.  Then pass the return
to the caller for further processing

Reported-by: Andrew Lunn <andrew@lunn.ch>
Fixes: 01db923e8377 ("net: phy: dp83869: Add TI dp83869 phy")
Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 drivers/net/phy/dp83869.c | 49 +++++++++++++++++++++------------------
 1 file changed, 26 insertions(+), 23 deletions(-)

diff --git a/drivers/net/phy/dp83869.c b/drivers/net/phy/dp83869.c
index 1c7a7c57dec3..93021904c5e4 100644
--- a/drivers/net/phy/dp83869.c
+++ b/drivers/net/phy/dp83869.c
@@ -151,13 +151,13 @@ static int dp83869_config_port_mirroring(struct phy_device *phydev)
 	struct dp83869_private *dp83869 = phydev->priv;
 
 	if (dp83869->port_mirroring = DP83869_PORT_MIRRORING_EN)
-		phy_set_bits_mmd(phydev, DP83869_DEVADDR, DP83869_GEN_CFG3,
-				 DP83869_CFG3_PORT_MIRROR_EN);
+		return phy_set_bits_mmd(phydev, DP83869_DEVADDR,
+					DP83869_GEN_CFG3,
+					DP83869_CFG3_PORT_MIRROR_EN);
 	else
-		phy_clear_bits_mmd(phydev, DP83869_DEVADDR, DP83869_GEN_CFG3,
-				   DP83869_CFG3_PORT_MIRROR_EN);
-
-	return 0;
+		return phy_clear_bits_mmd(phydev, DP83869_DEVADDR,
+					  DP83869_GEN_CFG3,
+					  DP83869_CFG3_PORT_MIRROR_EN);
 }
 
 #ifdef CONFIG_OF_MDIO
@@ -204,7 +204,7 @@ static int dp83869_of_init(struct phy_device *phydev)
 				 &dp83869->tx_fifo_depth))
 		dp83869->tx_fifo_depth = DP83869_PHYCR_FIFO_DEPTH_4_B_NIB;
 
-	return 0;
+	return ret;
 }
 #else
 static int dp83869_of_init(struct phy_device *phydev)
@@ -216,7 +216,7 @@ static int dp83869_of_init(struct phy_device *phydev)
 static int dp83869_configure_rgmii(struct phy_device *phydev,
 				   struct dp83869_private *dp83869)
 {
-	int ret, val;
+	int ret = 0, val;
 
 	if (phy_interface_is_rgmii(phydev)) {
 		val = phy_read(phydev, MII_DP83869_PHYCTRL);
@@ -233,13 +233,13 @@ static int dp83869_configure_rgmii(struct phy_device *phydev,
 	}
 
 	if (dp83869->io_impedance >= 0)
-		phy_modify_mmd(phydev, DP83869_DEVADDR,
-			       DP83869_IO_MUX_CFG,
-			       DP83869_IO_MUX_CFG_IO_IMPEDANCE_CTRL,
-			       dp83869->io_impedance &
-			       DP83869_IO_MUX_CFG_IO_IMPEDANCE_CTRL);
+		ret = phy_modify_mmd(phydev, DP83869_DEVADDR,
+				     DP83869_IO_MUX_CFG,
+				     DP83869_IO_MUX_CFG_IO_IMPEDANCE_CTRL,
+				     dp83869->io_impedance &
+				     DP83869_IO_MUX_CFG_IO_IMPEDANCE_CTRL);
 
-	return 0;
+	return ret;
 }
 
 static int dp83869_configure_mode(struct phy_device *phydev,
@@ -284,9 +284,11 @@ static int dp83869_configure_mode(struct phy_device *phydev,
 			return ret;
 		break;
 	case DP83869_RGMII_SGMII_BRIDGE:
-		phy_modify_mmd(phydev, DP83869_DEVADDR, DP83869_OP_MODE,
-			       DP83869_SGMII_RGMII_BRIDGE,
-			       DP83869_SGMII_RGMII_BRIDGE);
+		ret = phy_modify_mmd(phydev, DP83869_DEVADDR, DP83869_OP_MODE,
+				     DP83869_SGMII_RGMII_BRIDGE,
+				     DP83869_SGMII_RGMII_BRIDGE);
+		if (ret)
+			return ret;
 
 		ret = phy_write_mmd(phydev, DP83869_DEVADDR,
 				    DP83869_FX_CTRL, DP83869_FX_CTRL_DEFAULT);
@@ -334,7 +336,7 @@ static int dp83869_configure_mode(struct phy_device *phydev,
 		return -EINVAL;
 	};
 
-	return 0;
+	return ret;
 }
 
 static int dp83869_config_init(struct phy_device *phydev)
@@ -358,12 +360,13 @@ static int dp83869_config_init(struct phy_device *phydev)
 
 	/* Clock output selection if muxing property is set */
 	if (dp83869->clk_output_sel != DP83869_CLK_O_SEL_REF_CLK)
-		phy_modify_mmd(phydev, DP83869_DEVADDR, DP83869_IO_MUX_CFG,
-			       DP83869_IO_MUX_CFG_CLK_O_SEL_MASK,
-			       dp83869->clk_output_sel <<
-			       DP83869_IO_MUX_CFG_CLK_O_SEL_SHIFT);
+		ret = phy_modify_mmd(phydev,
+				     DP83869_DEVADDR, DP83869_IO_MUX_CFG,
+				     DP83869_IO_MUX_CFG_CLK_O_SEL_MASK,
+				     dp83869->clk_output_sel <<
+				     DP83869_IO_MUX_CFG_CLK_O_SEL_SHIFT);
 
-	return 0;
+	return ret;
 }
 
 static int dp83869_probe(struct phy_device *phydev)
-- 
2.23.0
