From: Julia Lawall <julia@diku.dk>
Date: Wed, 05 Aug 2009 13:25:08 +0000
Subject: [PATCH 4/4] drivers/serial/mpc52xx_uart.c: Use UPIO_MEM rather than
Message-Id: <Pine.LNX.4.64.0908051524220.20453@pc-004.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: grant.likely@secretlab.ca, linuxppc-dev@ozlabs.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

As in the commit 9b4a1617772d6d5ab5eeda0cd95302fae119e359, use UPIO_MEM
rather than SERIAL_IO_MEM.  Both have the same value.

The semantic patch that makes this change is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@has_sc@
@@

#include <linux/serial_core.h>

@depends on has_sc@
@@

- SERIAL_IO_MEM
+ UPIO_MEM
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/serial/mpc52xx_uart.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff -u -p a/drivers/serial/mpc52xx_uart.c b/drivers/serial/mpc52xx_uart.c
--- a/drivers/serial/mpc52xx_uart.c
+++ b/drivers/serial/mpc52xx_uart.c
@@ -705,7 +705,7 @@ mpc52xx_uart_verify_port(struct uart_por
 		return -EINVAL;
 
 	if ((ser->irq != port->irq) ||
-	    (ser->io_type != SERIAL_IO_MEM) ||
+	    (ser->io_type != UPIO_MEM) ||
 	    (ser->baud_base != port->uartclk)  ||
 	    (ser->iomem_base != (void *)port->mapbase) ||
 	    (ser->hub6 != 0))
