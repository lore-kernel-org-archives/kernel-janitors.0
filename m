From: Markus Elfring <Markus.Elfring@web.de>
Date: Fri, 27 Sep 2019 08:18:27 +0000
Subject: [PATCH v2 2/2] net: phy: mscc-miim: Move the setting of mii_bus structure members in mscc_miim_probe
Message-Id: <70ec73ad-19aa-76aa-168b-b9a2a6911938@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <189ccfc3-d5a6-79fd-29b8-1f7140e9639a@web.de>
 <506889a6-4148-89f9-302e-4be069595bb4@web.de> <20190920190908.GH3530@lunn.ch>
 <121e75c5-4d45-9df2-a471-6997a1fb3218@web.de>
 <20190926161825.GB6825@piout.net>
 <0a1f4dbf-4cc6-8530-a38e-31c3369e6db6@web.de>
 <20190926193239.GC6825@piout.net>
 <8fbfa9ad-182a-e2ce-e91f-7350523e33c7@web.de>
In-Reply-To: <8fbfa9ad-182a-e2ce-e91f-7350523e33c7@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: netdev@vger.kernel.org, Alexandre Belloni <alexandre.belloni@bootlin.com>, Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, "David S. Miller" <davem@davemloft.net>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 27 Sep 2019 09:30:14 +0200

Move the modification of some members in the data structure “mii_bus”
for the local variable “bus” directly before the call of
the function “of_mdiobus_register” so that this change will be performed
only after previous resource allocations succeeded.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---

v2:
This suggestion was repeated based on the change for the previous update step.


 drivers/net/phy/mdio-mscc-miim.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/net/phy/mdio-mscc-miim.c b/drivers/net/phy/mdio-mscc-miim.c
index aabb13982251..a270f83bb207 100644
--- a/drivers/net/phy/mdio-mscc-miim.c
+++ b/drivers/net/phy/mdio-mscc-miim.c
@@ -124,13 +124,6 @@ static int mscc_miim_probe(struct platform_device *pdev)
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
@@ -147,6 +140,12 @@ static int mscc_miim_probe(struct platform_device *pdev)
 		}
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
