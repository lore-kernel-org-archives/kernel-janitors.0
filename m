From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 14 Sep 2012 06:50:56 +0000
Subject: [patch] USB: chipidea: fix & vs | bug
Message-Id: <20120914065056.GA11886@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

There is a '&' vs '|' typo in the original code so the condition is
never true and we don't queue the work.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---

diff --git a/drivers/usb/chipidea/udc.c b/drivers/usb/chipidea/udc.c
index 2f45bba..5294f81 100644
--- a/drivers/usb/chipidea/udc.c
+++ b/drivers/usb/chipidea/udc.c
@@ -1680,7 +1680,7 @@ static irqreturn_t udc_irq(struct ci13xxx *ci)
 	intr = hw_read(ci, OP_OTGSC, ~0);
 	hw_write(ci, OP_OTGSC, ~0, intr);
 
-	if (intr & (OTGSC_AVVIE & OTGSC_AVVIS))
+	if (intr & (OTGSC_AVVIE | OTGSC_AVVIS))
 		queue_work(ci->wq, &ci->vbus_work);
 
 	spin_unlock(&ci->lock);
