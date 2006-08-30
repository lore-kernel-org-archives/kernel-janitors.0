From: James Nelson <james4765@gmail.com>
Date: Wed, 30 Aug 2006 21:48:51 +0000
Subject: [KJ] [PATCH] 30/37 alpha: add printk() KERN_ constants to
Message-Id: <20060830214851.15055.48604.sendpatchset@david.homenet>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Signed-off-by: James Nelson <james4765@gmail.com>
---
diff --git a/arch/alpha/kernel/sys_marvel.c b/arch/alpha/kernel/sys_marvel.c
index 36d2159..4a28be4 100644
--- a/arch/alpha/kernel/sys_marvel.c
+++ b/arch/alpha/kernel/sys_marvel.c
@@ -277,7 +277,7 @@ init_io7_irqs(struct io7 *io7, 
 	long base = (io7->pe << MARVEL_IRQ_VEC_PE_SHIFT) + 16;
 	long i;
 
-	printk("Initializing interrupts for IO7 at PE %u - base %lx\n",
+	pr_info("Initializing interrupts for IO7 at PE %u - base %lx\n",
 		io7->pe, base);
 
 	/*
@@ -289,7 +289,7 @@ init_io7_irqs(struct io7 *io7, 
 	 * as each secondary starts, it can redirect it's local device 
 	 * interrupts.
 	 */
-	printk("  Interrupts reported to CPU at PE %u\n", boot_cpuid);
+	pr_info("  Interrupts reported to CPU at PE %u\n", boot_cpuid);
 
 	spin_lock(&io7->irq_lock);
 
@@ -373,15 +373,15 @@ marvel_map_irq(struct pci_dev *dev, u8 s
 		irq += 0x80;			/* offset for lsi       */
 
 #if 1
-		printk("PCI:%d:%d:%d (hose %d) is using MSI\n",
+		pr_info("PCI:%d:%d:%d (hose %d) is using MSI\n",
 		       dev->bus->number, 
 		       PCI_SLOT(dev->devfn), 
 		       PCI_FUNC(dev->devfn),
 		       hose->index);
-		printk("  %d message(s) from 0x%04x\n", 
+		pr_info("  %d message(s) from 0x%04x\n", 
 		       1 << ((msg_ctl & PCI_MSI_FLAGS_QSIZE) >> 4),
 		       msg_dat);
-		printk("  reporting on %d IRQ(s) from %d (0x%x)\n", 
+		pr_info("  reporting on %d IRQ(s) from %d (0x%x)\n", 
 		       1 << ((msg_ctl & PCI_MSI_FLAGS_QSIZE) >> 4),
 		       (irq + 16) | (io7->pe << MARVEL_IRQ_VEC_PE_SHIFT),
 		       (irq + 16) | (io7->pe << MARVEL_IRQ_VEC_PE_SHIFT));
@@ -393,7 +393,7 @@ #if 0
 		pci_read_config_byte(dev, PCI_INTERRUPT_LINE, &intline);
 		irq = intline;
 
-		printk("  forcing LSI interrupt on irq %d [0x%x]\n", irq, irq);
+		pr_info("  forcing LSI interrupt on irq %d [0x%x]\n", irq, irq);
 #endif
 	}
 
@@ -441,7 +441,7 @@ marvel_smp_callin(void)
 	/* 
 	 * There is a local IO7 - redirect all of its interrupts here.
 	 */
-	printk("Redirecting IO7 interrupts to local CPU at PE %u\n", cpuid);
+	pr_info("Redirecting IO7 interrupts to local CPU at PE %u\n", cpuid);
 
 	/* Redirect the error IRQS here.  */
 	io7_redirect_irq(io7, &io7->csrs->HLT_CTL.csr, cpuid);
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
