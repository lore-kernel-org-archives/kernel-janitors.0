From: Markus Elfring <Markus.Elfring@web.de>
Date: Fri, 20 Sep 2019 14:30:13 +0000
Subject: [PATCH 2/2] net: dsa: vsc73xx: Return an error code as a constant in vsc73xx_platform_probe()
Message-Id: <738c12c8-f51e-d2e5-f31e-7f726cf6325d@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <98fee5f4-1e45-a0c6-2a38-9201b201c6eb@web.de>
In-Reply-To: <98fee5f4-1e45-a0c6-2a38-9201b201c6eb@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: netdev@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Florian Fainelli <f.fainelli@gmail.com>, Pawel Dembicki <paweldembicki@gmail.com>, Vivien Didelot <vivien.didelot@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 20 Sep 2019 16:07:07 +0200

* Return an error code without storing it in an intermediate variable.

* Delete the local variable “ret” which became unnecessary
  with this refactoring.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/net/dsa/vitesse-vsc73xx-platform.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/net/dsa/vitesse-vsc73xx-platform.c b/drivers/net/dsa/vitesse-vsc73xx-platform.c
index a3bbf9bd1bf1..0ae8d904ca85 100644
--- a/drivers/net/dsa/vitesse-vsc73xx-platform.c
+++ b/drivers/net/dsa/vitesse-vsc73xx-platform.c
@@ -89,7 +89,6 @@ static int vsc73xx_platform_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct vsc73xx_platform *vsc_platform;
-	int ret;

 	vsc_platform = devm_kzalloc(dev, sizeof(*vsc_platform), GFP_KERNEL);
 	if (!vsc_platform)
@@ -103,8 +102,7 @@ static int vsc73xx_platform_probe(struct platform_device *pdev)
 	vsc_platform->base_addr = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(vsc_platform->base_addr)) {
 		dev_err(&pdev->dev, "cannot request I/O memory space\n");
-		ret = -ENXIO;
-		return ret;
+		return -ENXIO;
 	}

 	return vsc73xx_probe(&vsc_platform->vsc);
--
2.23.0
