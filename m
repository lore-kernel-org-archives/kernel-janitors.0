From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 14 Mar 2017 07:56:30 +0000
Subject: [PATCH] rtc: cpcap: kfreeing devm allocated memory
Message-Id: <20170314075319.GB6111@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alessandro Zummo <a.zummo@towertech.it>, Sebastian Reichel <sre@kernel.org>
Cc: Alexandre Belloni <alexandre.belloni@free-electrons.com>, rtc-linux@googlegroups.com, kernel-janitors@vger.kernel.org

We shouldn't kfree(rtc) because is devm_ managed memory.  It leads to a
double free.

Fixes: dd3bf50b35e3 ("rtc: cpcap: new rtc driver")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/rtc/rtc-cpcap.c b/drivers/rtc/rtc-cpcap.c
index 7c6a3c3167bd..5d163be98e9f 100644
--- a/drivers/rtc/rtc-cpcap.c
+++ b/drivers/rtc/rtc-cpcap.c
@@ -266,10 +266,8 @@ static int cpcap_rtc_probe(struct platform_device *pdev)
 	rtc->rtc_dev = devm_rtc_device_register(dev, "cpcap_rtc",
 						&cpcap_rtc_ops, THIS_MODULE);
 
-	if (IS_ERR(rtc->rtc_dev)) {
-		kfree(rtc);
+	if (IS_ERR(rtc->rtc_dev))
 		return PTR_ERR(rtc->rtc_dev);
-	}
 
 	err = cpcap_get_vendor(dev, rtc->regmap, &rtc->vendor);
 	if (err)
