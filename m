From: Hannes Eder <hannes@hanneseder.net>
Date: Fri, 28 Nov 2008 16:11:47 +0000
Subject: [PATCH] rtc-stk17ta8: fix sparse warning
Message-Id: <49304ffd.09a1660a.30b3.ffffc7a7@mx.google.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alessandro Zummo <a.zummo@towertech.it>
Cc: rtc-linux@googlegroups.com

Fix this sparse warning:

  drivers/rtc/rtc-stk17ta8.c:403:2: warning: returning void-valued expression

Signed-off-by: Hannes Eder <hannes@hanneseder.net>
---
 drivers/rtc/rtc-stk17ta8.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/rtc/rtc-stk17ta8.c b/drivers/rtc/rtc-stk17ta8.c
index f4cd46e..549990f 100644
--- a/drivers/rtc/rtc-stk17ta8.c
+++ b/drivers/rtc/rtc-stk17ta8.c
@@ -400,7 +400,7 @@ static __init int stk17ta8_init(void)
 
 static __exit void stk17ta8_exit(void)
 {
-	return platform_driver_unregister(&stk17ta8_rtc_driver);
+	platform_driver_unregister(&stk17ta8_rtc_driver);
 }
 
 module_init(stk17ta8_init);
-- 
1.5.6.3

