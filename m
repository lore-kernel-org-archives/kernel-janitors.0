From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 06 May 2020 10:11:16 +0000
Subject: [PATCH] power: bq25890: unlock on error paths in bq25890_resume()
Message-Id: <20200506101116.GA77004@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sebastian Reichel <sre@kernel.org>, =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Cc: linux-pm@vger.kernel.org, kernel-janitors@vger.kernel.org

We introduced some new locking here, but need to update the error
paths so they unlock before returning.

Fixes: 72d9cd9cdc18 ("power: bq25890: protect view of the chip's state")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/power/supply/bq25890_charger.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/power/supply/bq25890_charger.c b/drivers/power/supply/bq25890_charger.c
index 9339e216651ff..20b9824ef5acd 100644
--- a/drivers/power/supply/bq25890_charger.c
+++ b/drivers/power/supply/bq25890_charger.c
@@ -978,21 +978,22 @@ static int bq25890_resume(struct device *dev)
 
 	ret = bq25890_get_chip_state(bq, &bq->state);
 	if (ret < 0)
-		return ret;
+		goto unlock;
 
 	/* Re-enable ADC only if charger is plugged in. */
 	if (bq->state.online) {
 		ret = bq25890_field_write(bq, F_CONV_START, 1);
 		if (ret < 0)
-			return ret;
+			goto unlock;
 	}
 
 	/* signal userspace, maybe state changed while suspended */
 	power_supply_changed(bq->charger);
 
+unlock:
 	mutex_unlock(&bq->lock);
 
-	return 0;
+	return ret;
 }
 #endif
 
-- 
2.26.2
