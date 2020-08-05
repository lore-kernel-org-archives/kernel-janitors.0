From: Colin King <colin.king@canonical.com>
Date: Wed, 05 Aug 2020 10:38:57 +0000
Subject: [PATCH] power: pm2301_charger: fix spelling mistake "chargind" -> "charging"
Message-Id: <20200805103857.15725-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sebastian Reichel <sre@kernel.org>, linux-pm@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in a dev_dbg message. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/power/supply/pm2301_charger.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/power/supply/pm2301_charger.c b/drivers/power/supply/pm2301_charger.c
index 17749fc90e16..787867805944 100644
--- a/drivers/power/supply/pm2301_charger.c
+++ b/drivers/power/supply/pm2301_charger.c
@@ -396,7 +396,7 @@ static int pm2_int_reg3(void *pm2_data, int val)
 
 	if (val & (PM2XXX_INT4_ITCHARGINGON)) {
 		dev_dbg(pm2->dev ,
-			"chargind operation has started\n");
+			"charging operation has started\n");
 	}
 
 	if (val & (PM2XXX_INT4_ITVRESUME)) {
-- 
2.27.0
