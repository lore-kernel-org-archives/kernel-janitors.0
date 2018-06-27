From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 27 Jun 2018 08:37:05 +0000
Subject: [PATCH v2] USB: host: ehci-npcm7xx:  Fix some error codes in probe
Message-Id: <20180627083705.ufge2afrszr7ylm5@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alan Stern <stern@rowland.harvard.edu>, Avi Fishman <AviFishman70@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org

We accidentally return 1 instead of negative error codes.

Fixes: df44831ee2dd ("USB host: Add USB ehci support for nuvoton npcm7xx platform")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
v2: fix typo in the commit message

diff --git a/drivers/usb/host/ehci-npcm7xx.c b/drivers/usb/host/ehci-npcm7xx.c
index c80a8792d3b0..adaf8fb4b459 100644
--- a/drivers/usb/host/ehci-npcm7xx.c
+++ b/drivers/usb/host/ehci-npcm7xx.c
@@ -74,14 +74,14 @@ static int npcm7xx_ehci_hcd_drv_probe(struct platform_device *pdev)
 	if (IS_ERR(gcr_regmap)) {
 		dev_err(&pdev->dev, "%s: failed to find nuvoton,npcm750-gcr\n",
 			__func__);
-		return IS_ERR(gcr_regmap);
+		return PTR_ERR(gcr_regmap);
 	}
 
 	rst_regmap = syscon_regmap_lookup_by_compatible("nuvoton,npcm750-rst");
 	if (IS_ERR(rst_regmap)) {
 		dev_err(&pdev->dev, "%s: failed to find nuvoton,npcm750-rst\n",
 			__func__);
-		return IS_ERR(rst_regmap);
+		return PTR_ERR(rst_regmap);
 	}
 
 	/********* phy init  ******/
