From: Colin King <colin.king@canonical.com>
Date: Thu, 01 Nov 2018 14:53:52 +0000
Subject: [PATCH] rtc:  clean up indentation issues, remove extraneous space, add missing tabs
Message-Id: <20181101145352.14104-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-rtc@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to clean up indentation issues, remove spaces, add missing
tabs

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/rtc/rtc-ep93xx.c  | 2 +-
 drivers/rtc/rtc-max6916.c | 2 +-
 drivers/rtc/rtc-rk808.c   | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/rtc/rtc-ep93xx.c b/drivers/rtc/rtc-ep93xx.c
index 694038208745..1932a4f861d1 100644
--- a/drivers/rtc/rtc-ep93xx.c
+++ b/drivers/rtc/rtc-ep93xx.c
@@ -61,7 +61,7 @@ static int ep93xx_rtc_read_time(struct device *dev, struct rtc_time *tm)
 	struct ep93xx_rtc *ep93xx_rtc = dev_get_platdata(dev);
 	unsigned long time;
 
-	 time = readl(ep93xx_rtc->mmio_base + EP93XX_RTC_DATA);
+	time = readl(ep93xx_rtc->mmio_base + EP93XX_RTC_DATA);
 
 	rtc_time_to_tm(time, tm);
 	return 0;
diff --git a/drivers/rtc/rtc-max6916.c b/drivers/rtc/rtc-max6916.c
index 7e908a490cf6..9d4b407cc4b8 100644
--- a/drivers/rtc/rtc-max6916.c
+++ b/drivers/rtc/rtc-max6916.c
@@ -86,7 +86,7 @@ static int max6916_set_time(struct device *dev, struct rtc_time *dt)
 	if (dt->tm_year < 100 || dt->tm_year > 199) {
 		dev_err(&spi->dev, "Year must be between 2000 and 2099. It's %d.\n",
 			dt->tm_year + 1900);
-	return -EINVAL;
+		return -EINVAL;
 	}
 
 	buf[0] = MAX6916_CLOCK_BURST & 0x7F;
diff --git a/drivers/rtc/rtc-rk808.c b/drivers/rtc/rtc-rk808.c
index 739c0d42e835..b2f9e45e0298 100644
--- a/drivers/rtc/rtc-rk808.c
+++ b/drivers/rtc/rtc-rk808.c
@@ -400,7 +400,7 @@ static int rk808_rtc_probe(struct platform_device *pdev)
 	if (ret) {
 		dev_err(&pdev->dev,
 			"Failed to write RTC status: %d\n", ret);
-			return ret;
+		return ret;
 	}
 
 	device_init_wakeup(&pdev->dev, 1);
-- 
2.19.1
