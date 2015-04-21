From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 21 Apr 2015 09:34:10 +0000
Subject: [patch] thermal: rockchip: fix an error code
Message-Id: <20150421093410.GE12098@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Zhang Rui <rui.zhang-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Caesar Wang <caesar.wang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: Eduardo Valentin <edubezval-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, linux-pm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

There is a copy and paste bug, "->clk" vs "->pclk", so we return the
wrong error code here.

Fixes: cbac8f639437 ('thermal: rockchip: add driver for thermal')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/thermal/rockchip_thermal.c b/drivers/thermal/rockchip_thermal.c
index 3aa46ac..cd8f5f93 100644
--- a/drivers/thermal/rockchip_thermal.c
+++ b/drivers/thermal/rockchip_thermal.c
@@ -529,7 +529,7 @@ static int rockchip_thermal_probe(struct platform_device *pdev)
 
 	thermal->pclk = devm_clk_get(&pdev->dev, "apb_pclk");
 	if (IS_ERR(thermal->pclk)) {
-		error = PTR_ERR(thermal->clk);
+		error = PTR_ERR(thermal->pclk);
 		dev_err(&pdev->dev, "failed to get apb_pclk clock: %d\n",
 			error);
 		return error;
