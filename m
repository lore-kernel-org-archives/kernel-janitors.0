From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 03 May 2017 19:31:40 +0000
Subject: [PATCH] hwmon: (pmbus) Add missing break statements
Message-Id: <20170503193140.zbxcdgda7k3rnr2m@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Guenter Roeck <linux@roeck-us.net>, Samuel Mendoza-Jonas <sam@mendozajonas.com>
Cc: Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org, kernel-janitors@vger.kernel.org

Static checkers complain about these missing break statements.

Fixes: 6eaaea144dc5 ("hwmon: (pmbus) Add client driver for IR35221")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/hwmon/pmbus/ir35221.c b/drivers/hwmon/pmbus/ir35221.c
index cc7b3b542531..00e4a1e264e2 100644
--- a/drivers/hwmon/pmbus/ir35221.c
+++ b/drivers/hwmon/pmbus/ir35221.c
@@ -129,6 +129,7 @@ static int ir35221_read_word_data(struct i2c_client *client, int page, int reg)
 	case PMBUS_IIN_OC_WARN_LIMIT:
 		ret = pmbus_read_word_data(client, page, reg);
 		ret = ir35221_scale_result(ret, -1, PSC_CURRENT_IN);
+		break;
 	case PMBUS_READ_VIN:
 		ret = pmbus_read_word_data(client, page, PMBUS_READ_VIN);
 		ret = ir35221_scale_result(ret, -5, PSC_VOLTAGE_IN);
@@ -222,6 +223,7 @@ static int ir35221_write_word_data(struct i2c_client *client, int page, int reg,
 	case PMBUS_IIN_OC_WARN_LIMIT:
 		val = ir35221_scale_result(word, 1, PSC_CURRENT_IN);
 		ret = pmbus_write_word_data(client, page, reg, val);
+		break;
 	default:
 		ret = -ENODATA;
 		break;
