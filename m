From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 10 May 2016 08:01:33 +0000
Subject: [patch] phy: bcm-ns-usb2: checking the wrong variable
Message-Id: <20160510080133.GA4191@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kishon Vijay Abraham I <kishon@ti.com>, =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

We intended to test "usb2->phy" here instead of "dev".

Fixes: d3feb4067335 ('phy: bcm-ns-usb2: new driver for USB 2.0 PHY on Northstar')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/phy/phy-bcm-ns-usb2.c b/drivers/phy/phy-bcm-ns-usb2.c
index 95ab6b2..58dff80 100644
--- a/drivers/phy/phy-bcm-ns-usb2.c
+++ b/drivers/phy/phy-bcm-ns-usb2.c
@@ -109,8 +109,8 @@ static int bcm_ns_usb2_probe(struct platform_device *pdev)
 	}
 
 	usb2->phy = devm_phy_create(dev, NULL, &ops);
-	if (IS_ERR(dev))
-		return PTR_ERR(dev);
+	if (IS_ERR(usb2->phy))
+		return PTR_ERR(usb2->phy);
 
 	phy_set_drvdata(usb2->phy, usb2);
 	platform_set_drvdata(pdev, usb2);
