From: Dan Carpenter <error27@gmail.com>
Date: Sat, 18 Jun 2011 18:49:21 +0000
Subject: [patch] thermal: snprintf() limit too high in
Message-Id: <20110618184921.GC14591@shale.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

tz->temp_input.name and tz->temp_crit.name are 16 chars, they're not
THERMAL_NAME_LENGTH (20 chars).

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/thermal/thermal_sys.c b/drivers/thermal/thermal_sys.c
index 0b1c82a..a07cce4 100644
--- a/drivers/thermal/thermal_sys.c
+++ b/drivers/thermal/thermal_sys.c
@@ -505,7 +505,7 @@ thermal_add_hwmon_sysfs(struct thermal_zone_device *tz)
 	tz->hwmon = hwmon;
 	hwmon->count++;
 
-	snprintf(tz->temp_input.name, THERMAL_NAME_LENGTH,
+	snprintf(tz->temp_input.name, sizeof(tz->temp_input.name),
 		 "temp%d_input", hwmon->count);
 	tz->temp_input.attr.attr.name = tz->temp_input.name;
 	tz->temp_input.attr.attr.mode = 0444;
@@ -518,7 +518,7 @@ thermal_add_hwmon_sysfs(struct thermal_zone_device *tz)
 	if (tz->ops->get_crit_temp) {
 		unsigned long temperature;
 		if (!tz->ops->get_crit_temp(tz, &temperature)) {
-			snprintf(tz->temp_crit.name, THERMAL_NAME_LENGTH,
+			snprintf(tz->temp_crit.name, sizeof(tz->temp_crit.name),
 				"temp%d_crit", hwmon->count);
 			tz->temp_crit.attr.attr.name = tz->temp_crit.name;
 			tz->temp_crit.attr.attr.mode = 0444;
