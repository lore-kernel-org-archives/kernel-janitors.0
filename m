From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 27 Jan 2021 05:25:26 +0000
Subject: [PATCH] hwmon: (aht10) Unlock on error in aht10_read_values()
Message-Id: <YBD5Ro549hMJSnW4@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jean Delvare <jdelvare@suse.com>, Johannes Cornelis Draaijer <jcdra1@gmail.com>
Cc: Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org, kernel-janitors@vger.kernel.org

This error path needs to drop the lock before returning.

Fixes: afd018716398 ("hwmon: Add AHT10 Temperature and Humidity Sensor Driver")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/hwmon/aht10.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/aht10.c b/drivers/hwmon/aht10.c
index c70d8c2d0c1f..2d9770cb4401 100644
--- a/drivers/hwmon/aht10.c
+++ b/drivers/hwmon/aht10.c
@@ -138,8 +138,10 @@ static int aht10_read_values(struct aht10_data *data)
 	mutex_lock(&data->lock);
 	if (aht10_polltime_expired(data)) {
 		res = i2c_master_send(client, cmd_meas, sizeof(cmd_meas));
-		if (res < 0)
+		if (res < 0) {
+			mutex_unlock(&data->lock);
 			return res;
+		}
 
 		usleep_range(AHT10_MEAS_DELAY,
 			     AHT10_MEAS_DELAY + AHT10_DELAY_EXTRA);
-- 
2.29.2
