From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 02 Nov 2017 09:50:08 +0000
Subject: [PATCH] rtc-ds1302: Use common error handling code in ds1302_probe()
Message-Id: <1e446a0e-3928-d4b5-d916-b25ae3d4b6f5@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-rtc@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@free-electrons.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 2 Nov 2017 10:45:08 +0100

* Add a jump target so that a specific error message is stored only once
  at the end of this function implementation.

* Replace two calls of the function "dev_err" by goto statements.

* Adjust two condition checks.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/rtc/rtc-ds1302.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/drivers/rtc/rtc-ds1302.c b/drivers/rtc/rtc-ds1302.c
index 0ec4be62322b..06ef64736ac3 100644
--- a/drivers/rtc/rtc-ds1302.c
+++ b/drivers/rtc/rtc-ds1302.c
@@ -132,19 +132,13 @@ static int ds1302_probe(struct spi_device *spi)
 
 	addr = RTC_ADDR_CTRL << 1 | RTC_CMD_READ;
 	status = spi_write_then_read(spi, &addr, sizeof(addr), buf, 1);
-	if (status < 0) {
-		dev_err(&spi->dev, "control register read error %d\n",
-				status);
-		return status;
-	}
+	if (status)
+		goto report_read_failure;
 
 	if ((buf[0] & ~RTC_CMD_WRITE_DISABLE) != 0) {
 		status = spi_write_then_read(spi, &addr, sizeof(addr), buf, 1);
-		if (status < 0) {
-			dev_err(&spi->dev, "control register read error %d\n",
-					status);
-			return status;
-		}
+		if (status)
+			goto report_read_failure;
 
 		if ((buf[0] & ~RTC_CMD_WRITE_DISABLE) != 0) {
 			dev_err(&spi->dev, "junk in control register\n");
@@ -189,6 +183,10 @@ static int ds1302_probe(struct spi_device *spi)
 	}
 
 	return 0;
+
+report_read_failure:
+	dev_err(&spi->dev, "control register read error %d\n", status);
+	return status;
 }
 
 static int ds1302_remove(struct spi_device *spi)
-- 
2.14.3

