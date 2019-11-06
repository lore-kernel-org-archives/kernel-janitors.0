From: Colin King <colin.king@canonical.com>
Date: Wed, 06 Nov 2019 08:34:18 +0000
Subject: [PATCH][next] rtc: bd70528: fix module alias to autoload module
Message-Id: <20191106083418.159045-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alessandro Zummo <a.zummo@towertech.it>, lexandre Belloni <alexandre.belloni@bootlin.com>, Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>, linux-rtc@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The module alias platform tag contains a spelling mistake. Fix it.

Fixes: f33506abbcdd ("rtc: bd70528: Add MODULE ALIAS to autoload module")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/rtc/rtc-bd70528.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-bd70528.c b/drivers/rtc/rtc-bd70528.c
index ddfef4d43bab..627037aa66a8 100644
--- a/drivers/rtc/rtc-bd70528.c
+++ b/drivers/rtc/rtc-bd70528.c
@@ -491,4 +491,4 @@ module_platform_driver(bd70528_rtc);
 MODULE_AUTHOR("Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>");
 MODULE_DESCRIPTION("BD70528 RTC driver");
 MODULE_LICENSE("GPL");
-MODULE_ALIAS("platofrm:bd70528-rtc");
+MODULE_ALIAS("platform:bd70528-rtc");
-- 
2.20.1
