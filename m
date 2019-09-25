From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 25 Sep 2019 11:01:28 +0000
Subject: [PATCH] power: supply: sbs-battery: Fix a signedness bug in sbs_get_battery_capacity()
Message-Id: <20190925110128.GM3264@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sebastian Reichel <sre@kernel.org>, Rhyland Klein <rklein@nvidia.com>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

The "mode" variable is an enum and in this context GCC treats it as an
unsigned int so the error handling is never triggered.

Fixes: 51d075660457 ("bq20z75: Add support for charge properties")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/power/supply/sbs-battery.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/power/supply/sbs-battery.c b/drivers/power/supply/sbs-battery.c
index f8d74e9f7931..62110af1abcf 100644
--- a/drivers/power/supply/sbs-battery.c
+++ b/drivers/power/supply/sbs-battery.c
@@ -555,7 +555,7 @@ static int sbs_get_battery_capacity(struct i2c_client *client,
 		mode = BATTERY_MODE_AMPS;
 
 	mode = sbs_set_battery_mode(client, mode);
-	if (mode < 0)
+	if ((int)mode < 0)
 		return mode;
 
 	ret = sbs_read_word_data(client, sbs_data[reg_offset].addr);
-- 
2.20.1
