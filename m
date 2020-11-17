From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 17 Nov 2020 07:24:01 +0000
Subject: [PATCH] hwmon: (applesmc) Fix smc_sane() function
Message-Id: <20201117072401.GE1111239@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Henrik Rydberg <rydberg@bitmath.org>
Cc: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, Brad Campbell <brad@fnarfbargle.com>, linux-hwmon@vger.kernel.org, kernel-janitors@vger.kernel.org

This test is reversed so the function will return without sending
the APPLESMC_READ_CMD or completing the rest of the function.

Fixes: 4d64bb4ba5ec ("hwmon: (applesmc) Re-work SMC comms")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/hwmon/applesmc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/applesmc.c b/drivers/hwmon/applesmc.c
index 79b498f816fe..289b39537683 100644
--- a/drivers/hwmon/applesmc.c
+++ b/drivers/hwmon/applesmc.c
@@ -227,7 +227,7 @@ static int smc_sane(void)
 	int ret;
 
 	ret = wait_status(0, SMC_STATUS_BUSY);
-	if (!ret)
+	if (ret)
 		return ret;
 	ret = send_command(APPLESMC_READ_CMD);
 	if (ret)
-- 
2.29.2
