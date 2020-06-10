From: Colin King <colin.king@canonical.com>
Date: Wed, 10 Jun 2020 12:36:38 +0000
Subject: [PATCH] hwmon: i5k_amb: remove redundant assignment to variable res
Message-Id: <20200610123638.1133428-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable res is being initialized with a value that is
never read and it is being updated later with a new value. The
initialization is redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/hwmon/i5k_amb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/i5k_amb.c b/drivers/hwmon/i5k_amb.c
index eeac4b04df27..cd5b62905eee 100644
--- a/drivers/hwmon/i5k_amb.c
+++ b/drivers/hwmon/i5k_amb.c
@@ -396,7 +396,7 @@ static int i5k_amb_hwmon_init(struct platform_device *pdev)
 
 static int i5k_amb_add(void)
 {
-	int res = -ENODEV;
+	int res;
 
 	/* only ever going to be one of these */
 	amb_pdev = platform_device_alloc(DRVNAME, 0);
-- 
2.27.0.rc0
