From: Markus Elfring <Markus.Elfring@web.de>
Date: Fri, 20 Sep 2019 19:03:57 +0000
Subject: [PATCH 2/2] net/phy/mdio-mscc-miim: Move the setting of mii_bus structure members in mscc_miim_probe
Message-Id: <fe3ecdd2-a011-e4ed-5ef2-c3a8a02b343c@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <189ccfc3-d5a6-79fd-29b8-1f7140e9639a@web.de>
In-Reply-To: <189ccfc3-d5a6-79fd-29b8-1f7140e9639a@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: netdev@vger.kernel.org, Alexandre Belloni <alexandre.belloni@bootlin.com>, Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, "David S. Miller" <davem@davemloft.net>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 20 Sep 2019 20:42:42 +0200

Move the modification of some members in the data structure “mii_bus”
for the local variable “bus” directly before the call of
the function “of_mdiobus_register” so that this change will be performed
only after previous resource allocations succeeded.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/net/phy/mdio-mscc-miim.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/net/phy/mdio-mscc-miim.c b/drivers/net/phy/mdio-mscc-miim.c
index b36fe81b6e6d..c46e0c78402e 100644
--- a/drivers/net/phy/mdio-mscc-miim.c
+++ b/drivers/net/phy/mdio-mscc-miim.c
@@ -123,13 +123,6 @@ static int mscc_miim_probe(struct platform_device *pdev)
 	if (!bus)
 		return -ENOMEM;

-	bus->name = "mscc_miim";
-	bus->read = mscc_miim_read;
-	bus->write = mscc_miim_write;
-	bus->reset = mscc_miim_reset;
-	snprintf(bus->id, MII_BUS_ID_SIZE, "%s-mii", dev_name(&pdev->dev));
-	bus->parent = &pdev->dev;
-
 	dev = bus->priv;
 	dev->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(dev->regs)) {
@@ -143,6 +136,12 @@ static int mscc_miim_probe(struct platform_device *pdev)
 		return PTR_ERR(dev->phy_regs);
 	}

+	bus->name = "mscc_miim";
+	bus->read = mscc_miim_read;
+	bus->write = mscc_miim_write;
+	bus->reset = mscc_miim_reset;
+	snprintf(bus->id, MII_BUS_ID_SIZE, "%s-mii", dev_name(&pdev->dev));
+	bus->parent = &pdev->dev;
 	ret = of_mdiobus_register(bus, pdev->dev.of_node);
 	if (ret < 0) {
 		dev_err(&pdev->dev, "Cannot register MDIO bus (%d)\n", ret);
--
2.23.0
