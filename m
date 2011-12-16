From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 16 Dec 2011 10:22:42 +0000
Subject: [patch] wimax/i2400m: remove an unused variable
Message-Id: <20111216102242.GC4287@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Inaky Perez-Gonzalez <inaky.perez-gonzalez@intel.com>
Cc: linux-wimax@intel.com, wimax@linuxwimax.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

"result" isn't used.  We ignore errors here because there is not much we
can do about them.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/net/wimax/i2400m/usb-tx.c b/drivers/net/wimax/i2400m/usb-tx.c
index ac357ac..99ef81b 100644
--- a/drivers/net/wimax/i2400m/usb-tx.c
+++ b/drivers/net/wimax/i2400m/usb-tx.c
@@ -177,7 +177,6 @@ retry:
 static
 int i2400mu_txd(void *_i2400mu)
 {
-	int result = 0;
 	struct i2400mu *i2400mu = _i2400mu;
 	struct i2400m *i2400m = &i2400mu->i2400m;
 	struct device *dev = &i2400mu->usb_iface->dev;
@@ -208,16 +207,14 @@ int i2400mu_txd(void *_i2400mu)
 		/* Yeah, we ignore errors ... not much we can do */
 		i2400mu_tx(i2400mu, tx_msg, tx_msg_size);
 		i2400m_tx_msg_sent(i2400m);	/* ack it, advance the FIFO */
-		if (result < 0)
-			break;
 	}
 
 	spin_lock_irqsave(&i2400m->tx_lock, flags);
 	i2400mu->tx_kthread = NULL;
 	spin_unlock_irqrestore(&i2400m->tx_lock, flags);
 
-	d_fnend(4, dev, "(i2400mu %p) = %d\n", i2400mu, result);
-	return result;
+	d_fnend(4, dev, "(i2400mu %p)\n", i2400mu);
+	return 0;
 }
 
 
