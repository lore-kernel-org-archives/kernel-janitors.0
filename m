From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Tue, 13 Nov 2018 23:36:45 +0000
Subject: [PATCH] rtc: max77686: Fix the returned value in case of error in 'max77686_rtc_read_time()'
Message-Id: <20181113233645.9118-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cw00.choi@samsung.com, krzk@kernel.org, b.zolnierkie@samsung.com, a.zummo@towertech.it, alexandre.belloni@bootlin.com
Cc: linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

In case of error, we return 0.
This is spurious and not consistent with the other functions of the driver.
Commit e115a2bf1426 has modified more than what is said in the commit
message. Reverse part of it znd return an error when needed, as it was
previously.

Fixes: e115a2bf1426 ("rtc: max77686: stop validating rtc_time in .read_time")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/rtc/rtc-max77686.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-max77686.c b/drivers/rtc/rtc-max77686.c
index 8a60900d6b8b..4aff349ae301 100644
--- a/drivers/rtc/rtc-max77686.c
+++ b/drivers/rtc/rtc-max77686.c
@@ -360,7 +360,7 @@ static int max77686_rtc_read_time(struct device *dev, struct rtc_time *tm)
 
 out:
 	mutex_unlock(&info->lock);
-	return 0;
+	return ret;
 }
 
 static int max77686_rtc_set_time(struct device *dev, struct rtc_time *tm)
-- 
2.17.1
