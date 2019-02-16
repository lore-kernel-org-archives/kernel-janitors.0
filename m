From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Sat, 16 Feb 2019 01:36:03 +0000
Subject: [PATCH -next] rtc: wilco_ec: Make some functions static
Message-Id: <20190216013603.117969-1-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Nick Crews <ncrews@chromium.org>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, linux-rtc@vger.kernel.org, kernel-janitors@vger.kernel.org

Fixes the following sparse warnings:

drivers/rtc/rtc-wilco-ec.c:72:5: warning:
 symbol 'wilco_ec_rtc_read' was not declared. Should it be static?
drivers/rtc/rtc-wilco-ec.c:106:5: warning:
 symbol 'wilco_ec_rtc_write' was not declared. Should it be static?

Fixes: 79c4ec4869b5 ("platform/chrome: wilco_ec: Add RTC driver")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/rtc/rtc-wilco-ec.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-wilco-ec.c b/drivers/rtc/rtc-wilco-ec.c
index 35cc56114c1c..e62bda0cb53e 100644
--- a/drivers/rtc/rtc-wilco-ec.c
+++ b/drivers/rtc/rtc-wilco-ec.c
@@ -69,7 +69,7 @@ struct ec_rtc_write {
 	u8 weekday;
 } __packed;
 
-int wilco_ec_rtc_read(struct device *dev, struct rtc_time *tm)
+static int wilco_ec_rtc_read(struct device *dev, struct rtc_time *tm)
 {
 	struct wilco_ec_device *ec = dev_get_drvdata(dev->parent);
 	u8 param = EC_CMOS_TOD_READ;
@@ -103,7 +103,7 @@ int wilco_ec_rtc_read(struct device *dev, struct rtc_time *tm)
 	return 0;
 }
 
-int wilco_ec_rtc_write(struct device *dev, struct rtc_time *tm)
+static int wilco_ec_rtc_write(struct device *dev, struct rtc_time *tm)
 {
 	struct wilco_ec_device *ec = dev_get_drvdata(dev->parent);
 	struct ec_rtc_write rtc;
