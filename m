From: Julia Lawall <julia.lawall@lip6.fr>
Date: Sat, 01 Oct 2016 20:48:33 +0000
Subject: [PATCH 14/15 v2] irqchip/metag-ext: improve function-level documentation
Message-Id: <alpine.DEB.2.10.1610012247240.3445@hadrien>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: James Hogan <james.hogan@imgtec.com>
Cc: kernel-janitors@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, metag <linux-metag@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>

Drop the variable irq which ceased to be a parameter in commit bd0b9ac405e1
("genirq: Remove irq argument from irq flow handlers")

Issue detected using Coccinelle (http://coccinelle.lip6.fr/)

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>
Acked-by: James Hogan <james.hogan@imgtec.com>

---
v2: correct commit reference, independent of the rest of the series

 drivers/irqchip/irq-metag-ext.c |    1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/irqchip/irq-metag-ext.c b/drivers/irqchip/irq-metag-ext.c
index 8c38b3d..0cdd923 100644
--- a/drivers/irqchip/irq-metag-ext.c
+++ b/drivers/irqchip/irq-metag-ext.c
@@ -436,7 +436,6 @@ static int meta_intc_irq_set_type(struct irq_data *data, unsigned int flow_type)

 /**
  * meta_intc_irq_demux() - external irq de-multiplexer
- * @irq:	the virtual interrupt number
  * @desc:	the interrupt description structure for this irq
  *
  * The cpu receives an interrupt on TR2 when a SoC interrupt has occurred. It is

