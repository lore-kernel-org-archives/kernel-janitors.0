From: Hannes Eder <hannes@hanneseder.net>
Date: Fri, 28 Nov 2008 16:01:35 +0000
Subject: [PATCH] rtc-ds1511: fix sparse warning
Message-Id: <493049fa.06a1660a.3655.ffffab3c@mx.google.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alessandro Zummo <a.zummo@towertech.it>
Cc: rtc-linux@googlegroups.com

Fix this sparse warning:

  drivers/rtc/rtc-ds1511.c:634:2: warning: returning void-valued expression

Signed-off-by: Hannes Eder <hannes@hanneseder.net>
---
 drivers/rtc/rtc-ds1511.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/rtc/rtc-ds1511.c b/drivers/rtc/rtc-ds1511.c
index 25caada..062a1d1 100644
--- a/drivers/rtc/rtc-ds1511.c
+++ b/drivers/rtc/rtc-ds1511.c
@@ -631,7 +631,7 @@ ds1511_rtc_init(void)
  static void __exit
 ds1511_rtc_exit(void)
 {
-	return platform_driver_unregister(&ds1511_rtc_driver);
+	platform_driver_unregister(&ds1511_rtc_driver);
 }
 
 module_init(ds1511_rtc_init);
-- 
1.5.6.3

