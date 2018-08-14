From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 14 Aug 2018 09:12:36 +0000
Subject: [PATCH 1/2] hwmon: (adt7475) Potential error pointer dereferences
Message-Id: <20180814091236.zubxfj32bedobr52@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jean Delvare <jdelvare@suse.com>, Tokunori Ikegami <ikegami@allied-telesis.co.jp>
Cc: Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org, kernel-janitors@vger.kernel.org

The adt7475_update_device() function returns error pointers.  The
problem is that in show_pwmfreq() we dereference it before the check.
And then in pwm_use_point2_pwm_at_crit_show() there isn't a check at
all.  I don't know if it's required, but it silences a static checker
warning and it's doesn't hurt anything to check.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/hwmon/adt7475.c b/drivers/hwmon/adt7475.c
index 90837f7c7d0f..16045149f3db 100644
--- a/drivers/hwmon/adt7475.c
+++ b/drivers/hwmon/adt7475.c
@@ -962,13 +962,14 @@ static ssize_t show_pwmfreq(struct device *dev, struct device_attribute *attr,
 {
 	struct adt7475_data *data = adt7475_update_device(dev);
 	struct sensor_device_attribute_2 *sattr = to_sensor_dev_attr_2(attr);
-	int i = clamp_val(data->range[sattr->index] & 0xf, 0,
-			  ARRAY_SIZE(pwmfreq_table) - 1);
+	int idx;
 
 	if (IS_ERR(data))
 		return PTR_ERR(data);
+	idx = clamp_val(data->range[sattr->index] & 0xf, 0,
+			ARRAY_SIZE(pwmfreq_table) - 1);
 
-	return sprintf(buf, "%d\n", pwmfreq_table[i]);
+	return sprintf(buf, "%d\n", pwmfreq_table[idx]);
 }
 
 static ssize_t set_pwmfreq(struct device *dev, struct device_attribute *attr,
@@ -1004,6 +1005,10 @@ static ssize_t pwm_use_point2_pwm_at_crit_show(struct device *dev,
 					char *buf)
 {
 	struct adt7475_data *data = adt7475_update_device(dev);
+
+	if (IS_ERR(data))
+		return PTR_ERR(data);
+
 	return sprintf(buf, "%d\n", !!(data->config4 & CONFIG4_MAXDUTY));
 }
 
