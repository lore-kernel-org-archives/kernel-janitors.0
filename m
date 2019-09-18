From: Markus Elfring <Markus.Elfring@web.de>
Date: Wed, 18 Sep 2019 19:12:48 +0000
Subject: [PATCH] staging: mt7621-pci-phy: Use devm_platform_ioremap_resource() in mt7621_pci_phy_probe()
Message-Id: <1c16a43c-3a01-8a86-02b0-1941ab7321dd@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: devel@driverdev.osuosl.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, =?UTF-8?Q?Antti_Ker=c3=a4nen?= <detegr@gmail.com>, Emanuel Bennici <benniciemanuel78@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Matthias Brugger <matthias.bgg@gmail.com>, Neil Brown <neil@brown.name>, Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Himanshu Jha <himanshujha199640@gmail.com>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 18 Sep 2019 21:01:32 +0200

Simplify this function implementation by using a known wrapper function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/staging/mt7621-pci-phy/pci-mt7621-phy.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/staging/mt7621-pci-phy/pci-mt7621-phy.c b/drivers/staging/mt7621-pci-phy/pci-mt7621-phy.c
index d2a07f145143..6ca4a33d13c3 100644
--- a/drivers/staging/mt7621-pci-phy/pci-mt7621-phy.c
+++ b/drivers/staging/mt7621-pci-phy/pci-mt7621-phy.c
@@ -324,7 +324,6 @@ static int mt7621_pci_phy_probe(struct platform_device *pdev)
 	const struct soc_device_attribute *attr;
 	struct phy_provider *provider;
 	struct mt7621_pci_phy *phy;
-	struct resource *res;
 	int port;
 	void __iomem *port_base;

@@ -344,14 +343,7 @@ static int mt7621_pci_phy_probe(struct platform_device *pdev)

 	phy->dev = dev;
 	platform_set_drvdata(pdev, phy);
-
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!res) {
-		dev_err(dev, "failed to get address resource\n");
-		return -ENXIO;
-	}
-
-	port_base = devm_ioremap_resource(dev, res);
+	port_base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(port_base)) {
 		dev_err(dev, "failed to remap phy regs\n");
 		return PTR_ERR(port_base);
--
2.23.0
