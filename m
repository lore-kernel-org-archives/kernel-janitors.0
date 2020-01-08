From: YueHaibing <yuehaibing@huawei.com>
Date: Wed, 08 Jan 2020 03:45:14 +0000
Subject: [PATCH -next] hwmon: (w83627ehf) Remove set but not used variable 'fan4min'
Message-Id: <20200108034514.50130-1-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jean Delvare <jdelvare@suse.com>, "Dr . David Alan Gilbert" <linux@treblig.org>, Guenter Roeck <linux@roeck-us.net>
Cc: YueHaibing <yuehaibing@huawei.com>, linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Hulk Robot <hulkci@huawei.com>

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/hwmon/w83627ehf.c: In function 'w83627ehf_check_fan_inputs':
drivers/hwmon/w83627ehf.c:1296:24: warning:
 variable 'fan4min' set but not used [-Wunused-but-set-variable]

commit 62000264cfa8 ("hwmon: (w83627ehf) remove nct6775 and nct6776 support")
left behind this unused variable.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/hwmon/w83627ehf.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/hwmon/w83627ehf.c b/drivers/hwmon/w83627ehf.c
index 5a7239eb1c15..7ffadc2da57b 100644
--- a/drivers/hwmon/w83627ehf.c
+++ b/drivers/hwmon/w83627ehf.c
@@ -1293,7 +1293,7 @@ static void
 w83627ehf_check_fan_inputs(const struct w83627ehf_sio_data *sio_data,
 			   struct w83627ehf_data *data)
 {
-	int fan3pin, fan4pin, fan4min, fan5pin, regval;
+	int fan3pin, fan4pin, fan5pin, regval;
 
 	/* The W83627UHG is simple, only two fan inputs, no config */
 	if (sio_data->kind = w83627uhg) {
@@ -1307,12 +1307,10 @@ w83627ehf_check_fan_inputs(const struct w83627ehf_sio_data *sio_data,
 		fan3pin = 1;
 		fan4pin = superio_inb(sio_data->sioreg, 0x27) & 0x40;
 		fan5pin = superio_inb(sio_data->sioreg, 0x27) & 0x20;
-		fan4min = fan4pin;
 	} else {
 		fan3pin = 1;
 		fan4pin = !(superio_inb(sio_data->sioreg, 0x29) & 0x06);
 		fan5pin = !(superio_inb(sio_data->sioreg, 0x24) & 0x02);
-		fan4min = fan4pin;
 	}
 
 	data->has_fan = data->has_fan_min = 0x03; /* fan1 and fan2 */
