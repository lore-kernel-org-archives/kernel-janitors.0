From: Julia Lawall <Julia.Lawall@inria.fr>
Date: Wed, 01 Jan 2020 07:43:34 +0000
Subject: [PATCH 16/16] pinctrl: nuvoton: npcm7xx: constify copied structure
Message-Id: <1577864614-5543-17-git-send-email-Julia.Lawall@inria.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1577864614-5543-1-git-send-email-Julia.Lawall@inria.fr>
In-Reply-To: <1577864614-5543-1-git-send-email-Julia.Lawall@inria.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linus Walleij <linus.walleij@linaro.org>
Cc: kernel-janitors@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

The npcmgpio_irqchip structure is only copied into another
structure, so make it const.

The opportunity for this change was found using Coccinelle.

Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

---
 drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c b/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
index 22077cbe6880..a935065cdac4 100644
--- a/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
+++ b/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
@@ -331,7 +331,7 @@ static unsigned int npcmgpio_irq_startup(struct irq_data *d)
 	return 0;
 }
 
-static struct irq_chip npcmgpio_irqchip = {
+static const struct irq_chip npcmgpio_irqchip = {
 	.name = "NPCM7XX-GPIO-IRQ",
 	.irq_ack = npcmgpio_irq_ack,
 	.irq_unmask = npcmgpio_irq_unmask,
