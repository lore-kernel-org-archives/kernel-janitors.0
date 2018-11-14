From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Wed, 14 Nov 2018 17:19:51 +0000
Subject: [PATCH v2] rtc: max8997: Fix the returned value in case of error in 'max8997_rtc_read_alarm()'
Message-Id: <20181114171951.4137-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: a.zummo@towertech.it, alexandre.belloni@bootlin.com
Cc: linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

In case of error, we return 0.
This is spurious and not consistent with the other functions of the driver.
Propagate the error code instead.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
v2: re-word changelog and remove Fixes tag.
   (not sure if any should be provided, and which one would be the best)
---
 drivers/rtc/rtc-max8997.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-max8997.c b/drivers/rtc/rtc-max8997.c
index 08c661a332ec..20e50d9fdf88 100644
--- a/drivers/rtc/rtc-max8997.c
+++ b/drivers/rtc/rtc-max8997.c
@@ -215,7 +215,7 @@ static int max8997_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alrm)
 
 out:
 	mutex_unlock(&info->lock);
-	return 0;
+	return ret;
 }
 
 static int max8997_rtc_stop_alarm(struct max8997_rtc_info *info)
-- 
2.17.1
