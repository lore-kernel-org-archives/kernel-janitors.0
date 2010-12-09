From: Tobias Klauser <tklauser@distanz.ch>
Date: Thu, 09 Dec 2010 14:48:46 +0000
Subject: [PATCH] rtc-bfin: Remove redundant unlikely()
Message-Id: <1291906126-475-1-git-send-email-tklauser@distanz.ch>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

IS_ERR() already implies unlikely(), so it can be omitted here.

Signed-off-by: Tobias Klauser <tklauser@distanz.ch>
---
 drivers/rtc/rtc-bfin.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/rtc/rtc-bfin.c b/drivers/rtc/rtc-bfin.c
index b4b6087..4ba3e33 100644
--- a/drivers/rtc/rtc-bfin.c
+++ b/drivers/rtc/rtc-bfin.c
@@ -383,7 +383,7 @@ static int __devinit bfin_rtc_probe(struct platform_device *pdev)
 	/* Register our RTC with the RTC framework */
 	rtc->rtc_dev = rtc_device_register(pdev->name, dev, &bfin_rtc_ops,
 						THIS_MODULE);
-	if (unlikely(IS_ERR(rtc->rtc_dev))) {
+	if (IS_ERR(rtc->rtc_dev)) {
 		ret = PTR_ERR(rtc->rtc_dev);
 		goto err;
 	}
-- 
1.7.0.4

