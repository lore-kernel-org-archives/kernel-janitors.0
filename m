From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 03 Jan 2016 08:53:33 +0000
Subject: [PATCH 4/8] rtc-ab-b5ze-s3: Replace a variable initialisation by an assignment in _abb5zes3_rtc_set_
Message-Id: <5688E18D.1000007@users.sourceforge.net>
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
Date: Sun, 3 Jan 2016 07:51:49 +0100

Replace an explicit initialisation for one local variable at the beginning
by an assignment.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/rtc/rtc-ab-b5ze-s3.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-ab-b5ze-s3.c b/drivers/rtc/rtc-ab-b5ze-s3.c
index 33a7cf1..0986715 100644
--- a/drivers/rtc/rtc-ab-b5ze-s3.c
+++ b/drivers/rtc/rtc-ab-b5ze-s3.c
@@ -476,7 +476,7 @@ static int abb5zes3_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alarm)
 static int _abb5zes3_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alarm)
 {
 	struct abb5zes3_rtc_data *data = dev_get_drvdata(dev);
-	struct rtc_time *alarm_tm = &alarm->time;
+	struct rtc_time *alarm_tm;
 	unsigned long rtc_secs, alarm_secs;
 	u8 regs[ABB5ZES3_ALRM_SEC_LEN];
 	struct rtc_time rtc_tm;
@@ -490,6 +490,7 @@ static int _abb5zes3_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alarm)
 	if (ret)
 		goto err;
 
+	alarm_tm = &alarm->time;
 	ret = rtc_tm_to_time(alarm_tm, &alarm_secs);
 	if (ret)
 		goto err;
-- 
2.6.3

