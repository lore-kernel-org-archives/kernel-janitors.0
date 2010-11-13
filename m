From: Dan Carpenter <error27@gmail.com>
Date: Sat, 13 Nov 2010 18:26:26 +0000
Subject: [patch] rtc: jz4740: signedness bug
Message-Id: <20101113182626.GC1795@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

platform_get_irq() can return negatives so the rtc->irq should be signed
to handle it.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/rtc/rtc-jz4740.c b/drivers/rtc/rtc-jz4740.c
index 2e16f72..cfcd2da 100644
--- a/drivers/rtc/rtc-jz4740.c
+++ b/drivers/rtc/rtc-jz4740.c
@@ -42,7 +42,7 @@ struct jz4740_rtc {
 
 	struct rtc_device *rtc;
 
-	unsigned int irq;
+	int irq;
 
 	spinlock_t lock;
 };
