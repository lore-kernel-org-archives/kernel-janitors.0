From: Colin King <colin.king@canonical.com>
Date: Mon, 26 Nov 2018 16:28:32 +0000
Subject: [PATCH] hwmon: (ltc2978): Fix spelling mistake "comppatible" -> "compatible"
Message-Id: <20181126162832.28060-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Guenter Roeck <linux@roeck-us.net>, Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in the module description text, fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/hwmon/pmbus/ltc2978.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/pmbus/ltc2978.c b/drivers/hwmon/pmbus/ltc2978.c
index 07afb92bb36b..29c0b7219aaa 100644
--- a/drivers/hwmon/pmbus/ltc2978.c
+++ b/drivers/hwmon/pmbus/ltc2978.c
@@ -795,5 +795,5 @@ static struct i2c_driver ltc2978_driver = {
 module_i2c_driver(ltc2978_driver);
 
 MODULE_AUTHOR("Guenter Roeck");
-MODULE_DESCRIPTION("PMBus driver for LTC2978 and comppatible chips");
+MODULE_DESCRIPTION("PMBus driver for LTC2978 and compatible chips");
 MODULE_LICENSE("GPL");
-- 
2.19.1
