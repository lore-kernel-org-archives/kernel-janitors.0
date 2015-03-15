From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sun, 15 Mar 2015 10:48:37 +0000
Subject: [patch] rtc: at91rm9200: double locking bug in at91_rtc_interrupt()
Message-Id: <20150315104837.GC20691@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

There is a typo here so we deadlock.

Fixes: dd1f1f391dd7 ('rtc: at91rm9200: rework wakeup and interrupt handling')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/rtc/rtc-at91rm9200.c b/drivers/rtc/rtc-at91rm9200.c
index b4f7744..b283a1a 100644
--- a/drivers/rtc/rtc-at91rm9200.c
+++ b/drivers/rtc/rtc-at91rm9200.c
@@ -324,7 +324,7 @@ static irqreturn_t at91_rtc_interrupt(int irq, void *dev_id)
 
 		ret = IRQ_HANDLED;
 	}
-	spin_lock(&suspended_lock);
+	spin_unlock(&suspended_lock);
 
 	return ret;
 }
