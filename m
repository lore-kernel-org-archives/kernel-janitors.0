From: Vasiliy Kulikov <segooon@gmail.com>
Date: Sun, 19 Sep 2010 12:55:04 +0000
Subject: [PATCH 09/14] rtc: fix device_register() error handling
Message-Id: <1284900904-24579-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: Alessandro Zummo <a.zummo@towertech.it>, Andrew Morton <akpm@linux-foundation.org>, Tejun Heo <tj@kernel.org>, Aaro Koskinen <aaro.koskinen@nokia.com>, rtc-linux@googlegroups.com, linux-kernel@vger.kernel.org

If device_register() fails then call put_device().
See comment to device_register.

Signed-off-by: Vasiliy Kulikov <segooon@gmail.com>
---
 compile tested.

 drivers/rtc/class.c |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/drivers/rtc/class.c b/drivers/rtc/class.c
index 565562b..e6539cb 100644
--- a/drivers/rtc/class.c
+++ b/drivers/rtc/class.c
@@ -158,8 +158,10 @@ struct rtc_device *rtc_device_register(const char *name, struct device *dev,
 	rtc_dev_prepare(rtc);
 
 	err = device_register(&rtc->dev);
-	if (err)
+	if (err) {
+		put_device(&rtc->dev);
 		goto exit_kfree;
+	}
 
 	rtc_dev_add_device(rtc);
 	rtc_sysfs_add_device(rtc);
-- 
1.7.0.4

