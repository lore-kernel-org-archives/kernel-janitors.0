From: Markus Elfring <Markus.Elfring@web.de>
Date: Fri, 27 Sep 2019 08:16:56 +0000
Subject: [PATCH v2 1/2] net: phy: mscc-miim: Use devm_platform_ioremap_resource() in mscc_miim_probe()
Message-Id: <90c7a71f-d39a-2615-eedb-cc2d1150f3b3@web.de>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netdev@vger.kernel.org, Alexandre Belloni <alexandre.belloni@bootlin.com>, Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, "David S. Miller" <davem@davemloft.net>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 27 Sep 2019 09:24:03 +0200

Simplify this function implementation a bit by using
a known wrapper function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---

v2:
Alexandre Belloni pointed the need for adjustments out.
https://lore.kernel.org/r/20190926193239.GC6825@piout.net/

* The mapping of internal phy registers should be treated as optional.
* An other prefix would be preferred in the commit subject.


 drivers/net/phy/mdio-mscc-miim.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/net/phy/mdio-mscc-miim.c b/drivers/net/phy/mdio-mscc-miim.c
index badbc99bedd3..aabb13982251 100644
--- a/drivers/net/phy/mdio-mscc-miim.c
+++ b/drivers/net/phy/mdio-mscc-miim.c
@@ -120,10 +120,6 @@ static int mscc_miim_probe(struct platform_device *pdev)
 	struct mscc_miim_dev *dev;
 	int ret;

-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!res)
-		return -ENODEV;
-
 	bus = devm_mdiobus_alloc_size(&pdev->dev, sizeof(*dev));
 	if (!bus)
 		return -ENOMEM;
@@ -136,7 +132,7 @@ static int mscc_miim_probe(struct platform_device *pdev)
 	bus->parent = &pdev->dev;

 	dev = bus->priv;
-	dev->regs = devm_ioremap_resource(&pdev->dev, res);
+	dev->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(dev->regs)) {
 		dev_err(&pdev->dev, "Unable to map MIIM registers\n");
 		return PTR_ERR(dev->regs);
--
2.23.0
