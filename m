From: Markus Elfring <Markus.Elfring@web.de>
Date: Fri, 20 Sep 2019 14:28:00 +0000
Subject: [PATCH 1/2] net: dsa: vsc73xx: Use devm_platform_ioremap_resource() in vsc73xx_platform_probe()
Message-Id: <dbc78014-6ed4-5080-8208-0a5930a3bf6e@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <98fee5f4-1e45-a0c6-2a38-9201b201c6eb@web.de>
In-Reply-To: <98fee5f4-1e45-a0c6-2a38-9201b201c6eb@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netdev@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Florian Fainelli <f.fainelli@gmail.com>, Pawel Dembicki <paweldembicki@gmail.com>, Vivien Didelot <vivien.didelot@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 20 Sep 2019 15:23:39 +0200

Simplify this function implementation by using a known wrapper function.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/net/dsa/vitesse-vsc73xx-platform.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/net/dsa/vitesse-vsc73xx-platform.c b/drivers/net/dsa/vitesse-vsc73xx-platform.c
index 0541785f9fee..a3bbf9bd1bf1 100644
--- a/drivers/net/dsa/vitesse-vsc73xx-platform.c
+++ b/drivers/net/dsa/vitesse-vsc73xx-platform.c
@@ -89,7 +89,6 @@ static int vsc73xx_platform_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct vsc73xx_platform *vsc_platform;
-	struct resource *res = NULL;
 	int ret;

 	vsc_platform = devm_kzalloc(dev, sizeof(*vsc_platform), GFP_KERNEL);
@@ -101,16 +100,7 @@ static int vsc73xx_platform_probe(struct platform_device *pdev)
 	vsc_platform->vsc.dev = dev;
 	vsc_platform->vsc.priv = vsc_platform;
 	vsc_platform->vsc.ops = &vsc73xx_platform_ops;
-
-	/* obtain I/O memory space */
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!res) {
-		dev_err(&pdev->dev, "cannot obtain I/O memory space\n");
-		ret = -ENXIO;
-		return ret;
-	}
-
-	vsc_platform->base_addr = devm_ioremap_resource(&pdev->dev, res);
+	vsc_platform->base_addr = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(vsc_platform->base_addr)) {
 		dev_err(&pdev->dev, "cannot request I/O memory space\n");
 		ret = -ENXIO;
--
2.23.0
