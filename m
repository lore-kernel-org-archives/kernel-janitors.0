From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Thu, 19 Apr 2012 16:12:40 +0000
Subject: [PATCH] drivers/tty/amiserial.c: add missing tty_unlock
Message-Id: <1334851960-29409-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>

tty_unlock is used on all other exits from the function.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/tty/amiserial.c |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/tty/amiserial.c b/drivers/tty/amiserial.c
index 24145c3..6cc4358 100644
--- a/drivers/tty/amiserial.c
+++ b/drivers/tty/amiserial.c
@@ -1073,8 +1073,10 @@ static int set_serial_info(struct tty_struct *tty, struct serial_state *state,
 		    (new_serial.close_delay != port->close_delay) ||
 		    (new_serial.xmit_fifo_size != state->xmit_fifo_size) ||
 		    ((new_serial.flags & ~ASYNC_USR_MASK) !-		     (port->flags & ~ASYNC_USR_MASK)))
+		     (port->flags & ~ASYNC_USR_MASK))) {
+			tty_unlock();
 			return -EPERM;
+		}
 		port->flags = ((port->flags & ~ASYNC_USR_MASK) |
 			       (new_serial.flags & ASYNC_USR_MASK));
 		state->custom_divisor = new_serial.custom_divisor;

