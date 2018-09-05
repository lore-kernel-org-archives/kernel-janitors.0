From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 05 Sep 2018 07:46:55 +0000
Subject: [PATCH 2/2] hwmon: (nct6775) Clean up a condition
Message-Id: <20180905074655.w6uypipr5lgmpr4g@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <df45855d-e21c-9b29-d661-7284453241fe@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Guenter Roeck <linux@roeck-us.net>
Cc: Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org, kernel-janitors@vger.kernel.org

I removed the "dsw_en &&" chunk of the condition because we know that
"dsw_en" is set.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/hwmon/nct6775.c b/drivers/hwmon/nct6775.c
index 139781ae830b..719effe53ceb 100644
--- a/drivers/hwmon/nct6775.c
+++ b/drivers/hwmon/nct6775.c
@@ -3533,8 +3533,7 @@ nct6775_check_fan_inputs(struct nct6775_data *data)
 
 				if (!fan6pin)
 					fan6pin = (regval_2a & BIT(4)) &&
-					  (!dsw_en ||
-					   (dsw_en && (regval_ed & BIT(4))));
+					  (!dsw_en || (regval_ed & BIT(4)));
 				if (!pwm6pin)
 					pwm6pin = (regval_2a & BIT(3)) &&
 					  (regval_ed & BIT(2));
