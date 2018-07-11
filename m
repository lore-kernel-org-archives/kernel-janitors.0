From: Colin King <colin.king@canonical.com>
Date: Wed, 11 Jul 2018 08:33:12 +0000
Subject: [PATCH] rtc: m48t59: remove redundant pointer 'name'
Message-Id: <20180711083312.5483-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-rtc@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Pointer 'name' is being assigned but is never used hence it is redundant
and can be removed.

Cleans up clang warning:
warning: variable 'name' set but not used [-Wunused-but-set-variable]

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/rtc/rtc-m48t59.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/rtc/rtc-m48t59.c b/drivers/rtc/rtc-m48t59.c
index 1053a406b3aa..ac9ca1042889 100644
--- a/drivers/rtc/rtc-m48t59.c
+++ b/drivers/rtc/rtc-m48t59.c
@@ -373,7 +373,6 @@ static int m48t59_rtc_probe(struct platform_device *pdev)
 	struct m48t59_private *m48t59 = NULL;
 	struct resource *res;
 	int ret = -ENOMEM;
-	char *name;
 	const struct rtc_class_ops *ops;
 	struct nvmem_config nvmem_cfg = {
 		.name = "m48t59-",
@@ -448,17 +447,14 @@ static int m48t59_rtc_probe(struct platform_device *pdev)
 	}
 	switch (pdata->type) {
 	case M48T59RTC_TYPE_M48T59:
-		name = "m48t59";
 		ops = &m48t59_rtc_ops;
 		pdata->offset = 0x1ff0;
 		break;
 	case M48T59RTC_TYPE_M48T02:
-		name = "m48t02";
 		ops = &m48t02_rtc_ops;
 		pdata->offset = 0x7f0;
 		break;
 	case M48T59RTC_TYPE_M48T08:
-		name = "m48t08";
 		ops = &m48t02_rtc_ops;
 		pdata->offset = 0x1ff0;
 		break;
-- 
2.17.1

