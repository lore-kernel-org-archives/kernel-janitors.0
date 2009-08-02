From: Julia Lawall <julia@diku.dk>
Date: Sun, 02 Aug 2009 08:49:35 +0000
Subject: [PATCH 14/15] drivers/char/specialix.c: Use DIV_ROUND_CLOSEST
Message-Id: <Pine.LNX.4.64.0908021049140.15557@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: R.E.Wolff@BitWizard.nl, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

The kernel.h macro DIV_ROUND_CLOSEST performs the computation (x + d/2)/d
but is perhaps more readable.

The semantic patch that makes this change is as follows:
(http://www.emn.fr/x-info/coccinelle/)

// <smpl>
@haskernel@
@@

#include <linux/kernel.h>

@depends on haskernel@
expression x,__divisor;
@@

- (((x) + ((__divisor) / 2)) / (__divisor))
+ DIV_ROUND_CLOSEST(x,__divisor)
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/char/specialix.c            |   13 ++++++-------
 1 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/char/specialix.c b/drivers/char/specialix.c
index 268e17f..1d295fc 100644
--- a/drivers/char/specialix.c
+++ b/drivers/char/specialix.c
@@ -1026,8 +1026,8 @@ static void sx_change_speed(struct specialix_board *bp,
 			"This is an untested option, please be careful.\n",
 							port_No(port), tmp);
 	else
-		tmp = (((SX_OSCFREQ + baud/2) / baud + CD186x_TPC/2) /
-								CD186x_TPC);
+		tmp = DIV_ROUND_CLOSEST(DIV_ROUND_CLOSEST(SX_OSCFREQ, baud),
+					CD186x_TPC);
 
 	if (tmp < 0x10 && time_before(again, jiffies)) {
 		again = jiffies + HZ * 60;
@@ -1050,17 +1050,16 @@ static void sx_change_speed(struct specialix_board *bp,
 	sx_out(bp, CD186x_TBPRL, tmp & 0xff);
 	spin_unlock_irqrestore(&bp->lock, flags);
 	if (port->custom_divisor)
-		baud = (SX_OSCFREQ + port->custom_divisor/2) /
-							port->custom_divisor;
+		baud = DIV_ROUND_CLOSEST(SX_OSCFREQ, port->custom_divisor);
 	baud = (baud + 5) / 10;		/* Estimated CPS */
 
 	/* Two timer ticks seems enough to wakeup something like SLIP driver */
-	tmp = ((baud + HZ/2) / HZ) * 2 - CD186x_NFIFO;
+	tmp = DIV_ROUND_CLOSEST(baud, HZ) * 2 - CD186x_NFIFO;
 	port->wakeup_chars = (tmp < 0) ? 0 : ((tmp >= SERIAL_XMIT_SIZE) ?
 					      SERIAL_XMIT_SIZE - 1 : tmp);
 
 	/* Receiver timeout will be transmission time for 1.5 chars */
-	tmp = (SPECIALIX_TPS + SPECIALIX_TPS/2 + baud/2) / baud;
+	tmp = DIV_ROUND_CLOSEST(SPECIALIX_TPS + SPECIALIX_TPS / 2, baud);
 	tmp = (tmp > 0xff) ? 0xff : tmp;
 	spin_lock_irqsave(&bp->lock, flags);
 	sx_out(bp, CD186x_RTPR, tmp);
@@ -1913,7 +1912,7 @@ static int sx_get_serial_info(struct specialix_port *port,
 	tmp.port = bp->base;
 	tmp.irq  = bp->irq;
 	tmp.flags = port->port.flags;
-	tmp.baud_base = (SX_OSCFREQ + CD186x_TPC/2) / CD186x_TPC;
+	tmp.baud_base = DIV_ROUND_CLOSEST(SX_OSCFREQ, CD186x_TPC);
 	tmp.close_delay = port->port.close_delay * HZ/100;
 	tmp.closing_wait = port->port.closing_wait * HZ/100;
 	tmp.custom_divisor =  port->custom_divisor;
