From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 14 May 2014 12:55:24 +0000
Subject: [patch] usb: phy: msm: devm_ioremap() doesn't return ERR_PTRs
Message-Id: <20140514125524.GB14571@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1400050877.8431.9.camel@iivanov-dev>
In-Reply-To: <1400050877.8431.9.camel@iivanov-dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Felipe Balbi <balbi@ti.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, kernel-janitors@vger.kernel.org

devm_ioremap() returns a NULL on error so the IS_ERR() check needs to be
updated.

Fixes: 6b99c68ec1f9 ('usb: phy: msm: Migrate to Managed Device Resource allocation')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/usb/phy/phy-msm-usb.c b/drivers/usb/phy/phy-msm-usb.c
index c522c4f..bd32257 100644
--- a/drivers/usb/phy/phy-msm-usb.c
+++ b/drivers/usb/phy/phy-msm-usb.c
@@ -1587,8 +1587,8 @@ static int msm_otg_probe(struct platform_device *pdev)
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	motg->regs = devm_ioremap(&pdev->dev, res->start, resource_size(res));
-	if (IS_ERR(motg->regs))
-		return PTR_ERR(motg->regs);
+	if (!motg->regs)
+		return -ENOMEM;
 
 	/*
 	 * NOTE: The PHYs can be multiplexed between the chipidea controller
