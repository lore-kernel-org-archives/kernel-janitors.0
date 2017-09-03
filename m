From: Colin King <colin.king@canonical.com>
Date: Sun, 03 Sep 2017 13:16:19 +0000
Subject: [PATCH][thermal-next] thermal: brcmstb: remove two redundant integer range checks
Message-Id: <20170903131619.6857-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

From: Colin Ian King <colin.king@canonical.com>

The comparisons for integer low on low > INT_MAX and also
integer high > INT_MAX are never going to be true since an
int type cannot be greater than INT_MAX.  Remove these redundant
checks.

Detected by: CoverityScan CID#1455245, 1455248 ("Operands don't affect
  result (CONSTANT_EXPRESSION_RESULT)")

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/thermal/broadcom/brcmstb_thermal.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/thermal/broadcom/brcmstb_thermal.c b/drivers/thermal/broadcom/brcmstb_thermal.c
index 87b8e7a86ee3..bcb3945feea6 100644
--- a/drivers/thermal/broadcom/brcmstb_thermal.c
+++ b/drivers/thermal/broadcom/brcmstb_thermal.c
@@ -278,8 +278,6 @@ static int brcmstb_set_trips(void *data, int low, int high)
 	dev_dbg(priv->dev, "set trips %d <--> %d\n", low, high);
 
 	if (low) {
-		if (low > INT_MAX)
-			low = INT_MAX;
 		avs_tmon_set_trip_temp(priv, TMON_TRIP_TYPE_LOW, low);
 		avs_tmon_trip_enable(priv, TMON_TRIP_TYPE_LOW, 1);
 	} else {
@@ -287,8 +285,6 @@ static int brcmstb_set_trips(void *data, int low, int high)
 	}
 
 	if (high < ULONG_MAX) {
-		if (high > INT_MAX)
-			high = INT_MAX;
 		avs_tmon_set_trip_temp(priv, TMON_TRIP_TYPE_HIGH, high);
 		avs_tmon_trip_enable(priv, TMON_TRIP_TYPE_HIGH, 1);
 	} else {
-- 
2.14.1

