From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 03 Jan 2016 08:51:38 +0000
Subject: [PATCH 2/8] rtc-ab-b5ze-s3: Delete an unnecessary variable in abb5zes3_rtc_set_alarm()
Message-Id: <5688E11A.90303@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <5688DF2D.6090204@users.sourceforge.net>
In-Reply-To: <5688DF2D.6090204@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: rtc-linux@googlegroups.com, Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@free-electrons.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 3 Jan 2016 07:35:09 +0100

Pass the address of the data structure element "time" directly in a call
of the function "rtc_tm_to_time" instead of an extra initialisation
for one local variable at the beginning.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/rtc/rtc-ab-b5ze-s3.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-ab-b5ze-s3.c b/drivers/rtc/rtc-ab-b5ze-s3.c
index 1291206..ed9b873 100644
--- a/drivers/rtc/rtc-ab-b5ze-s3.c
+++ b/drivers/rtc/rtc-ab-b5ze-s3.c
@@ -596,7 +596,6 @@ err:
 static int abb5zes3_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alarm)
 {
 	struct abb5zes3_rtc_data *data = dev_get_drvdata(dev);
-	struct rtc_time *alarm_tm = &alarm->time;
 	unsigned long rtc_secs, alarm_secs;
 	struct rtc_time rtc_tm;
 	int ret;
@@ -610,7 +609,7 @@ static int abb5zes3_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alarm)
 	if (ret)
 		goto err;
 
-	ret = rtc_tm_to_time(alarm_tm, &alarm_secs);
+	ret = rtc_tm_to_time(&alarm->time, &alarm_secs);
 	if (ret)
 		goto err;
 
-- 
2.6.3

