From: "Alexander Beregalov" <a.beregalov@gmail.com>
Date: Sun, 06 Jul 2008 16:30:12 +0000
Subject: [PATCH] drivers/net/cs89x0.c: remove unnecessary includes.
Message-Id: <a4423d670807060930p73465b1bj9c2e4eea01fb5b7a@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: jgarzik@pobox.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

From: Alexander Beregalov <a.beregalov@gmail.com>

The patch applies to the linux-next tree.

drivers/net/cs89x0.c: remove unnecessary includes.
asm/irq.h is already included unconditionally at 151 string.

Signed-off-by: Alexander Beregalov <a.beregalov@gmail.com>
---

diff --git a/drivers/net/cs89x0.c b/drivers/net/cs89x0.c
index fba87ab..5a9d118 100644
--- a/drivers/net/cs89x0.c
+++ b/drivers/net/cs89x0.c
@@ -182,13 +182,10 @@ static unsigned int cs8900_irq_map[] = {1,0,0,0};
 #elif defined(CONFIG_MACH_IXDP2351)
 static unsigned int netcard_portlist[] __used __initdata {IXDP2351_VIRT_CS8900_BASE, 0};
 static unsigned int cs8900_irq_map[] = {IRQ_IXDP2351_CS8900, 0, 0, 0};
-#include <asm/irq.h>
 #elif defined(CONFIG_ARCH_IXDP2X01)
-#include <asm/irq.h>
 static unsigned int netcard_portlist[] __used __initdata {IXDP2X01_CS8900_VIRT_BASE, 0};
 static unsigned int cs8900_irq_map[] = {IRQ_IXDP2X01_CS8900, 0, 0, 0};
 #elif defined(CONFIG_ARCH_PNX010X)
-#include <asm/irq.h>
 #include <asm/arch/gpio.h>
 #define CIRRUS_DEFAULT_BASE    IO_ADDRESS(EXT_STATIC2_s0_BASE +
0x200000)      /* = Physical address 0x48200000 */
 #define CIRRUS_DEFAULT_IRQ     VH_INTC_INT_NUM_CASCADED_INTERRUPT_1
/* Event inputs bank 1 - ID 35/bit 3 */
