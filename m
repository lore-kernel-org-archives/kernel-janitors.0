From: Julia Lawall <julia@diku.dk>
Date: Sun, 21 Dec 2008 20:54:23 +0000
Subject: [PATCH 1/2] arch/arm/plat-mxc: Add local_irq_restore in error handling
Message-Id: <Pine.LNX.4.64.0812212153570.3635@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel@pengutronix.de, linux-arm-kernel@lists.arm.linux.org.uk, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

There is a call to local_irq_restore in the normal exit case, so it would
seem that there should be one on an error return as well.

The semantic patch that makes this change is as follows:
(http://www.emn.fr/x-info/coccinelle/)

// <smpl>
@@
expression l;
expression E,E1,E2;
@@

local_irq_save(l);
... when != local_irq_restore(l)
    when != spin_unlock_irqrestore(E,l)
    when any
    when strict
(
if (...) { ... when != local_irq_restore(l)
               when != spin_unlock_irqrestore(E1,l)
+   local_irq_restore(l);
    return ...;
}
|
if (...)
+   {local_irq_restore(l);
    return ...;
+   }
|
spin_unlock_irqrestore(E2,l);
|
local_irq_restore(l);
)
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 arch/arm/plat-mxc/dma-mx1-mx2.c |    1 +
 1 file changed, 1 insertion(+)

diff -u -p a/arch/arm/plat-mxc/dma-mx1-mx2.c b/arch/arm/plat-mxc/dma-mx1-mx2.c
--- a/arch/arm/plat-mxc/dma-mx1-mx2.c
+++ b/arch/arm/plat-mxc/dma-mx1-mx2.c
@@ -698,6 +698,7 @@ int imx_dma_request(int channel, const c
 	if (ret) {
 		printk(KERN_CRIT "Can't register IRQ %d for DMA channel %d\n",
 				MXC_INT_DMACH0 + channel, channel);
+		local_irq_restore(flags);
 		return ret;
 	}
 	init_timer(&imxdma->watchdog);
