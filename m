From: Julia Lawall <julia@diku.dk>
Date: Sat, 18 Jul 2009 15:23:10 +0000
Subject: [PATCH 1/6] drivers/char: convert nested spin_lock_irqsave to
Message-Id: <Pine.LNX.4.64.0907181722430.26792@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

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
 drivers/char/generic_serial.c       |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/char/generic_serial.c b/drivers/char/generic_serial.c
index 9e4e569..ca07fc4 100644
--- a/drivers/char/generic_serial.c
+++ b/drivers/char/generic_serial.c
@@ -564,9 +564,9 @@ void gs_close(struct tty_struct * tty, struct file * filp)
 	 * line status register.
 	 */
 
-	spin_lock_irqsave(&port->driver_lock, flags);
+	spin_lock(&port->driver_lock);
 	port->rd->disable_rx_interrupts (port);
-	spin_unlock_irqrestore(&port->driver_lock, flags);
+	spin_unlock(&port->driver_lock);
 	spin_unlock_irqrestore(&port->port.lock, flags);
 
 	/* close has no way of returning "EINTR", so discard return value */
