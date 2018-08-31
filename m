From: YueHaibing <yuehaibing@huawei.com>
Date: Fri, 31 Aug 2018 02:15:39 +0000
Subject: [PATCH -next] rtc: mrst: remove set but not used variable 'valid'
Message-Id: <1535681739-156599-1-git-send-email-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: YueHaibing <yuehaibing@huawei.com>, linux-rtc@vger.kernel.org, kernel-janitors@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/rtc/rtc-mrst.c: In function 'mrst_procfs':
drivers/rtc/rtc-mrst.c:264:29: warning:
 variable 'valid' set but not used [-Wunused-but-set-variable]
  unsigned char rtc_control, valid;

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/rtc/rtc-mrst.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-mrst.c b/drivers/rtc/rtc-mrst.c
index bf2d7af..daf354a 100644
--- a/drivers/rtc/rtc-mrst.c
+++ b/drivers/rtc/rtc-mrst.c
@@ -261,11 +261,10 @@ static int mrst_rtc_alarm_irq_enable(struct device *dev, unsigned int enabled)
 
 static int mrst_procfs(struct device *dev, struct seq_file *seq)
 {
-	unsigned char	rtc_control, valid;
+	unsigned char	rtc_control;
 
 	spin_lock_irq(&rtc_lock);
 	rtc_control = vrtc_cmos_read(RTC_CONTROL);
-	valid = vrtc_cmos_read(RTC_VALID);
 	spin_unlock_irq(&rtc_lock);
 
 	seq_printf(seq,
