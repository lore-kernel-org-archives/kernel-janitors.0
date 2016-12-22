From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Thu, 22 Dec 2016 12:04:57 +0000
Subject: [PATCH 28/66] hwmon: (max1619) use permission-specific DEVICE_ATTR variants
Message-Id: <1482408335-3435-29-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1482408335-3435-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1482408335-3435-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jean Delvare <jdelvare@suse.com>
Cc: kernel-janitors@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org

Use DEVICE_ATTR_RO etc. for read only attributes etc.  This simplifies the
source code, improves readbility, and reduces the chance of
inconsistencies.

The semantic patch for the RO case, in the case where the show function
already has the expected name, is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@ro@
declarer name DEVICE_ATTR;
identifier x,x_show;
@@

DEVICE_ATTR(x, \(0444\|S_IRUGO\), x_show, NULL);

@script:ocaml@
x << ro.x;
x_show << ro.x_show;
@@

if not (x^"_show" = x_show) then Coccilib.include_match false

@@
declarer name DEVICE_ATTR_RO;
identifier ro.x,ro.x_show;
@@

- DEVICE_ATTR(x, \(0444\|S_IRUGO\), x_show, NULL);
+ DEVICE_ATTR_RO(x);
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/hwmon/max1619.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/max1619.c b/drivers/hwmon/max1619.c
index eda9cf5..a182789 100644
--- a/drivers/hwmon/max1619.c
+++ b/drivers/hwmon/max1619.c
@@ -173,7 +173,7 @@ static ssize_t set_temp(struct device *dev, struct device_attribute *devattr,
 	return count;
 }
 
-static ssize_t show_alarms(struct device *dev, struct device_attribute *attr,
+static ssize_t alarms_show(struct device *dev, struct device_attribute *attr,
 			   char *buf)
 {
 	struct max1619_data *data = max1619_update_device(dev);
@@ -199,7 +199,7 @@ static SENSOR_DEVICE_ATTR(temp2_crit, S_IWUSR | S_IRUGO, show_temp, set_temp,
 static SENSOR_DEVICE_ATTR(temp2_crit_hyst, S_IWUSR | S_IRUGO, show_temp,
 			  set_temp, t_hyst2);
 
-static DEVICE_ATTR(alarms, S_IRUGO, show_alarms, NULL);
+static DEVICE_ATTR_RO(alarms);
 static SENSOR_DEVICE_ATTR(temp2_crit_alarm, S_IRUGO, show_alarm, NULL, 1);
 static SENSOR_DEVICE_ATTR(temp2_fault, S_IRUGO, show_alarm, NULL, 2);
 static SENSOR_DEVICE_ATTR(temp2_min_alarm, S_IRUGO, show_alarm, NULL, 3);

