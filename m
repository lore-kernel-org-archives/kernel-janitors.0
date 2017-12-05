From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 05 Dec 2017 14:37:26 +0000
Subject: [PATCH] hwmon: (w83773g) Fix a precedence bug in get_fault()
Message-Id: <20171205143726.d3tziwhjboyfxmgi@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jean Delvare <jdelvare@suse.com>, Lei YU <mine260309@gmail.com>
Cc: Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org, kernel-janitors@vger.kernel.org

Shift has higher precedence than mask but presumably we wanted to set
*val to 1 if BIT(2) was set or 0 if the bit was clear.

Fixes: de0a524e3e09 ("hwmon: Add W83773G driver")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/hwmon/w83773g.c b/drivers/hwmon/w83773g.c
index 0b97c285b049..e858093ac806 100644
--- a/drivers/hwmon/w83773g.c
+++ b/drivers/hwmon/w83773g.c
@@ -102,7 +102,7 @@ static int get_fault(struct regmap *regmap, int index, long *val)
 	if (ret < 0)
 		return ret;
 
-	*val = (u8)regval & 0x04 >> 2;
+	*val = (regval & 0x04) >> 2;
 	return 0;
 }
 
