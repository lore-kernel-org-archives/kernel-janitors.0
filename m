From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sat, 01 Oct 2016 19:46:30 +0000
Subject: [PATCH 13/15] irqchip: vic: improve function-level documentation
Message-Id: <1475351192-27079-14-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1475351192-27079-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1475351192-27079-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thomas Gleixner <tglx@linutronix.de>
Cc: kernel-janitors@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, linux-kernel@vger.kernel.org

The associated function, vic_init_cascaded, has never had a variable
irq_start.

Issue detected using Coccinelle (http://coccinelle.lip6.fr/)

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/irqchip/irq-vic.c |    1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/irqchip/irq-vic.c b/drivers/irqchip/irq-vic.c
index f811a7d..74192f6 100644
--- a/drivers/irqchip/irq-vic.c
+++ b/drivers/irqchip/irq-vic.c
@@ -498,7 +498,6 @@ void __init vic_init(void __iomem *base, unsigned int irq_start,
  * vic_init_cascaded() - initialise a cascaded vectored interrupt controller
  * @base: iomem base address
  * @parent_irq: the parent IRQ we're cascaded off
- * @irq_start: starting interrupt number, must be muliple of 32
  * @vic_sources: bitmask of interrupt sources to allow
  * @resume_sources: bitmask of interrupt sources to allow for resume
  *

