From: Kulikov Vasiliy <segooon@gmail.com>
Date: Sat, 10 Jul 2010 11:01:00 +0000
Subject: [PATCH 2/3] macsonic: free irq if sonic_open() fails
Message-Id: <1278759661-7731-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>, Finn Thain <fthain@telegraphics.com.au>, =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, Tejun Heo <tj@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, netdev@vger.kernel.org

macsonic_open() doesn't check sonic_open() return code. If it is error
we must free requested IRQ.

Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>
---
 drivers/net/macsonic.c |   36 +++++++++++++++++++++++++++---------
 1 files changed, 27 insertions(+), 9 deletions(-)

diff --git a/drivers/net/macsonic.c b/drivers/net/macsonic.c
index adb54fe..3730762 100644
--- a/drivers/net/macsonic.c
+++ b/drivers/net/macsonic.c
@@ -140,21 +140,39 @@ static irqreturn_t macsonic_interrupt(int irq, void *dev_id)
 
 static int macsonic_open(struct net_device* dev)
 {
-	if (request_irq(dev->irq, sonic_interrupt, IRQ_FLG_FAST, "sonic", dev)) {
-		printk(KERN_ERR "%s: unable to get IRQ %d.\n", dev->name, dev->irq);
-		return -EAGAIN;
+	int retval;
+
+	retval = request_irq(dev->irq, sonic_interrupt, IRQ_FLG_FAST,
+				"sonic", dev);
+	if (retval) {
+		printk(KERN_ERR "%s: unable to get IRQ %d.\n",
+				dev->name, dev->irq);
+		goto err;
 	}
 	/* Under the A/UX interrupt scheme, the onboard SONIC interrupt comes
 	 * in at priority level 3. However, we sometimes get the level 2 inter-
 	 * rupt as well, which must prevent re-entrance of the sonic handler.
 	 */
-	if (dev->irq = IRQ_AUTO_3)
-		if (request_irq(IRQ_NUBUS_9, macsonic_interrupt, IRQ_FLG_FAST, "sonic", dev)) {
-			printk(KERN_ERR "%s: unable to get IRQ %d.\n", dev->name, IRQ_NUBUS_9);
-			free_irq(dev->irq, dev);
-			return -EAGAIN;
+	if (dev->irq = IRQ_AUTO_3) {
+		retval = request_irq(IRQ_NUBUS_9, macsonic_interrupt,
+					IRQ_FLG_FAST, "sonic", dev);
+		if (retval) {
+			printk(KERN_ERR "%s: unable to get IRQ %d.\n",
+					dev->name, IRQ_NUBUS_9);
+			goto err_irq;
 		}
-	return sonic_open(dev);
+	}
+	retval = sonic_open(dev);
+	if (retval)
+		goto err_irq_nubus;
+	return 0;
+
+err_irq_nubus:
+	free_irq(IRQ_NUBUS_9, dev);
+err_irq:
+	free_irq(dev->irq, dev);
+err:
+	return retval;
 }
 
 static int macsonic_close(struct net_device* dev)
-- 
1.7.0.4

