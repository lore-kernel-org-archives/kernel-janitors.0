From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Fri, 08 May 2020 10:11:14 +0000
Subject: [PATCH net-next] net: dsa: vsc73xx: convert to devm_platform_ioremap_resource
Message-Id: <20200508101114.2331-1-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

Use the helper function that wraps the calls to platform_get_resource()
and devm_ioremap_resource() together.

Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/net/dsa/vitesse-vsc73xx-platform.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/net/dsa/vitesse-vsc73xx-platform.c b/drivers/net/dsa/vitesse-vsc73xx-platform.c
index 0541785f9fee..5e54a5726aa4 100644
--- a/drivers/net/dsa/vitesse-vsc73xx-platform.c
+++ b/drivers/net/dsa/vitesse-vsc73xx-platform.c
@@ -89,7 +89,6 @@ static int vsc73xx_platform_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct vsc73xx_platform *vsc_platform;
-	struct resource *res = NULL;
 	int ret;
 
 	vsc_platform = devm_kzalloc(dev, sizeof(*vsc_platform), GFP_KERNEL);
@@ -103,14 +102,7 @@ static int vsc73xx_platform_probe(struct platform_device *pdev)
 	vsc_platform->vsc.ops = &vsc73xx_platform_ops;
 
 	/* obtain I/O memory space */
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
