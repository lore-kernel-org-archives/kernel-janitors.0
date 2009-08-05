From: Julia Lawall <julia@diku.dk>
Date: Wed, 05 Aug 2009 13:23:48 +0000
Subject: [PATCH 2/4] drivers/serial/atmel_serial.c: Use UPIO_MEM rather than
Message-Id: <Pine.LNX.4.64.0908051523080.20453@pc-004.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Haavard Skinnemoen <hskinnemoen@atmel.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

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
 drivers/serial/atmel_serial.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff -u -p a/drivers/serial/atmel_serial.c b/drivers/serial/atmel_serial.c
--- a/drivers/serial/atmel_serial.c
+++ b/drivers/serial/atmel_serial.c
@@ -1200,7 +1200,7 @@ static int atmel_verify_port(struct uart
 		ret = -EINVAL;
 	if (port->irq != ser->irq)
 		ret = -EINVAL;
-	if (ser->io_type != SERIAL_IO_MEM)
+	if (ser->io_type != UPIO_MEM)
 		ret = -EINVAL;
 	if (port->uartclk / 16 != ser->baud_base)
 		ret = -EINVAL;
