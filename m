From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 01 Aug 2014 08:53:44 +0000
Subject: [patch] can: c_can: checking IS_ERR() instead of NULL
Message-Id: <20140801085344.GA31702@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wolfgang Grandegger <wg@grandegger.com>, George Cherian <george.cherian@ti.com>
Cc: Marc Kleine-Budde <mkl@pengutronix.de>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, Thor Thayer <tthayer@altera.com>, Pavel Machek <pavel@denx.de>, Mugunthan V N <mugunthanvnm@ti.com>, "Lad, Prabhakar" <prabhakar.csengg@gmail.com>, Wolfram Sang <wsa@sang-engineering.com>, linux-can@vger.kernel.org, kernel-janitors@vger.kernel.org

devm_ioremap() returns NULL on error, not an ERR_PTR().

Fixes: 33cf75656923 ('can: c_can_platform: Fix raminit, use devm_ioremap() instead of devm_ioremap_resource()')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
This will need to go to -stable because the patch which introduces the
bug is going to be pushed to -stable.

diff --git a/drivers/net/can/c_can/c_can_platform.c b/drivers/net/can/c_can/c_can_platform.c
index 5dede6e..109cb44 100644
--- a/drivers/net/can/c_can/c_can_platform.c
+++ b/drivers/net/can/c_can/c_can_platform.c
@@ -280,7 +280,7 @@ static int c_can_plat_probe(struct platform_device *pdev)
 
 		priv->raminit_ctrlreg = devm_ioremap(&pdev->dev, res->start,
 						     resource_size(res));
-		if (IS_ERR(priv->raminit_ctrlreg) || priv->instance < 0)
+		if (!priv->raminit_ctrlreg || priv->instance < 0)
 			dev_info(&pdev->dev, "control memory is not used for raminit\n");
 		else
 			priv->raminit = c_can_hw_raminit_ti;
