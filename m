From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 24 Oct 2017 09:47:42 +0000
Subject: [PATCH] hwmon: (max6621) Inverted if condition in max6621_read()
Message-Id: <20171024094742.qpltjxlvzr25muje@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jean Delvare <jdelvare@suse.com>, Vadim Pasternak <vadimp@mellanox.com>
Cc: Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org, kernel-janitors@vger.kernel.org

We intended to test for failure here but accidentally tested for
success.  It means that we don't set "*val" to true and it means that
if i2c_smbus_write_byte() does fail then we return success.

Fixes: e7895864b0d7 ("hwmon: (max6621) Add support for Maxim MAX6621 temperature sensor")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/hwmon/max6621.c b/drivers/hwmon/max6621.c
index 22079ec29660..35555f0eefb9 100644
--- a/drivers/hwmon/max6621.c
+++ b/drivers/hwmon/max6621.c
@@ -296,7 +296,7 @@ max6621_read(struct device *dev, enum hwmon_sensor_types type, u32 attr,
 			if (regval) {
 				ret = i2c_smbus_write_byte(data->client,
 						MAX6621_CLEAR_ALERT_REG);
-				if (!ret)
+				if (ret)
 					return ret;
 			}
 
