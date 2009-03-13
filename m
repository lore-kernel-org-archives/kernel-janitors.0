From: Adam Buchbinder <adam.buchbinder@gmail.com>
Date: Fri, 13 Mar 2009 16:15:26 +0000
Subject: [PATCH] Fix misspelling of "Celsius".
Message-Id: <1236960926-26558-1-git-send-email-adam.buchbinder@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <26b51c320903130809m6ed50538oea0398cdad93dee3@mail.gmail.com>
In-Reply-To: <26b51c320903130809m6ed50538oea0398cdad93dee3@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

A few comments say "Celcius"; this fixes them. No code changes.

Signed-off-by: Adam Buchbinder <adam.buchbinder@gmail.com>
---
 drivers/acpi/thermal.c              |    2 +-
 drivers/input/touchscreen/ads7846.c |    2 +-
 drivers/power/bq27x00_battery.c     |    2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/acpi/thermal.c b/drivers/acpi/thermal.c
index 99e6f1f..0c30ec0 100644
--- a/drivers/acpi/thermal.c
+++ b/drivers/acpi/thermal.c
@@ -367,7 +367,7 @@ static int acpi_thermal_trips_update(struct acpi_thermal *tz, int flag)
 		/*
 		 * Treat freezing temperatures as invalid as well; some
 		 * BIOSes return really low values and cause reboots at startup.
-		 * Below zero (Celcius) values clearly aren't right for sure..
+		 * Below zero (Celsius) values clearly aren't right for sure..
 		 * ... so lets discard those as invalid.
 		 */
 		if (ACPI_FAILURE(status) ||
diff --git a/drivers/input/touchscreen/ads7846.c b/drivers/input/touchscreen/ads7846.c
index 7c27c8b..056ac77 100644
--- a/drivers/input/touchscreen/ads7846.c
+++ b/drivers/input/touchscreen/ads7846.c
@@ -295,7 +295,7 @@ name ## _show(struct device *dev, struct device_attribute *attr, char *buf) \
 static DEVICE_ATTR(name, S_IRUGO, name ## _show, NULL);
 
 
-/* Sysfs conventions report temperatures in millidegrees Celcius.
+/* Sysfs conventions report temperatures in millidegrees Celsius.
  * ADS7846 could use the low-accuracy two-sample scheme, but can't do the high
  * accuracy scheme without calibration data.  For now we won't try either;
  * userspace sees raw sensor values, and must scale/calibrate appropriately.
diff --git a/drivers/power/bq27x00_battery.c b/drivers/power/bq27x00_battery.c
index 0c056fc..62bb981 100644
--- a/drivers/power/bq27x00_battery.c
+++ b/drivers/power/bq27x00_battery.c
@@ -83,7 +83,7 @@ static int bq27x00_read(u8 reg, int *rt_value, int b_single,
 }
 
 /*
- * Return the battery temperature in Celcius degrees
+ * Return the battery temperature in Celsius degrees
  * Or < 0 if something fails.
  */
 static int bq27x00_battery_temperature(struct bq27x00_device_info *di)
-- 
1.5.6.3

