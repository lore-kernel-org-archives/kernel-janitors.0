From: Kulikov Vasiliy <segooon@gmail.com>
Date: Sat, 10 Jul 2010 11:01:44 +0000
Subject: [PATCH 3/3] xtsonic: free irq if sonic_open() fails
Message-Id: <1278759704-7777-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>, =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, Tejun Heo <tj@kernel.org>, Joe Perches <joe@perches.com>, netdev@vger.kernel.org

xtsonic_open() doesn't check sonic_open() return code. If it is error
we must free requested IRQ.

Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>
---
 drivers/net/xtsonic.c |   12 ++++++++++--
 1 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/net/xtsonic.c b/drivers/net/xtsonic.c
index fdba9cb..9f12026 100644
--- a/drivers/net/xtsonic.c
+++ b/drivers/net/xtsonic.c
@@ -93,12 +93,20 @@ static unsigned short known_revisions[]  
 static int xtsonic_open(struct net_device *dev)
 {
-	if (request_irq(dev->irq,sonic_interrupt,IRQF_DISABLED,"sonic",dev)) {
+	int retval;
+
+	retval = request_irq(dev->irq, sonic_interrupt, IRQF_DISABLED,
+				"sonic", dev);
+	if (retval) {
 		printk(KERN_ERR "%s: unable to get IRQ %d.\n",
 		       dev->name, dev->irq);
 		return -EAGAIN;
 	}
-	return sonic_open(dev);
+
+	retval = sonic_open(dev);
+	if (retval)
+		free_irq(dev->irq, dev);
+	return retval;
 }
 
 static int xtsonic_close(struct net_device *dev)
-- 
1.7.0.4

