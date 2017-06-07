From: Colin King <colin.king@canonical.com>
Date: Wed, 07 Jun 2017 15:26:15 +0000
Subject: [PATCH] rtc: rtc-max8925: remove redundant check on ret
Message-Id: <20170607152615.2072-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, linux-rtc@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The check on ret < 0 is redundant as the goto destination is the
next statment.  Remove this redudant check and goto.

Detected by CoverityScan, CID#1268785 ("Identical code for different
branches")

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/rtc/rtc-max8925.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/rtc/rtc-max8925.c b/drivers/rtc/rtc-max8925.c
index 16d129a0bb3b..67d6fc2d23e6 100644
--- a/drivers/rtc/rtc-max8925.c
+++ b/drivers/rtc/rtc-max8925.c
@@ -234,8 +234,6 @@ static int max8925_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alrm)
 		ret = max8925_reg_write(info->rtc, MAX8925_ALARM0_CNTL, 0x77);
 	else
 		ret = max8925_reg_write(info->rtc, MAX8925_ALARM0_CNTL, 0x0);
-	if (ret < 0)
-		goto out;
 out:
 	return ret;
 }
-- 
2.11.0

