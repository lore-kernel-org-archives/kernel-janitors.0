From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 29 Nov 2014 12:49:54 +0000
Subject: [patch] USB: mos7720: delete some unneeded code
Message-Id: <20141129124954.GC27251@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

The "status" is uninitialized so this creates a static checker warning.
But it's harmless, we can just delete it.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/usb/serial/mos7720.c b/drivers/usb/serial/mos7720.c
index 312b0fe..4f70df3 100644
--- a/drivers/usb/serial/mos7720.c
+++ b/drivers/usb/serial/mos7720.c
@@ -1299,8 +1299,6 @@ static void mos7720_throttle(struct tty_struct *tty)
 		mos7720_port->shadowMCR &= ~UART_MCR_RTS;
 		write_mos_reg(port->serial, port->port_number, MCR,
 			      mos7720_port->shadowMCR);
-		if (status != 0)
-			return;
 	}
 }
 
@@ -1331,8 +1329,6 @@ static void mos7720_unthrottle(struct tty_struct *tty)
 		mos7720_port->shadowMCR |= UART_MCR_RTS;
 		write_mos_reg(port->serial, port->port_number, MCR,
 			      mos7720_port->shadowMCR);
-		if (status != 0)
-			return;
 	}
 }
 
