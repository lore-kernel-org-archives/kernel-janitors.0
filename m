From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 07 Jun 2018 08:29:09 +0000
Subject: [PATCH] rtc: pxa: fix probe function
Message-Id: <20180607082909.iyukeclgrb3dtjsy@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alessandro Zummo <a.zummo@towertech.it>, Rob Herring <robh@kernel.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-rtc@vger.kernel.org, kernel-janitors@vger.kernel.org

This patch is from static analysis and I don't have the hardware to
to test it.  I think the test is reversed so now the probe function
will return success early and the last part of the function is dead
code.

Fixes: 3cdf4ad9633e ("rtc: pxa: convert to use shared sa1100 functions")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/rtc/rtc-pxa.c b/drivers/rtc/rtc-pxa.c
index 47304f5664d8..e1887b86fdc7 100644
--- a/drivers/rtc/rtc-pxa.c
+++ b/drivers/rtc/rtc-pxa.c
@@ -363,7 +363,7 @@ static int __init pxa_rtc_probe(struct platform_device *pdev)
 	sa1100_rtc->rtar = pxa_rtc->base + 0x4;
 	sa1100_rtc->rttr = pxa_rtc->base + 0xc;
 	ret = sa1100_rtc_init(pdev, sa1100_rtc);
-	if (!ret) {
+	if (ret) {
 		dev_err(dev, "Unable to init SA1100 RTC sub-device\n");
 		return ret;
 	}
