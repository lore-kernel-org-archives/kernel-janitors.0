From: Colin King <colin.king@canonical.com>
Date: Wed, 06 Feb 2019 10:08:11 +0000
Subject: [PATCH] rtc: 88pm80x: fix unintended sign extension
Message-Id: <20190206100811.13315-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-rtc@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Shifting a u8 by 24 will cause the value to be promoted to an integer. If
the top bit of the u8 is set then the following conversion to an unsigned
long will sign extend the value causing the upper 32 bits to be set in
the result.

Fix this by casting the u8 value to an unsigned long before the shift.

Detected by CoverityScan, CID#714646-714649 ("Unintended sign extension")

Fixes: 2985c29c1964 ("rtc: Add rtc support to 88PM80X PMIC")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/rtc/rtc-88pm80x.c | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/drivers/rtc/rtc-88pm80x.c b/drivers/rtc/rtc-88pm80x.c
index cab293cb2bf0..1fc48ebd3cd0 100644
--- a/drivers/rtc/rtc-88pm80x.c
+++ b/drivers/rtc/rtc-88pm80x.c
@@ -114,12 +114,14 @@ static int pm80x_rtc_read_time(struct device *dev, struct rtc_time *tm)
 	unsigned char buf[4];
 	unsigned long ticks, base, data;
 	regmap_raw_read(info->map, PM800_RTC_EXPIRE2_1, buf, 4);
-	base = (buf[3] << 24) | (buf[2] << 16) | (buf[1] << 8) | buf[0];
+	base = ((unsigned long)buf[3] << 24) | (buf[2] << 16) |
+		(buf[1] << 8) | buf[0];
 	dev_dbg(info->dev, "%x-%x-%x-%x\n", buf[0], buf[1], buf[2], buf[3]);
 
 	/* load 32-bit read-only counter */
 	regmap_raw_read(info->map, PM800_RTC_COUNTER1, buf, 4);
-	data = (buf[3] << 24) | (buf[2] << 16) | (buf[1] << 8) | buf[0];
+	data = ((unsigned long)buf[3] << 24) | (buf[2] << 16) |
+		(buf[1] << 8) | buf[0];
 	ticks = base + data;
 	dev_dbg(info->dev, "get base:0x%lx, RO count:0x%lx, ticks:0x%lx\n",
 		base, data, ticks);
@@ -137,7 +139,8 @@ static int pm80x_rtc_set_time(struct device *dev, struct rtc_time *tm)
 
 	/* load 32-bit read-only counter */
 	regmap_raw_read(info->map, PM800_RTC_COUNTER1, buf, 4);
-	data = (buf[3] << 24) | (buf[2] << 16) | (buf[1] << 8) | buf[0];
+	data = ((unsigned long)buf[3] << 24) | (buf[2] << 16) |
+		(buf[1] << 8) | buf[0];
 	base = ticks - data;
 	dev_dbg(info->dev, "set base:0x%lx, RO count:0x%lx, ticks:0x%lx\n",
 		base, data, ticks);
@@ -158,11 +161,13 @@ static int pm80x_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alrm)
 	int ret;
 
 	regmap_raw_read(info->map, PM800_RTC_EXPIRE2_1, buf, 4);
-	base = (buf[3] << 24) | (buf[2] << 16) | (buf[1] << 8) | buf[0];
+	base = ((unsigned long)buf[3] << 24) | (buf[2] << 16) |
+		(buf[1] << 8) | buf[0];
 	dev_dbg(info->dev, "%x-%x-%x-%x\n", buf[0], buf[1], buf[2], buf[3]);
 
 	regmap_raw_read(info->map, PM800_RTC_EXPIRE1_1, buf, 4);
-	data = (buf[3] << 24) | (buf[2] << 16) | (buf[1] << 8) | buf[0];
+	data = ((unsigned long)buf[3] << 24) | (buf[2] << 16) |
+		(buf[1] << 8) | buf[0];
 	ticks = base + data;
 	dev_dbg(info->dev, "get base:0x%lx, RO count:0x%lx, ticks:0x%lx\n",
 		base, data, ticks);
@@ -185,12 +190,14 @@ static int pm80x_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alrm)
 	regmap_update_bits(info->map, PM800_RTC_CONTROL, PM800_ALARM1_EN, 0);
 
 	regmap_raw_read(info->map, PM800_RTC_EXPIRE2_1, buf, 4);
-	base = (buf[3] << 24) | (buf[2] << 16) | (buf[1] << 8) | buf[0];
+	base = ((unsigned long)buf[3] << 24) | (buf[2] << 16) |
+		(buf[1] << 8) | buf[0];
 	dev_dbg(info->dev, "%x-%x-%x-%x\n", buf[0], buf[1], buf[2], buf[3]);
 
 	/* load 32-bit read-only counter */
 	regmap_raw_read(info->map, PM800_RTC_COUNTER1, buf, 4);
-	data = (buf[3] << 24) | (buf[2] << 16) | (buf[1] << 8) | buf[0];
+	data = ((unsigned long)buf[3] << 24) | (buf[2] << 16) |
+		(buf[1] << 8) | buf[0];
 	ticks = base + data;
 	dev_dbg(info->dev, "get base:0x%lx, RO count:0x%lx, ticks:0x%lx\n",
 		base, data, ticks);
-- 
2.20.1
