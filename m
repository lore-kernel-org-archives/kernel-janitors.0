From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sat, 18 Feb 2017 08:34:34 +0000
Subject: [PATCH] irqchip/qcom: Fix error handling
Message-Id: <20170218083434.2289-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

'devm_ioremap()' returns NULL on error, not an error pointer.

Fixes: f20cc9b00c7b ("irqchip/qcom: Add IRQ combiner driver")

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/irqchip/qcom-irq-combiner.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/qcom-irq-combiner.c b/drivers/irqchip/qcom-irq-combiner.c
index 03251da95397..226558698344 100644
--- a/drivers/irqchip/qcom-irq-combiner.c
+++ b/drivers/irqchip/qcom-irq-combiner.c
@@ -202,9 +202,9 @@ static acpi_status get_registers_cb(struct acpi_resource *ares, void *context)
 	}
 
 	vaddr = devm_ioremap(ctx->dev, reg->address, REG_SIZE);
-	if (IS_ERR(vaddr)) {
+	if (!vaddr) {
 		dev_err(ctx->dev, "Can't map register @%pa\n", &paddr);
-		ctx->err = PTR_ERR(vaddr);
+		ctx->err = -ENOMEM;
 		return AE_ERROR;
 	}
 
-- 
2.9.3

