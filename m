From: Julia Lawall <julia@diku.dk>
Date: Sat, 18 Jul 2009 15:23:35 +0000
Subject: [PATCH 2/6] drivers/char/specialix.c: convert nested spin_lock_irqsave
Message-Id: <Pine.LNX.4.64.0907181723110.26792@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: R.E.Wolff@BitWizard.nl, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

If spin_lock_irqsave is called twice in a row with the same second
argument, the interrupt state at the point of the second call overwrites
the value saved by the first call.  Indeed, the second call does not need
to save the interrupt state, so it is changed to a simple spin_lock.

The semantic match that finds this problem is as follows:
(http://www.emn.fr/x-info/coccinelle/)

// <smpl>
@@
expression lock1,lock2;
expression flags;
@@

*spin_lock_irqsave(lock1,flags)
... when != flags
*spin_lock_irqsave(lock2,flags)
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/char/specialix.c            |   24 ++++++++++----------
 1 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/char/specialix.c b/drivers/char/specialix.c
index e72be41..758c9ac 100644
--- a/drivers/char/specialix.c
+++ b/drivers/char/specialix.c
@@ -1808,10 +1808,10 @@ static int sx_tiocmset(struct tty_struct *tty, struct file *file,
 		if (clear & TIOCM_DTR)
 			port->MSVR &= ~MSVR_DTR;
 	}
-	spin_lock_irqsave(&bp->lock, flags);
+	spin_lock(&bp->lock);
 	sx_out(bp, CD186x_CAR, port_No(port));
 	sx_out(bp, CD186x_MSVR, port->MSVR);
-	spin_unlock_irqrestore(&bp->lock, flags);
+	spin_unlock(&bp->lock);
 	spin_unlock_irqrestore(&port->lock, flags);
 	func_exit();
 	return 0;
@@ -1832,11 +1832,11 @@ static int sx_send_break(struct tty_struct *tty, int length)
 	port->break_length = SPECIALIX_TPS / HZ * length;
 	port->COR2 |= COR2_ETC;
 	port->IER  |= IER_TXRDY;
-	spin_lock_irqsave(&bp->lock, flags);
+	spin_lock(&bp->lock);
 	sx_out(bp, CD186x_CAR, port_No(port));
 	sx_out(bp, CD186x_COR2, port->COR2);
 	sx_out(bp, CD186x_IER, port->IER);
-	spin_unlock_irqrestore(&bp->lock, flags);
+	spin_unlock(&bp->lock);
 	spin_unlock_irqrestore(&port->lock, flags);
 	sx_wait_CCR(bp);
 	spin_lock_irqsave(&bp->lock, flags);
@@ -2022,9 +2022,9 @@ static void sx_unthrottle(struct tty_struct *tty)
 	if (sx_crtscts(tty))
 		port->MSVR |= MSVR_DTR;
 	/* Else clause: see remark in "sx_throttle"... */
-	spin_lock_irqsave(&bp->lock, flags);
+	spin_lock(&bp->lock);
 	sx_out(bp, CD186x_CAR, port_No(port));
-	spin_unlock_irqrestore(&bp->lock, flags);
+	spin_unlock(&bp->lock);
 	if (I_IXOFF(tty)) {
 		spin_unlock_irqrestore(&port->lock, flags);
 		sx_wait_CCR(bp);
@@ -2034,9 +2034,9 @@ static void sx_unthrottle(struct tty_struct *tty)
 		sx_wait_CCR(bp);
 		spin_lock_irqsave(&port->lock, flags);
 	}
-	spin_lock_irqsave(&bp->lock, flags);
+	spin_lock(&bp->lock);
 	sx_out(bp, CD186x_MSVR, port->MSVR);
-	spin_unlock_irqrestore(&bp->lock, flags);
+	spin_unlock(&bp->lock);
 	spin_unlock_irqrestore(&port->lock, flags);
 
 	func_exit();
@@ -2060,10 +2060,10 @@ static void sx_stop(struct tty_struct *tty)
 
 	spin_lock_irqsave(&port->lock, flags);
 	port->IER &= ~IER_TXRDY;
-	spin_lock_irqsave(&bp->lock, flags);
+	spin_lock(&bp->lock);
 	sx_out(bp, CD186x_CAR, port_No(port));
 	sx_out(bp, CD186x_IER, port->IER);
-	spin_unlock_irqrestore(&bp->lock, flags);
+	spin_unlock(&bp->lock);
 	spin_unlock_irqrestore(&port->lock, flags);
 
 	func_exit();
@@ -2088,10 +2088,10 @@ static void sx_start(struct tty_struct *tty)
 	spin_lock_irqsave(&port->lock, flags);
 	if (port->xmit_cnt && port->xmit_buf && !(port->IER & IER_TXRDY)) {
 		port->IER |= IER_TXRDY;
-		spin_lock_irqsave(&bp->lock, flags);
+		spin_lock(&bp->lock);
 		sx_out(bp, CD186x_CAR, port_No(port));
 		sx_out(bp, CD186x_IER, port->IER);
-		spin_unlock_irqrestore(&bp->lock, flags);
+		spin_unlock(&bp->lock);
 	}
 	spin_unlock_irqrestore(&port->lock, flags);
 
