From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Wed, 06 May 2020 01:40:08 +0000
Subject: [PATCH -next] power: supply: bq25890_charger: fix missing unlock on error in bq25890_resume()
Message-Id: <20200506014008.59755-1-weiyongjun1@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sebastian Reichel <sre@kernel.org>, Micha Mirosaw <mirq-linux@rere.qmqm.pl>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, linux-pm@vger.kernel.org, kernel-janitors@vger.kernel.org

Add the missing unlock before return from function bq25890_resume()
in the error handling case.

Fixes: 72d9cd9cdc18 ("power: bq25890: protect view of the chip's state")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/power/supply/bq25890_charger.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/power/supply/bq25890_charger.c b/drivers/power/supply/bq25890_charger.c
index 9339e216651f..cd9c5ed9bc0c 100644
--- a/drivers/power/supply/bq25890_charger.c
+++ b/drivers/power/supply/bq25890_charger.c
@@ -977,14 +977,18 @@ static int bq25890_resume(struct device *dev)
 	mutex_lock(&bq->lock);
 
 	ret = bq25890_get_chip_state(bq, &bq->state);
-	if (ret < 0)
+	if (ret < 0) {
+		mutex_unlock(&bq->lock);
 		return ret;
+	}
 
 	/* Re-enable ADC only if charger is plugged in. */
 	if (bq->state.online) {
 		ret = bq25890_field_write(bq, F_CONV_START, 1);
-		if (ret < 0)
+		if (ret < 0) {
+			mutex_unlock(&bq->lock);
 			return ret;
+		}
 	}
 
 	/* signal userspace, maybe state changed while suspended */
