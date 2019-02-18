From: YueHaibing <yuehaibing@huawei.com>
Date: Mon, 18 Feb 2019 13:31:03 +0000
Subject: [PATCH -next] Input: ti_am335x_tsc - remove set but not used variable 'tscadc_dev'
Message-Id: <20190218133103.93973-1-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/input/touchscreen/ti_am335x_tsc.c: In function 'titsc_suspend':
drivers/input/touchscreen/ti_am335x_tsc.c:510:24: warning:
 variable 'tscadc_dev' set but not used [-Wunused-but-set-variable]

drivers/input/touchscreen/ti_am335x_tsc.c: In function 'titsc_resume':
drivers/input/touchscreen/ti_am335x_tsc.c:527:24: warning:
 variable 'tscadc_dev' set but not used [-Wunused-but-set-variable]

It's not used any more after 333e07ec4b33 ("Input: ti_am335x_tsc: Mark TSC
device as wakeup source")

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/input/touchscreen/ti_am335x_tsc.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/input/touchscreen/ti_am335x_tsc.c b/drivers/input/touchscreen/ti_am335x_tsc.c
index 9e8684ab48f4..83e685557a19 100644
--- a/drivers/input/touchscreen/ti_am335x_tsc.c
+++ b/drivers/input/touchscreen/ti_am335x_tsc.c
@@ -507,10 +507,8 @@ static int titsc_remove(struct platform_device *pdev)
 static int __maybe_unused titsc_suspend(struct device *dev)
 {
 	struct titsc *ts_dev = dev_get_drvdata(dev);
-	struct ti_tscadc_dev *tscadc_dev;
 	unsigned int idle;
 
-	tscadc_dev = ti_tscadc_dev_get(to_platform_device(dev));
 	if (device_may_wakeup(dev)) {
 		titsc_writel(ts_dev, REG_IRQSTATUS, TSC_IRQENB_MASK);
 		idle = titsc_readl(ts_dev, REG_IRQENABLE);
@@ -524,9 +522,7 @@ static int __maybe_unused titsc_suspend(struct device *dev)
 static int __maybe_unused titsc_resume(struct device *dev)
 {
 	struct titsc *ts_dev = dev_get_drvdata(dev);
-	struct ti_tscadc_dev *tscadc_dev;
 
-	tscadc_dev = ti_tscadc_dev_get(to_platform_device(dev));
 	if (device_may_wakeup(dev)) {
 		titsc_writel(ts_dev, REG_IRQWAKEUP,
 				0x00);
