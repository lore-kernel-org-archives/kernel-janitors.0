From: Julia Lawall <julia@diku.dk>
Date: Tue, 19 Oct 2010 09:43:54 +0000
Subject: [PATCH 2/4] drivers/char/generic_serial.c: convert nested spin_lock_irqsave to spin_lock
Message-Id: <1287481436-26656-2-git-send-email-julia@diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

If spin_lock_irqsave is called twice in a row with the same second
argument, the interrupt state at the point of the second call overwrites
the value saved by the first call.  Indeed, the second call does not need
to save the interrupt state, so it is changed to a simple spin_lock.

The semantic match that finds this problem is as follows:
(http://coccinelle.lip6.fr/)

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
 drivers/char/generic_serial.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/char/generic_serial.c b/drivers/char/generic_serial.c
index 5954ee1..466988d 100644
--- a/drivers/char/generic_serial.c
+++ b/drivers/char/generic_serial.c
@@ -566,9 +566,9 @@ void gs_close(struct tty_struct * tty, struct file * filp)
 	 * line status register.
 	 */
 
-	spin_lock_irqsave(&port->driver_lock, flags);
+	spin_lock(&port->driver_lock);
 	port->rd->disable_rx_interrupts (port);
-	spin_unlock_irqrestore(&port->driver_lock, flags);
+	spin_unlock(&port->driver_lock);
 	spin_unlock_irqrestore(&port->port.lock, flags);
 
 	/* close has no way of returning "EINTR", so discard return value */

