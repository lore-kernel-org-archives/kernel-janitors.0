From: Dan Carpenter <error27@gmail.com>
Date: Mon, 28 Feb 2011 19:28:31 +0000
Subject: [patch] Staging: generic_serial: fix double locking bug
Message-Id: <20110228192831.GI18043@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

spin_lock_irqsave() is not nestable.  The second time that it gets
called it overwrites the "flags" variable and so IRQs can't be restored
properly.

Signed-off-by: Dan Carpenter <error27@gmail.com>
---
Oh.  Crap.  I don't want to adopt these drivers.  But I already wrote
the patch before I read the TODO file, so I'm still going to submit it.

diff --git a/drivers/staging/generic_serial/generic_serial.c b/drivers/staging/generic_serial/generic_serial.c
index 5954ee1..466988d 100644
--- a/drivers/staging/generic_serial/generic_serial.c
+++ b/drivers/staging/generic_serial/generic_serial.c
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
