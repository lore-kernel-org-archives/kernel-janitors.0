From: Tobias Klauser <tklauser@distanz.ch>
Date: Tue, 10 Nov 2009 07:53:06 +0000
Subject: [PATCH] avr32: Use resource_size
Message-Id: <1257839586-3780-1-git-send-email-tklauser@distanz.ch>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Haavard Skinnemoen <hskinnemoen@atmel.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Tobias Klauser <tklauser@distanz.ch>

Use the resource_size function instead of manually calculating the
resource size. This reduces the chance of introducing off-by-one errors.

Signed-off-by: Tobias Klauser <tklauser@distanz.ch>
---
 arch/avr32/kernel/setup.c       |    4 ++--
 arch/avr32/mach-at32ap/extint.c |    2 +-
 arch/avr32/mach-at32ap/hsmc.c   |    2 +-
 arch/avr32/mach-at32ap/intc.c   |    2 +-
 arch/avr32/mach-at32ap/pio.c    |    2 +-
 5 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/avr32/kernel/setup.c b/arch/avr32/kernel/setup.c
index 5c70839..1ee4031 100644
--- a/arch/avr32/kernel/setup.c
+++ b/arch/avr32/kernel/setup.c
@@ -429,7 +429,7 @@ static unsigned long __init
 find_bootmap_pfn(const struct resource *mem)
 {
 	unsigned long bootmap_pages, bootmap_len;
-	unsigned long node_pages = PFN_UP(mem->end - mem->start + 1);
+	unsigned long node_pages = PFN_UP(resource_size(mem));
 	unsigned long bootmap_start;
 
 	bootmap_pages = bootmem_bootmap_pages(node_pages);
@@ -528,7 +528,7 @@ static void __init setup_bootmem(void)
 			    && res->end < PFN_PHYS(max_pfn))
 				reserve_bootmem_node(
 					NODE_DATA(node), res->start,
-					res->end - res->start + 1,
+					resource_size(res),
 					BOOTMEM_DEFAULT);
 		}
 
diff --git a/arch/avr32/mach-at32ap/extint.c b/arch/avr32/mach-at32ap/extint.c
index 310477b..f28afa9 100644
--- a/arch/avr32/mach-at32ap/extint.c
+++ b/arch/avr32/mach-at32ap/extint.c
@@ -211,7 +211,7 @@ static int __init eic_probe(struct platform_device *pdev)
 	}
 
 	eic->first_irq = EIM_IRQ_BASE + 32 * pdev->id;
-	eic->regs = ioremap(regs->start, regs->end - regs->start + 1);
+	eic->regs = ioremap(regs->start, resource_size(regs));
 	if (!eic->regs) {
 		dev_dbg(&pdev->dev, "failed to map regs\n");
 		goto err_ioremap;
diff --git a/arch/avr32/mach-at32ap/hsmc.c b/arch/avr32/mach-at32ap/hsmc.c
index 2875c11..9e130f4 100644
--- a/arch/avr32/mach-at32ap/hsmc.c
+++ b/arch/avr32/mach-at32ap/hsmc.c
@@ -244,7 +244,7 @@ static int hsmc_probe(struct platform_device *pdev)
 
 	hsmc->pclk = pclk;
 	hsmc->mck = mck;
-	hsmc->regs = ioremap(regs->start, regs->end - regs->start + 1);
+	hsmc->regs = ioremap(regs->start, resource_size(regs));
 	if (!hsmc->regs)
 		goto out_disable_clocks;
 
diff --git a/arch/avr32/mach-at32ap/intc.c b/arch/avr32/mach-at32ap/intc.c
index 994c454..b713f07 100644
--- a/arch/avr32/mach-at32ap/intc.c
+++ b/arch/avr32/mach-at32ap/intc.c
@@ -110,7 +110,7 @@ void __init init_IRQ(void)
 
 	clk_enable(pclk);
 
-	intc0.regs = ioremap(regs->start, regs->end - regs->start + 1);
+	intc0.regs = ioremap(regs->start, resource_size(regs));
 	if (!intc0.regs) {
 		printk(KERN_EMERG "intc: failed to map registers (0x%08lx)\n",
 		       (unsigned long)regs->start);
diff --git a/arch/avr32/mach-at32ap/pio.c b/arch/avr32/mach-at32ap/pio.c
index 09a274c..586008a 100644
--- a/arch/avr32/mach-at32ap/pio.c
+++ b/arch/avr32/mach-at32ap/pio.c
@@ -464,7 +464,7 @@ void __init at32_init_pio(struct platform_device *pdev)
 		clk_enable(pio->clk);
 
 	pio->pdev = pdev;
-	pio->regs = ioremap(regs->start, regs->end - regs->start + 1);
+	pio->regs = ioremap(regs->start, resource_size(regs));
 
 	/* start with irqs disabled and acked */
 	pio_writel(pio, IDR, ~0UL);
-- 
1.6.3.3

