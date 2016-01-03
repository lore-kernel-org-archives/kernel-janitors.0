From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 03 Jan 2016 08:55:14 +0000
Subject: [PATCH 6/8] rtc-ab-b5ze-s3: Delete an unnecessary variable in _abb5zes3_rtc_read_timer()
Message-Id: <5688E1F2.1080705@users.sourceforge.net>
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
Date: Sun, 3 Jan 2016 08:46:50 +0100

Pass the address of the data structure element "time" directly in a call
of the function "rtc_time_to_tm" instead of an extra initialisation
for one local variable at the beginning.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/rtc/rtc-ab-b5ze-s3.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-ab-b5ze-s3.c b/drivers/rtc/rtc-ab-b5ze-s3.c
index 02e3443..e3a015a 100644
--- a/drivers/rtc/rtc-ab-b5ze-s3.c
+++ b/drivers/rtc/rtc-ab-b5ze-s3.c
@@ -326,7 +326,7 @@ static int _abb5zes3_rtc_read_timer(struct device *dev,
 				    struct rtc_wkalrm *alarm)
 {
 	struct abb5zes3_rtc_data *data = dev_get_drvdata(dev);
-	struct rtc_time rtc_tm, *alarm_tm = &alarm->time;
+	struct rtc_time rtc_tm;
 	u8 regs[ABB5ZES3_TIMA_SEC_LEN + 1];
 	unsigned long rtc_secs;
 	unsigned int reg;
@@ -362,7 +362,7 @@ static int _abb5zes3_rtc_read_timer(struct device *dev,
 		goto err;
 
 	/* ... and convert back. */
-	rtc_time_to_tm(rtc_secs + timer_secs, alarm_tm);
+	rtc_time_to_tm(rtc_secs + timer_secs, &alarm->time);
 
 	ret = regmap_read(data->regmap, ABB5ZES3_REG_CTRL2, &reg);
 	if (ret) {
-- 
2.6.3

