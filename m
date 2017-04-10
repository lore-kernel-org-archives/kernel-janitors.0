From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 10 Apr 2017 13:47:03 +0000
Subject: [PATCH 2/2] hwmon: (tacho) Remove an unused variable
Message-Id: <20170410134703.GB1918@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joel Stanley <joel@jms.id.au>, Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
Cc: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org, kernel-janitors@vger.kernel.org

We never use this global variable.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/hwmon/aspeed-pwm-tacho.c b/drivers/hwmon/aspeed-pwm-tacho.c
index 2f22add5c73b..b96fff50a3ee 100644
--- a/drivers/hwmon/aspeed-pwm-tacho.c
+++ b/drivers/hwmon/aspeed-pwm-tacho.c
@@ -153,8 +153,6 @@
 #define M_TACH_UNIT 0x1000
 #define INIT_FAN_CTRL 0xFF
 
-void __iomem *regs;
-
 struct aspeed_pwm_tacho_data {
 	struct regmap *regmap;
 	unsigned long clk_freq;
