From: Julia Lawall <julia@diku.dk>
Date: Wed, 05 Aug 2009 13:23:08 +0000
Subject: [PATCH 1/4] arch/xtensa: Use UPIO_MEM rather than SERIAL_IO_MEM
Message-Id: <Pine.LNX.4.64.0908051522300.20453@pc-004.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chris Zankel <chris@zankel.net>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

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
 arch/xtensa/platforms/s6105/device.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff -u -p a/arch/xtensa/platforms/s6105/device.c b/arch/xtensa/platforms/s6105/device.c
--- a/arch/xtensa/platforms/s6105/device.c
+++ b/arch/xtensa/platforms/s6105/device.c
@@ -54,7 +54,7 @@ static struct plat_serial8250_port seria
 		.irq = UART_INTNUM,
 		.uartclk = S6_SCLK,
 		.regshift = 2,
-		.iotype = SERIAL_IO_MEM,
+		.iotype = UPIO_MEM,
 		.flags = ASYNC_BOOT_AUTOCONF | ASYNC_SKIP_TEST,
 	},
 	{
@@ -63,7 +63,7 @@ static struct plat_serial8250_port seria
 		.irq = UART_INTNUM,
 		.uartclk = S6_SCLK,
 		.regshift = 2,
-		.iotype = SERIAL_IO_MEM,
+		.iotype = UPIO_MEM,
 		.flags = ASYNC_BOOT_AUTOCONF | ASYNC_SKIP_TEST,
 	},
 	{ },
