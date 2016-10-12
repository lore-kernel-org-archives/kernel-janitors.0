From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 12 Oct 2016 06:24:52 +0000
Subject: [patch] hwmon: (max31790) potential ERR_PTR dereference
Message-Id: <20161012062452.GX12841@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, kernel-janitors@vger.kernel.org

We should only dereference "data" after we check if it is an error
pointer.

Fixes: 54187ff9d766 ('hwmon: (max31790) Convert to use new hwmon registration API')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/hwmon/max31790.c b/drivers/hwmon/max31790.c
index bef84e0..c1b9275 100644
--- a/drivers/hwmon/max31790.c
+++ b/drivers/hwmon/max31790.c
@@ -268,11 +268,13 @@ static int max31790_read_pwm(struct device *dev, u32 attr, int channel,
 			     long *val)
 {
 	struct max31790_data *data = max31790_update_device(dev);
-	u8 fan_config = data->fan_config[channel];
+	u8 fan_config;
 
 	if (IS_ERR(data))
 		return PTR_ERR(data);
 
+	fan_config = data->fan_config[channel];
+
 	switch (attr) {
 	case hwmon_pwm_input:
 		*val = data->pwm[channel] >> 8;
