From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Thu, 22 Dec 2016 12:05:02 +0000
Subject: [PATCH 33/66] hwmon: (nsa320) use permission-specific DEVICE_ATTR variants
Message-Id: <1482408335-3435-34-git-send-email-Julia.Lawall@lip6.fr>
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
 drivers/hwmon/nsa320-hwmon.c |   12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/hwmon/nsa320-hwmon.c b/drivers/hwmon/nsa320-hwmon.c
index 0517a2657..5a16109 100644
--- a/drivers/hwmon/nsa320-hwmon.c
+++ b/drivers/hwmon/nsa320-hwmon.c
@@ -122,8 +122,8 @@ static ssize_t show_label(struct device *dev,
 	return sprintf(buf, "%s\n", nsa320_input_names[channel]);
 }
 
-static ssize_t show_temp(struct device *dev, struct device_attribute *attr,
-			 char *buf)
+static ssize_t temp1_input_show(struct device *dev,
+				struct device_attribute *attr, char *buf)
 {
 	s32 mcu_data = nsa320_hwmon_update(dev);
 
@@ -133,8 +133,8 @@ static ssize_t show_temp(struct device *dev, struct device_attribute *attr,
 	return sprintf(buf, "%d\n", (mcu_data & 0xffff) * 100);
 }
 
-static ssize_t show_fan(struct device *dev, struct device_attribute *attr,
-			char *buf)
+static ssize_t fan1_input_show(struct device *dev,
+			       struct device_attribute *attr, char *buf)
 {
 	s32 mcu_data = nsa320_hwmon_update(dev);
 
@@ -145,9 +145,9 @@ static ssize_t show_fan(struct device *dev, struct device_attribute *attr,
 }
 
 static SENSOR_DEVICE_ATTR(temp1_label, S_IRUGO, show_label, NULL, NSA320_TEMP);
-static DEVICE_ATTR(temp1_input, S_IRUGO, show_temp, NULL);
+static DEVICE_ATTR_RO(temp1_input);
 static SENSOR_DEVICE_ATTR(fan1_label, S_IRUGO, show_label, NULL, NSA320_FAN);
-static DEVICE_ATTR(fan1_input, S_IRUGO, show_fan, NULL);
+static DEVICE_ATTR_RO(fan1_input);
 
 static struct attribute *nsa320_attrs[] = {
 	&sensor_dev_attr_temp1_label.dev_attr.attr,

