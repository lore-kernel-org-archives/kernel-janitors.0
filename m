From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Fri, 11 May 2007 18:53:53 +0000
Subject: [KJ] [PATCH] Fix misspellings of "system", "controller",
Message-Id: <Pine.LNX.4.64.0705111435210.19122@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


Fix the various misspellings of "system", controller", "interrupt" and
"[un]necessary".

Signed-off-by: Robert P. J. Day <rpjday@mindspring.com>

---

  just clearing out the wiki misspellings page:

http://fsdev.net/wiki/index.php?title=Spelling_mistakes

feel free to add more typoes that page as you find them so they can be
fixed in one big patch every so often.

diff --git a/Documentation/filesystems/Locking b/Documentation/filesystems/Locking
index d866551..0ab11b3 100644
--- a/Documentation/filesystems/Locking
+++ b/Documentation/filesystems/Locking
@@ -221,7 +221,7 @@ against the page the filesystem should redirty the page with
 redirty_page_for_writepage(), then unlock the page and return zero.
 This may also be done to avoid internal deadlocks, but rarely.

-If the filesytem is called for sync then it must wait on any
+If the filesystem is called for sync then it must wait on any
 in-progress I/O and then start new I/O.

 The filesystem should unlock the page synchronously, before returning to the
diff --git a/Documentation/mips/AU1xxx_IDE.README b/Documentation/mips/AU1xxx_IDE.README
index afb31c1..5c83341 100644
--- a/Documentation/mips/AU1xxx_IDE.README
+++ b/Documentation/mips/AU1xxx_IDE.README
@@ -59,7 +59,7 @@ Four configs variables are introduced:
   CONFIG_BLK_DEV_IDE_AU1XXX_PIO_DBDMA    - enable the PIO+DBDMA mode
   CONFIG_BLK_DEV_IDE_AU1XXX_MDMA2_DBDMA  - enable the MWDMA mode
   CONFIG_BLK_DEV_IDE_AU1XXX_BURSTABLE_ON - set Burstable FIFO in DBDMA
-                                           controler
+                                           controller
   CONFIG_BLK_DEV_IDE_AU1XXX_SEQTS_PER_RQ - maximum transfer size
                                            per descriptor

diff --git a/arch/arm/mach-at91/gpio.c b/arch/arm/mach-at91/gpio.c
index ba4a1bb..aa2d365 100644
--- a/arch/arm/mach-at91/gpio.c
+++ b/arch/arm/mach-at91/gpio.c
@@ -439,7 +439,7 @@ void __init at91_gpio_irq_setup(void)
 		for (i = 0; i < 32; i++, pin++) {
 			/*
 			 * Can use the "simple" and not "edge" handler since it's
-			 * shorter, and the AIC handles interupts sanely.
+			 * shorter, and the AIC handles interrupts sanely.
 			 */
 			set_irq_chip(pin, &gpio_irqchip);
 			set_irq_handler(pin, handle_simple_irq);
diff --git a/arch/arm/mach-s3c2410/clock.c b/arch/arm/mach-s3c2410/clock.c
index 5b4831c..0408e3e 100644
--- a/arch/arm/mach-s3c2410/clock.c
+++ b/arch/arm/mach-s3c2410/clock.c
@@ -238,7 +238,7 @@ int __init s3c2410_baseclk_add(void)
 	}

 	/* We must be careful disabling the clocks we are not intending to
-	 * be using at boot time, as subsytems such as the LCD which do
+	 * be using at boot time, as subsystems such as the LCD which do
 	 * their own DMA requests to the bus can cause the system to lockup
 	 * if they where in the middle of requesting bus access.
 	 *
diff --git a/arch/arm/mach-s3c2412/clock.c b/arch/arm/mach-s3c2412/clock.c
index 6a8e444..40451fc 100644
--- a/arch/arm/mach-s3c2412/clock.c
+++ b/arch/arm/mach-s3c2412/clock.c
@@ -689,7 +689,7 @@ int __init s3c2412_baseclk_add(void)
 	}

 	/* We must be careful disabling the clocks we are not intending to
-	 * be using at boot time, as subsytems such as the LCD which do
+	 * be using at boot time, as subsystems such as the LCD which do
 	 * their own DMA requests to the bus can cause the system to lockup
 	 * if they where in the middle of requesting bus access.
 	 *
diff --git a/arch/arm/mach-s3c2443/clock.c b/arch/arm/mach-s3c2443/clock.c
index dd2272f..f839fda 100644
--- a/arch/arm/mach-s3c2443/clock.c
+++ b/arch/arm/mach-s3c2443/clock.c
@@ -982,7 +982,7 @@ void __init s3c2443_init_clocks(int xtal)
 	}

 	/* We must be careful disabling the clocks we are not intending to
-	 * be using at boot time, as subsytems such as the LCD which do
+	 * be using at boot time, as subsystems such as the LCD which do
 	 * their own DMA requests to the bus can cause the system to lockup
 	 * if they where in the middle of requesting bus access.
 	 *
diff --git a/arch/blackfin/mach-bf533/ints-priority.c b/arch/blackfin/mach-bf533/ints-priority.c
index 36a6933..a3e1789 100644
--- a/arch/blackfin/mach-bf533/ints-priority.c
+++ b/arch/blackfin/mach-bf533/ints-priority.c
@@ -4,7 +4,7 @@
  * Author:       Michael Hennerich
  *
  * Created:      ?
- * Description:  Set up the interupt priorities
+ * Description:  Set up the interrupt priorities
  *
  * Modified:
  *               Copyright 2004-2006 Analog Devices Inc.
diff --git a/arch/blackfin/mach-bf537/ints-priority.c b/arch/blackfin/mach-bf537/ints-priority.c
index fd6308e..2dbf3df 100644
--- a/arch/blackfin/mach-bf537/ints-priority.c
+++ b/arch/blackfin/mach-bf537/ints-priority.c
@@ -4,7 +4,7 @@
  * Author:       Michael Hennerich
  *
  * Created:
- * Description:  Set up the interupt priorities
+ * Description:  Set up the interrupt priorities
  *
  * Modified:
  *               Copyright 2004-2006 Analog Devices Inc.
diff --git a/arch/blackfin/mach-bf561/ints-priority.c b/arch/blackfin/mach-bf561/ints-priority.c
index 89c52ff..86e3b0e 100644
--- a/arch/blackfin/mach-bf561/ints-priority.c
+++ b/arch/blackfin/mach-bf561/ints-priority.c
@@ -4,7 +4,7 @@
  * Author:       Michael Hennerich
  *
  * Created:
- * Description:  Set up the interupt priorities
+ * Description:  Set up the interrupt priorities
  *
  * Modified:
  *               Copyright 2004-2006 Analog Devices Inc.
diff --git a/arch/blackfin/mach-common/ints-priority-dc.c b/arch/blackfin/mach-common/ints-priority-dc.c
index f3cf070..80943bb 100644
--- a/arch/blackfin/mach-common/ints-priority-dc.c
+++ b/arch/blackfin/mach-common/ints-priority-dc.c
@@ -4,7 +4,7 @@
  * Author:
  *
  * Created:      ?
- * Description:  Set up the interupt priorities
+ * Description:  Set up the interrupt priorities
  *
  * Modified:
  *               1996 Roman Zippel
diff --git a/arch/blackfin/mach-common/ints-priority-sc.c b/arch/blackfin/mach-common/ints-priority-sc.c
index 34b6228..2cfc7d5 100644
--- a/arch/blackfin/mach-common/ints-priority-sc.c
+++ b/arch/blackfin/mach-common/ints-priority-sc.c
@@ -4,7 +4,7 @@
  * Author:
  *
  * Created:      ?
- * Description:  Set up the interupt priorities
+ * Description:  Set up the interrupt priorities
  *
  * Modified:
  *               1996 Roman Zippel
diff --git a/arch/cris/arch-v10/drivers/pcf8563.c b/arch/cris/arch-v10/drivers/pcf8563.c
index d47cfbf..19ce066 100644
--- a/arch/cris/arch-v10/drivers/pcf8563.c
+++ b/arch/cris/arch-v10/drivers/pcf8563.c
@@ -4,7 +4,7 @@
  * From Phillips' datasheet:
  *
  * The PCF8563 is a CMOS real-time clock/calendar optimized for low power
- * consumption. A programmable clock output, interupt output and voltage
+ * consumption. A programmable clock output, interrupt output and voltage
  * low detector are also provided. All address and data are transferred
  * serially via two-line bidirectional I2C-bus. Maximum bus speed is
  * 400 kbits/s. The built-in word address register is incremented
diff --git a/arch/cris/arch-v32/drivers/pcf8563.c b/arch/cris/arch-v32/drivers/pcf8563.c
index 24b919b..e6f1eff 100644
--- a/arch/cris/arch-v32/drivers/pcf8563.c
+++ b/arch/cris/arch-v32/drivers/pcf8563.c
@@ -4,7 +4,7 @@
  * From Phillips' datasheet:
  *
  * The PCF8563 is a CMOS real-time clock/calendar optimized for low power
- * consumption. A programmable clock output, interupt output and voltage
+ * consumption. A programmable clock output, interrupt output and voltage
  * low detector are also provided. All address and data are transferred
  * serially via two-line bidirectional I2C-bus. Maximum bus speed is
  * 400 kbits/s. The built-in word address register is incremented
diff --git a/arch/h8300/kernel/irq.c b/arch/h8300/kernel/irq.c
index 43d21e9..8dec4dd 100644
--- a/arch/h8300/kernel/irq.c
+++ b/arch/h8300/kernel/irq.c
@@ -68,7 +68,7 @@ static void h8300_shutdown_irq(unsigned int irq)
 }

 /*
- * h8300 interrupt controler implementation
+ * h8300 interrupt controller implementation
  */
 struct irq_chip h8300irq_chip = {
 	.name		= "H8300-INTC",
diff --git a/arch/m68knommu/platform/5307/pit.c b/arch/m68knommu/platform/5307/pit.c
index aa15bee..e8efbe6 100644
--- a/arch/m68knommu/platform/5307/pit.c
+++ b/arch/m68knommu/platform/5307/pit.c
@@ -79,7 +79,7 @@ unsigned long coldfire_pit_offset(void)

 	/*
 	 * If we are still in the first half of the upcount and a
-	 * timer interupt is pending, then add on a ticks worth of time.
+	 * timer interrupt is pending, then add on a ticks worth of time.
 	 */
 	offset = ((pmr - pcntr) * (1000000 / HZ)) / pmr;
 	if ((offset < (1000000 / HZ / 2)) && (*ipr & MCFPIT_IMR_IBIT))
diff --git a/arch/mips/ddb5xxx/ddb5477/setup.c b/arch/mips/ddb5xxx/ddb5477/setup.c
index f0cc0e8..23c730c 100644
--- a/arch/mips/ddb5xxx/ddb5477/setup.c
+++ b/arch/mips/ddb5xxx/ddb5477/setup.c
@@ -350,7 +350,7 @@ static void __init ddb5477_board_init(void)

 		/*
 		 * positive decode (bit6 -0)
-		 * enable IDE controler interrupt (bit 4 -1)
+		 * enable IDE controller interrupt (bit 4 -1)
 		 * setup SIRQ to point to IRQ 14 (bit 3:0 - 1101)
 		 */
 		pci_write_config_byte(&dev_m1533, 0x44, 0x1d);
diff --git a/arch/mips/kernel/module.c b/arch/mips/kernel/module.c
index cb08014..e7ed0ac 100644
--- a/arch/mips/kernel/module.c
+++ b/arch/mips/kernel/module.c
@@ -381,7 +381,7 @@ const struct exception_table_entry *search_module_dbetables(unsigned long addr)
 	return e;
 }

-/* Put in dbe list if neccessary. */
+/* Put in dbe list if necessary. */
 int module_finalize(const Elf_Ehdr *hdr,
 		    const Elf_Shdr *sechdrs,
 		    struct module *me)
diff --git a/arch/mips/kernel/smtc.c b/arch/mips/kernel/smtc.c
index b361edb..5710875 100644
--- a/arch/mips/kernel/smtc.c
+++ b/arch/mips/kernel/smtc.c
@@ -704,7 +704,7 @@ void smtc_send_ipi(int cpu, int type, unsigned int action)
 	pipi->arg = (void *)action;
 	pipi->dest = cpu;
 	if (cpu_data[cpu].vpe_id != cpu_data[smp_processor_id()].vpe_id) {
-		/* If not on same VPE, enqueue and send cross-VPE interupt */
+		/* If not on same VPE, enqueue and send cross-VPE interrupt */
 		smtc_ipi_nq(&IPIQ[cpu], pipi);
 		LOCK_CORE_PRA();
 		settc(cpu_data[cpu].tc_id);
diff --git a/arch/mips/pci/pci-excite.c b/arch/mips/pci/pci-excite.c
index 3c86c77..8a56876 100644
--- a/arch/mips/pci/pci-excite.c
+++ b/arch/mips/pci/pci-excite.c
@@ -131,7 +131,7 @@ static int __init basler_excite_pci_setup(void)
 		ocd_writel(0x00000000, bar + 0x100);
 	}

-	/* Finally, enable the PCI interupt */
+	/* Finally, enable the PCI interrupt */
 #if USB_IRQ > 7
 	set_c0_intcontrol(1 << USB_IRQ);
 #else
diff --git a/arch/mips/sni/pcimt.c b/arch/mips/sni/pcimt.c
index 9ee208d..6279141 100644
--- a/arch/mips/sni/pcimt.c
+++ b/arch/mips/sni/pcimt.c
@@ -211,7 +211,7 @@ static void pcimt_hwint1(void)
 		/*
 		 * Note: ASIC PCI's builtin interrupt achknowledge feature is
 		 * broken.  Using it may result in loss of some or all i8259
-		 * interupts, so don't use PCIMT_INT_ACKNOWLEDGE ...
+		 * interrupts, so don't use PCIMT_INT_ACKNOWLEDGE ...
 		 */
 		irq = i8259_irq();
 		if (unlikely(irq < 0))
diff --git a/arch/powerpc/platforms/celleb/scc_uhc.c b/arch/powerpc/platforms/celleb/scc_uhc.c
index a7c548b..b59c38a 100644
--- a/arch/powerpc/platforms/celleb/scc_uhc.c
+++ b/arch/powerpc/platforms/celleb/scc_uhc.c
@@ -36,7 +36,7 @@ static inline int uhc_clkctrl_ready(u32 val)
 }

 /*
- * UHC(usb host controler) enable function.
+ * UHC(usb host controller) enable function.
  * affect to both of OHCI and EHCI core module.
  */
 static void enable_scc_uhc(struct pci_dev *dev)
diff --git a/arch/sh/boards/superh/microdev/irq.c b/arch/sh/boards/superh/microdev/irq.c
index 8c64baa..cc1cb04 100644
--- a/arch/sh/boards/superh/microdev/irq.c
+++ b/arch/sh/boards/superh/microdev/irq.c
@@ -100,7 +100,7 @@ static void disable_microdev_irq(unsigned int irq)

 	fpgaIrq = fpgaIrqTable[irq].fpgaIrq;

-	/* disable interupts on the FPGA INTC register */
+	/* disable interrupts on the FPGA INTC register */
 	ctrl_outl(MICRODEV_FPGA_INTC_MASK(fpgaIrq), MICRODEV_FPGA_INTDSB_REG);
 }

@@ -125,7 +125,7 @@ static void enable_microdev_irq(unsigned int irq)
 	priorities |= MICRODEV_FPGA_INTPRI_LEVEL(fpgaIrq, pri);
 	ctrl_outl(priorities, priorityReg);

-	/* enable interupts on the FPGA INTC register */
+	/* enable interrupts on the FPGA INTC register */
 	ctrl_outl(MICRODEV_FPGA_INTC_MASK(fpgaIrq), MICRODEV_FPGA_INTENB_REG);
 }

@@ -152,7 +152,7 @@ extern void __init init_microdev_irq(void)
 {
 	int i;

-		/* disable interupts on the FPGA INTC register */
+		/* disable interrupts on the FPGA INTC register */
 	ctrl_outl(~0ul, MICRODEV_FPGA_INTDSB_REG);

 	for (i = 0; i < NUM_EXTERNAL_IRQS; i++)
diff --git a/arch/sh/drivers/pci/pci-st40.c b/arch/sh/drivers/pci/pci-st40.c
index d67656a..b10433b 100644
--- a/arch/sh/drivers/pci/pci-st40.c
+++ b/arch/sh/drivers/pci/pci-st40.c
@@ -425,7 +425,7 @@ static int __init pcibios_init(void)
 		sh_mv.mv_init_pci();
 	}

-	/* The pci subsytem needs to know where memory is and how much
+	/* The pci subsystem needs to know where memory is and how much
 	 * of it there is. I've simply made these globals. A better mechanism
 	 * is probably needed.
 	 */
diff --git a/arch/sh/kernel/cpu/sh4/setup-sh7750.c b/arch/sh/kernel/cpu/sh4/setup-sh7750.c
index 6f8f458..adb48d6 100644
--- a/arch/sh/kernel/cpu/sh4/setup-sh7750.c
+++ b/arch/sh/kernel/cpu/sh4/setup-sh7750.c
@@ -136,7 +136,7 @@ unsigned int map_ipridx_to_addr(int idx)
 #define INTC_ICR	0xffd00000UL
 #define INTC_ICR_IRLM   (1<<7)

-/* enable individual interrupt mode for external interupts */
+/* enable individual interrupt mode for external interrupts */
 void ipr_irq_enable_irlm(void)
 {
 	ctrl_outw(ctrl_inw(INTC_ICR) | INTC_ICR_IRLM, INTC_ICR);
diff --git a/arch/sh64/kernel/pci_sh5.c b/arch/sh64/kernel/pci_sh5.c
index 49862e1..21641c3 100644
--- a/arch/sh64/kernel/pci_sh5.c
+++ b/arch/sh64/kernel/pci_sh5.c
@@ -483,7 +483,7 @@ static int __init pcibios_init(void)
                 return -EINVAL;
         }

-	/* The pci subsytem needs to know where memory is and how much
+	/* The pci subsystem needs to know where memory is and how much
 	 * of it there is. I've simply made these globals. A better mechanism
 	 * is probably needed.
 	 */
diff --git a/arch/sh64/mm/fault.c b/arch/sh64/mm/fault.c
index 4dd8ee8..3cd93ba 100644
--- a/arch/sh64/mm/fault.c
+++ b/arch/sh64/mm/fault.c
@@ -135,7 +135,7 @@ asmlinkage void do_page_fault(struct pt_regs *regs, unsigned long writeaccess,
 	/* SIM
 	 * Note this is now called with interrupts still disabled
 	 * This is to cope with being called for a missing IO port
-	 * address with interupts disabled. This should be fixed as
+	 * address with interrupts disabled. This should be fixed as
 	 * soon as we have a better 'fast path' miss handler.
 	 *
 	 * Plus take care how you try and debug this stuff.
diff --git a/arch/sh64/mm/tlbmiss.c b/arch/sh64/mm/tlbmiss.c
index d4c5334..be10263 100644
--- a/arch/sh64/mm/tlbmiss.c
+++ b/arch/sh64/mm/tlbmiss.c
@@ -249,7 +249,7 @@ asmlinkage int do_fast_page_fault(unsigned long long ssr_md, unsigned long long
 	/* SIM
 	 * Note this is now called with interrupts still disabled
 	 * This is to cope with being called for a missing IO port
-	 * address with interupts disabled. This should be fixed as
+	 * address with interrupts disabled. This should be fixed as
 	 * soon as we have a better 'fast path' miss handler.
 	 *
 	 * Plus take care how you try and debug this stuff.
diff --git a/arch/x86_64/kernel/suspend.c b/arch/x86_64/kernel/suspend.c
index 6a5a98f..147b256 100644
--- a/arch/x86_64/kernel/suspend.c
+++ b/arch/x86_64/kernel/suspend.c
@@ -123,7 +123,7 @@ void fix_processor_context(void)
 	int cpu = smp_processor_id();
 	struct tss_struct *t = &per_cpu(init_tss, cpu);

-	set_tss_desc(cpu,t);	/* This just modifies memory; should not be neccessary. But... This is neccessary, because 386 hardware has concept of busy TSS or some similar stupidity. */
+	set_tss_desc(cpu,t);	/* This just modifies memory; should not be necessary. But... This is necessary, because 386 hardware has concept of busy TSS or some similar stupidity. */

 	cpu_gdt(cpu)[GDT_ENTRY_TSS].type = 9;

diff --git a/drivers/ata/ahci.c b/drivers/ata/ahci.c
index d961789..a7b91c3 100644
--- a/drivers/ata/ahci.c
+++ b/drivers/ata/ahci.c
@@ -1232,7 +1232,7 @@ static void ahci_host_intr(struct ata_port *ap)
 		return;
 	}

-	/* hmmm... a spurious interupt */
+	/* hmmm... a spurious interrupt */

 	/* if !NCQ, ignore.  No modern ATA device has broken HSM
 	 * implementation for non-NCQ commands.
diff --git a/drivers/ata/libata-sff.c b/drivers/ata/libata-sff.c
index d211db6..3d22bd8 100644
--- a/drivers/ata/libata-sff.c
+++ b/drivers/ata/libata-sff.c
@@ -1072,7 +1072,7 @@ err_out:
  *	@pdev: PCI device
  *
  *	Some PCI ATA devices report simplex mode but in fact can be told to
- *	enter non simplex mode. This implements the neccessary logic to
+ *	enter non simplex mode. This implements the necessary logic to
  *	perform the task on such devices. Calling it on other devices will
  *	have -undefined- behaviour.
  */
diff --git a/drivers/ata/pata_cs5530.c b/drivers/ata/pata_cs5530.c
index 29642d5..b7a9155 100644
--- a/drivers/ata/pata_cs5530.c
+++ b/drivers/ata/pata_cs5530.c
@@ -138,7 +138,7 @@ static void cs5530_set_dmamode(struct ata_port *ap, struct ata_device *adev)
  *
  *	Called when the libata layer is about to issue a command. We wrap
  *	this interface so that we can load the correct ATA timings if
- *	neccessary.  Specifically we have a problem that there is only
+ *	necessary.  Specifically we have a problem that there is only
  *	one MWDMA/UDMA bit.
  */

diff --git a/drivers/ata/pata_cs5535.c b/drivers/ata/pata_cs5535.c
index 22006ae..6315b91 100644
--- a/drivers/ata/pata_cs5535.c
+++ b/drivers/ata/pata_cs5535.c
@@ -25,7 +25,7 @@
  * Documentation:
  *	Available from AMD web site.
  * TODO
- *	Review errata to see if serializing is neccessary
+ *	Review errata to see if serializing is necessary
  */

 #include <linux/kernel.h>
diff --git a/drivers/ata/pata_it821x.c b/drivers/ata/pata_it821x.c
index f1f8cec..a1a7cab 100644
--- a/drivers/ata/pata_it821x.c
+++ b/drivers/ata/pata_it821x.c
@@ -105,7 +105,7 @@ struct it821x_dev

 /*
  *	We allow users to force the card into non raid mode without
- *	flashing the alternative BIOS. This is also neccessary right now
+ *	flashing the alternative BIOS. This is also necessary right now
  *	for embedded platforms that cannot run a PC BIOS but are using this
  *	device.
  */
@@ -383,7 +383,7 @@ static void it821x_passthru_bmdma_stop(struct ata_queued_cmd *qc)
  *	@ap: ATA port
  *	@device: Device number (not pointer)
  *
- *	Device selection hook. If neccessary perform clock switching
+ *	Device selection hook. If necessary perform clock switching
  */

 static void it821x_passthru_dev_select(struct ata_port *ap,
diff --git a/drivers/ata/pata_mpiix.c b/drivers/ata/pata_mpiix.c
index 3bfbd49..20cb3ae 100644
--- a/drivers/ata/pata_mpiix.c
+++ b/drivers/ata/pata_mpiix.c
@@ -128,7 +128,7 @@ static void mpiix_set_piomode(struct ata_port *ap, struct ata_device *adev)
  *
  *	Called when the libata layer is about to issue a command. We wrap
  *	this interface so that we can load the correct ATA timings if
- *	neccessary. Our logic also clears TIME0/TIME1 for the other device so
+ *	necessary. Our logic also clears TIME0/TIME1 for the other device so
  *	that, even if we get this wrong, cycles to the other device will
  *	be made PIO0.
  */
diff --git a/drivers/ata/pata_ns87410.c b/drivers/ata/pata_ns87410.c
index ebc58a9..347fc2e 100644
--- a/drivers/ata/pata_ns87410.c
+++ b/drivers/ata/pata_ns87410.c
@@ -123,7 +123,7 @@ static void ns87410_set_piomode(struct ata_port *ap, struct ata_device *adev)
  *
  *	Called when the libata layer is about to issue a command. We wrap
  *	this interface so that we can load the correct ATA timings if
- *	neccessary.
+ *	necessary.
  */

 static unsigned int ns87410_qc_issue_prot(struct ata_queued_cmd *qc)
diff --git a/drivers/ata/pata_oldpiix.c b/drivers/ata/pata_oldpiix.c
index 4d75d32..3606db1 100644
--- a/drivers/ata/pata_oldpiix.c
+++ b/drivers/ata/pata_oldpiix.c
@@ -199,7 +199,7 @@ static void oldpiix_set_dmamode (struct ata_port *ap, struct ata_device *adev)
  *
  *	Called when the libata layer is about to issue a command. We wrap
  *	this interface so that we can load the correct ATA timings if
- *	neccessary. Our logic also clears TIME0/TIME1 for the other device so
+ *	necessary. Our logic also clears TIME0/TIME1 for the other device so
  *	that, even if we get this wrong, cycles to the other device will
  *	be made PIO0.
  */
diff --git a/drivers/ata/pata_radisys.c b/drivers/ata/pata_radisys.c
index 1c54673..62b6147 100644
--- a/drivers/ata/pata_radisys.c
+++ b/drivers/ata/pata_radisys.c
@@ -161,7 +161,7 @@ static void radisys_set_dmamode (struct ata_port *ap, struct ata_device *adev)
  *
  *	Called when the libata layer is about to issue a command. We wrap
  *	this interface so that we can load the correct ATA timings if
- *	neccessary. Our logic also clears TIME0/TIME1 for the other device so
+ *	necessary. Our logic also clears TIME0/TIME1 for the other device so
  *	that, even if we get this wrong, cycles to the other device will
  *	be made PIO0.
  */
diff --git a/drivers/ata/pata_sc1200.c b/drivers/ata/pata_sc1200.c
index 66e8ff4..d804ecb 100644
--- a/drivers/ata/pata_sc1200.c
+++ b/drivers/ata/pata_sc1200.c
@@ -156,7 +156,7 @@ static void sc1200_set_dmamode(struct ata_port *ap, struct ata_device *adev)
  *
  *	Called when the libata layer is about to issue a command. We wrap
  *	this interface so that we can load the correct ATA timings if
- *	neccessary.  Specifically we have a problem that there is only
+ *	necessary.  Specifically we have a problem that there is only
  *	one MWDMA/UDMA bit.
  */

diff --git a/drivers/ata/pata_sil680.c b/drivers/ata/pata_sil680.c
index a5886f0..61f3197 100644
--- a/drivers/ata/pata_sil680.c
+++ b/drivers/ata/pata_sil680.c
@@ -16,7 +16,7 @@
  *
  *	If you have strange problems with nVidia chipset systems please
  *	see the SI support documentation and update your system BIOS
- *	if neccessary
+ *	if necessary
  *
  * TODO
  *	If we know all our devices are LBA28 (or LBA28 sized)  we could use
diff --git a/drivers/ata/pata_via.c b/drivers/ata/pata_via.c
index 362beb2..d5ecd2c 100644
--- a/drivers/ata/pata_via.c
+++ b/drivers/ata/pata_via.c
@@ -384,7 +384,7 @@ static struct ata_port_operations via_port_ops_noirq = {
  *	@pdev: PCI device
  *	@flags: configuration flags
  *
- *	Set the FIFO properties for this device if neccessary. Used both on
+ *	Set the FIFO properties for this device if necessary. Used both on
  *	set up and on and the resume path
  */

diff --git a/drivers/atm/firestream.c b/drivers/atm/firestream.c
index 9c67df5..9290070 100644
--- a/drivers/atm/firestream.c
+++ b/drivers/atm/firestream.c
@@ -1589,7 +1589,7 @@ static irqreturn_t fs_irq (int irq, void *dev_id)

 	/* print the bits in the ISR register. */
 	if (fs_debug & FS_DEBUG_IRQ) {
-		/* The FS_DEBUG things are unneccesary here. But this way it is
+		/* The FS_DEBUG things are unnecessary here. But this way it is
 		   clear for grep that these are debug prints. */
 		fs_dprintk (FS_DEBUG_IRQ,  "IRQ status:");
 		for (i=0;i<27;i++)
diff --git a/drivers/block/rd.c b/drivers/block/rd.c
index a1512da..3f201da 100644
--- a/drivers/block/rd.c
+++ b/drivers/block/rd.c
@@ -365,7 +365,7 @@ static int rd_open(struct inode *inode, struct file *filp)
 		/*
 		 * Deep badness.  rd_blkdev_pagecache_IO() needs to allocate
 		 * pagecache pages within a request_fn.  We cannot recur back
-		 * into the filesytem which is mounted atop the ramdisk, because
+		 * into the filesystem which is mounted atop the ramdisk, because
 		 * that would deadlock on fs locks.  And we really don't want
 		 * to reenter rd_blkdev_pagecache_IO when we're already within
 		 * that function.
diff --git a/drivers/char/n_tty.c b/drivers/char/n_tty.c
index b3d4ccc..924b2c6 100644
--- a/drivers/char/n_tty.c
+++ b/drivers/char/n_tty.c
@@ -428,7 +428,7 @@ static inline void finish_erasing(struct tty_struct *tty)
  *	@c: character input
  *	@tty: terminal device
  *
- *	Perform erase and neccessary output when an erase character is
+ *	Perform erase and necessary output when an erase character is
  *	present in the stream from the driver layer. Handles the complexities
  *	of UTF-8 multibyte symbols.
  */
@@ -648,7 +648,7 @@ static inline void n_tty_receive_overrun(struct tty_struct *tty)
  *	@c: character
  *
  *	Process a parity error and queue the right data to indicate
- *	the error case if neccessary. Locking as per n_tty_receive_buf.
+ *	the error case if necessary. Locking as per n_tty_receive_buf.
  */
 static inline void n_tty_receive_parity_error(struct tty_struct *tty,
 					      unsigned char c)
diff --git a/drivers/char/rocket.c b/drivers/char/rocket.c
index a3fd7e7..f2ad19d 100644
--- a/drivers/char/rocket.c
+++ b/drivers/char/rocket.c
@@ -562,7 +562,7 @@ static void rp_do_poll(unsigned long dummy)
 		/*  Get a ptr to the board's control struct */
 		ctlp = sCtlNumToCtlPtr(ctrl);

-		/*  Get the interupt status from the board */
+		/*  Get the interrupt status from the board */
 #ifdef CONFIG_PCI
 		if (ctlp->BusType = isPCI)
 			CtlMask = sPCIGetControllerIntStatus(ctlp);
diff --git a/drivers/char/tty_io.c b/drivers/char/tty_io.c
index fe62c21..12e2550 100644
--- a/drivers/char/tty_io.c
+++ b/drivers/char/tty_io.c
@@ -890,7 +890,7 @@ EXPORT_SYMBOL_GPL(tty_ldisc_deref);
  *	@tty: terminal to activate ldisc on
  *
  *	Set the TTY_LDISC flag when the line discipline can be called
- *	again. Do neccessary wakeups for existing sleepers.
+ *	again. Do necessary wakeups for existing sleepers.
  *
  *	Note: nobody should set this bit except via this function. Clearing
  *	directly is allowed.
@@ -1443,7 +1443,7 @@ EXPORT_SYMBOL(tty_hangup);
  *
  *	The user has asked via system call for the terminal to be hung up.
  *	We do this synchronously so that when the syscall returns the process
- *	is complete. That guarantee is neccessary for security reasons.
+ *	is complete. That guarantee is necessary for security reasons.
  */

 void tty_vhangup(struct tty_struct * tty)
@@ -1621,7 +1621,7 @@ EXPORT_SYMBOL(stop_tty);
  *	@tty: tty to start
  *
  *	Start a tty that has been stopped if at all possible. Perform
- *	any neccessary wakeups and propagate the TIOCPKT status. If this
+ *	any necessary wakeups and propagate the TIOCPKT status. If this
  *	is the tty was previous stopped and is being started then the
  *	driver start method is invoked and the line discipline woken.
  *
@@ -2793,7 +2793,7 @@ static int tty_fasync(int fd, struct file * filp, int on)
  *	@tty: tty to fake input into
  *	@p: pointer to character
  *
- *	Fake input to a tty device. Does the neccessary locking and
+ *	Fake input to a tty device. Does the necessary locking and
  *	input management.
  *
  *	FIXME: does not honour flow control ??
diff --git a/drivers/char/tty_ioctl.c b/drivers/char/tty_ioctl.c
index fd471cb..f876eac 100644
--- a/drivers/char/tty_ioctl.c
+++ b/drivers/char/tty_ioctl.c
@@ -398,7 +398,7 @@ static void change_termios(struct tty_struct * tty, struct ktermios * new_termio
  *	@arg: user data
  *	@opt: option information
  *
- *	Helper function to prepare termios data and run neccessary other
+ *	Helper function to prepare termios data and run necessary other
  *	functions before using change_termios to do the actual changes.
  *
  *	Locking:
diff --git a/drivers/ide/ide-tape.c b/drivers/ide/ide-tape.c
index e82bfa5..19b5f8e 100644
--- a/drivers/ide/ide-tape.c
+++ b/drivers/ide/ide-tape.c
@@ -565,7 +565,7 @@ typedef struct os_dat_s {
  *	The following parameter is used to select the point in the internal
  *	tape fifo in which we will start to refill the buffer. Decreasing
  *	the following parameter will improve the system's latency and
- *	interactive response, while using a high value might improve sytem
+ *	interactive response, while using a high value might improve system
  *	throughput.
  */
 #define IDETAPE_FIFO_THRESHOLD 		2
diff --git a/drivers/ide/pci/it821x.c b/drivers/ide/pci/it821x.c
index 442f658..b959e38 100644
--- a/drivers/ide/pci/it821x.c
+++ b/drivers/ide/pci/it821x.c
@@ -95,7 +95,7 @@ struct it821x_dev

 /*
  *	We allow users to force the card into non raid mode without
- *	flashing the alternative BIOS. This is also neccessary right now
+ *	flashing the alternative BIOS. This is also necessary right now
  *	for embedded platforms that cannot run a PC BIOS but are using this
  *	device.
  */
@@ -649,7 +649,7 @@ static void __devinit init_hwif_it821x(ide_hwif_t *hwif)

 	/*
 	 *	Not in the docs but according to the reference driver
-	 *	this is neccessary.
+	 *	this is necessary.
 	 */

 	pci_read_config_byte(hwif->pci_dev, 0x08, &conf);
diff --git a/drivers/ide/pci/siimage.c b/drivers/ide/pci/siimage.c
index d09e74c..f232647 100644
--- a/drivers/ide/pci/siimage.c
+++ b/drivers/ide/pci/siimage.c
@@ -25,7 +25,7 @@
  *
  *	If you have strange problems with nVidia chipset systems please
  *	see the SI support documentation and update your system BIOS
- *	if neccessary
+ *	if necessary
  *
  *  The Dell DRAC4 has some interesting features including effectively hot
  *  unplugging/replugging the virtual CD interface when the DRAC is reset.
diff --git a/drivers/input/touchscreen/usbtouchscreen.c b/drivers/input/touchscreen/usbtouchscreen.c
index 8e18e6c..6d9385a 100644
--- a/drivers/input/touchscreen/usbtouchscreen.c
+++ b/drivers/input/touchscreen/usbtouchscreen.c
@@ -345,8 +345,8 @@ static int gunze_read_data(struct usbtouch_usb *dev, unsigned char *pkt)
  * DMC TSC-10/25 Part
  *
  * Documentation about the controller and it's protocol can be found at
- *   http://www.dmccoltd.com/files/controler/tsc10usb_pi_e.pdf
- *   http://www.dmccoltd.com/files/controler/tsc25_usb_e.pdf
+ *   http://www.dmccoltd.com/files/controller/tsc10usb_pi_e.pdf
+ *   http://www.dmccoltd.com/files/controller/tsc25_usb_e.pdf
  */
 #ifdef CONFIG_USB_TOUCHSCREEN_DMC_TSC10

diff --git a/drivers/md/dm-crypt.c b/drivers/md/dm-crypt.c
index 7b0fcfc..829727a 100644
--- a/drivers/md/dm-crypt.c
+++ b/drivers/md/dm-crypt.c
@@ -112,7 +112,7 @@ static void clone_init(struct crypt_io *, struct bio *);
  * Different IV generation algorithms:
  *
  * plain: the initial vector is the 32-bit little-endian version of the sector
- *        number, padded with zeros if neccessary.
+ *        number, padded with zeros if necessary.
  *
  * essiv: "encrypted sector|salt initial vector", the sector number is
  *        encrypted with the bulk cipher using a salt as key. The salt
diff --git a/drivers/media/dvb/bt8xx/bt878.c b/drivers/media/dvb/bt8xx/bt878.c
index df72b4b..58a2959 100644
--- a/drivers/media/dvb/bt8xx/bt878.c
+++ b/drivers/media/dvb/bt8xx/bt878.c
@@ -281,7 +281,7 @@ static irqreturn_t bt878_irq(int irq, void *dev_id)
 		if (!(astat = (stat & mask)))
 			return IRQ_NONE;	/* this interrupt is not for me */
 /*		dprintk("bt878(%d) debug: irq count %d, stat 0x%8.8x, mask 0x%8.8x\n",bt->nr,count,stat,mask); */
-		btwrite(astat, BT878_AINT_STAT);	/* try to clear interupt condition */
+		btwrite(astat, BT878_AINT_STAT);	/* try to clear interrupt condition */


 		if (astat & (BT878_ASCERR | BT878_AOCERR)) {
diff --git a/drivers/media/dvb/ttusb-budget/dvb-ttusb-budget.c b/drivers/media/dvb/ttusb-budget/dvb-ttusb-budget.c
index b60cdc9..238db63 100644
--- a/drivers/media/dvb/ttusb-budget/dvb-ttusb-budget.c
+++ b/drivers/media/dvb/ttusb-budget/dvb-ttusb-budget.c
@@ -129,7 +129,7 @@ struct ttusb {
 	struct dvb_frontend* fe;
 };

-/* ugly workaround ... don't know why it's neccessary to read */
+/* ugly workaround ... don't know why it's necessary to read */
 /* all result codes. */

 #define DEBUG 0
diff --git a/drivers/media/video/bt8xx/bttv-cards.c b/drivers/media/video/bt8xx/bttv-cards.c
index 6b31e50..bb8c8ec 100644
--- a/drivers/media/video/bt8xx/bttv-cards.c
+++ b/drivers/media/video/bt8xx/bttv-cards.c
@@ -4617,18 +4617,18 @@ adtvk503_audio(struct bttv *btv, struct video_audio *v, int set)
  *
  * The board hardwire Y0 (xpoint) to MUX1 and MUXOUT to Yin.
  * GPIO pins are wired as:
- *  GPIO[0:3] - AX[0:3] (xpoint) - P1[0:3] (microcontroler)
- *  GPIO[4:6] - AY[0:2] (xpoint) - P1[4:6] (microcontroler)
- *  GPIO[7]   - DATA (xpoint)    - P1[7] (microcontroler)
- *  GPIO[8]   -                  - P3[5] (microcontroler)
- *  GPIO[9]   - RESET (xpoint)   - P3[6] (microcontroler)
- *  GPIO[10]  - STROBE (xpoint)  - P3[7] (microcontroler)
- *  GPINTR    -                  - P3[4] (microcontroler)
+ *  GPIO[0:3] - AX[0:3] (xpoint) - P1[0:3] (microcontroller)
+ *  GPIO[4:6] - AY[0:2] (xpoint) - P1[4:6] (microcontroller)
+ *  GPIO[7]   - DATA (xpoint)    - P1[7] (microcontroller)
+ *  GPIO[8]   -                  - P3[5] (microcontroller)
+ *  GPIO[9]   - RESET (xpoint)   - P3[6] (microcontroller)
+ *  GPIO[10]  - STROBE (xpoint)  - P3[7] (microcontroller)
+ *  GPINTR    -                  - P3[4] (microcontroller)
  *
- * The microcontroler is a 80C32 like. It should be possible to change xpoint
- * configuration either directly (as we are doing) or using the microcontroler
+ * The microcontroller is a 80C32 like. It should be possible to change xpoint
+ * configuration either directly (as we are doing) or using the microcontroller
  * which is also wired to I2C interface. I have no further info on the
- * microcontroler features, one would need to disassembly the firmware.
+ * microcontroller features, one would need to disassembly the firmware.
  * note: the vendor refused to give any information on this product, all
  *       that stuff was found using a multimeter! :)
  */
@@ -4696,7 +4696,7 @@ static void tibetCS16_init(struct bttv *btv)
  * The analog switch is controlled by the "master", but the detection order
  * of the four BT878A chips is in an order which I just don't understand.
  * The "master" is actually the second controller to be detected.  The
- * logic on the board uses logical numbers for the 4 controlers, but
+ * logic on the board uses logical numbers for the 4 controllers, but
  * those numbers are different from the detection sequence.  When working
  * with the analog switch, we need to "map" from the detection sequence
  * over to the board's logical controller number.  This mapping sequence
diff --git a/drivers/media/video/em28xx/em28xx-video.c b/drivers/media/video/em28xx/em28xx-video.c
index 2c7b158..862f3b3 100644
--- a/drivers/media/video/em28xx/em28xx-video.c
+++ b/drivers/media/video/em28xx/em28xx-video.c
@@ -911,7 +911,7 @@ static int em28xx_set_fmt(struct em28xx *dev, unsigned int cmd, struct v4l2_form

 	/* stop io in case it is already in progress */
 	if (dev->stream = STREAM_ON) {
-		em28xx_videodbg("VIDIOC_SET_FMT: interupting stream\n");
+		em28xx_videodbg("VIDIOC_SET_FMT: interrupting stream\n");
 		if ((ret = em28xx_stream_interrupt(dev)))
 			return ret;
 	}
diff --git a/drivers/misc/sony-laptop.c b/drivers/misc/sony-laptop.c
index 8ee0321..92bfb1a 100644
--- a/drivers/misc/sony-laptop.c
+++ b/drivers/misc/sony-laptop.c
@@ -196,7 +196,7 @@ static void do_sony_laptop_release_key(struct work_struct *work)
 static DECLARE_WORK(sony_laptop_release_key_work,
 		do_sony_laptop_release_key);

-/* forward event to the input subsytem */
+/* forward event to the input subsystem */
 static void sony_laptop_report_input_event(u8 event)
 {
 	struct input_dev *jog_dev = sony_laptop_input.jog_dev;
diff --git a/drivers/net/amd8111e.c b/drivers/net/amd8111e.c
index 675fe91..0901199 100644
--- a/drivers/net/amd8111e.c
+++ b/drivers/net/amd8111e.c
@@ -1116,7 +1116,7 @@ static struct net_device_stats *amd8111e_get_stats(struct net_device * dev)

 	return new_stats;
 }
-/* This function recalculate the interupt coalescing  mode on every interrupt
+/* This function recalculate the interrupt coalescing  mode on every interrupt
 according to the datarate and the packet rate.
 */
 static int amd8111e_calc_coalesce(struct net_device *dev)
@@ -1288,7 +1288,7 @@ static irqreturn_t amd8111e_interrupt(int irq, void *dev_id)
 #ifdef CONFIG_AMD8111E_NAPI
 	if(intr0 & RINT0){
 		if(netif_rx_schedule_prep(dev)){
-			/* Disable receive interupts */
+			/* Disable receive interrupts */
 			writel(RINTEN0, mmio + INTEN0);
 			/* Schedule a polling routine */
 			__netif_rx_schedule(dev);
diff --git a/drivers/net/atari_pamsnet.c b/drivers/net/atari_pamsnet.c
index 5471440..1c0b1eb 100644
--- a/drivers/net/atari_pamsnet.c
+++ b/drivers/net/atari_pamsnet.c
@@ -551,7 +551,7 @@ bad:

 /* The following higher level routines work on virtual addresses and convert them to
  * physical addresses when passed to the lowlevel routines. It's up to the higher level
- * routines to copy data from Alternate RAM to ST RAM if neccesary!
+ * routines to copy data from Alternate RAM to ST RAM if necessary!
  */

 /* Check for a network adaptor of this type, and return '0' if one exists.
diff --git a/drivers/net/au1000_eth.c b/drivers/net/au1000_eth.c
index c39ab80..e9c96d3 100644
--- a/drivers/net/au1000_eth.c
+++ b/drivers/net/au1000_eth.c
@@ -545,7 +545,7 @@ static struct {
 static int num_ifs;

 /*
- * Setup the base address and interupt of the Au1xxx ethernet macs
+ * Setup the base address and interrupt of the Au1xxx ethernet macs
  * based on cpu type and whether the interface is enabled in sys_pinfunc
  * register. The last interface is enabled if SYS_PF_NI2 (bit 4) is 0.
  */
diff --git a/drivers/net/bonding/bond_sysfs.c b/drivers/net/bonding/bond_sysfs.c
index a122baa..cb694a3 100644
--- a/drivers/net/bonding/bond_sysfs.c
+++ b/drivers/net/bonding/bond_sysfs.c
@@ -55,7 +55,7 @@ static int expected_refcount = -1;
 static struct class *netdev_class;
 /*--------------------------- Data Structures -----------------------------*/

-/* Bonding sysfs lock.  Why can't we just use the subsytem lock?
+/* Bonding sysfs lock.  Why can't we just use the subsystem lock?
  * Because kobject_register tries to acquire the subsystem lock.  If
  * we already hold the lock (which we would if the user was creating
  * a new bond through the sysfs interface), we deadlock.
diff --git a/drivers/net/e100.c b/drivers/net/e100.c
index 6169663..c63808a 100644
--- a/drivers/net/e100.c
+++ b/drivers/net/e100.c
@@ -1313,7 +1313,7 @@ static inline int e100_exec_cb_wait(struct nic *nic, struct sk_buff *skb,
 		if (!--counter) break;
 	}

-	/* ack any interupts, something could have been set */
+	/* ack any interrupts, something could have been set */
 	iowrite8(~0, &nic->csr->scb.stat_ack);

 	/* if the command failed, or is not OK, notify and return */
diff --git a/drivers/net/eepro100.c b/drivers/net/eepro100.c
index 9800341..5ae0c40 100644
--- a/drivers/net/eepro100.c
+++ b/drivers/net/eepro100.c
@@ -22,7 +22,7 @@
 	2000 Mar 24  Dragan Stancevic <visitor@valinux.com>
 		Disabled FC and ER, to avoid lockups when when we get FCP interrupts.
 	2000 Jul 17 Goutham Rao <goutham.rao@intel.com>
-		PCI DMA API fixes, adding pci_dma_sync_single calls where neccesary
+		PCI DMA API fixes, adding pci_dma_sync_single calls where necessary
 	2000 Aug 31 David Mosberger <davidm@hpl.hp.com>
 		rx_align support: enables rx DMA without causing unaligned accesses.
 */
diff --git a/drivers/net/irda/donauboe.c b/drivers/net/irda/donauboe.c
index 3ca47bf..b873847 100644
--- a/drivers/net/irda/donauboe.c
+++ b/drivers/net/irda/donauboe.c
@@ -595,7 +595,7 @@ toshoboe_startchip (struct toshoboe_cb *self)
   OUTB ((physaddr >> 18) & 0xff, OBOE_RING_BASE1);
   OUTB ((physaddr >> 26) & 0x3f, OBOE_RING_BASE2);

-  /*Enable DMA controler in byte mode and RX */
+  /*Enable DMA controller in byte mode and RX */
   OUTB (CONFIG0H_DMA_ON, OBOE_CONFIG0H);

   /* Start up the clocks */
diff --git a/drivers/net/irda/donauboe.h b/drivers/net/irda/donauboe.h
index 1e67720..9db3cce 100644
--- a/drivers/net/irda/donauboe.h
+++ b/drivers/net/irda/donauboe.h
@@ -30,7 +30,7 @@
  *     or the type-DO IR port.
  *
  * IrDA chip set list from Toshiba Computer Engineering Corp.
- * model			method	maker	controler		Version
+ * model			method	maker	controller		Version
  * Portege 320CT	FIR,SIR Toshiba Oboe(Triangle)
  * Portege 3010CT	FIR,SIR Toshiba Oboe(Sydney)
  * Portege 3015CT	FIR,SIR Toshiba Oboe(Sydney)
diff --git a/drivers/net/sk98lin/h/skdrv1st.h b/drivers/net/sk98lin/h/skdrv1st.h
index 91b8d4f..6c21d19 100644
--- a/drivers/net/sk98lin/h/skdrv1st.h
+++ b/drivers/net/sk98lin/h/skdrv1st.h
@@ -27,7 +27,7 @@
  * Description:
  *
  * This is the first include file of the driver, which includes all
- * neccessary system header files and some of the GEnesis header files.
+ * necessary system header files and some of the GEnesis header files.
  * It also defines some basic items.
  *
  * Include File Hierarchy:
diff --git a/drivers/net/sk98lin/h/skdrv2nd.h b/drivers/net/sk98lin/h/skdrv2nd.h
index 3fa6717..f3a6373 100644
--- a/drivers/net/sk98lin/h/skdrv2nd.h
+++ b/drivers/net/sk98lin/h/skdrv2nd.h
@@ -27,7 +27,7 @@
  * Description:
  *
  * This is the second include file of the driver, which includes all other
- * neccessary files and defines all structures and constants used by the
+ * necessary files and defines all structures and constants used by the
  * driver and the common modules.
  *
  * Include File Hierarchy:
diff --git a/drivers/net/smc911x.c b/drivers/net/smc911x.c
index 81f2484..a7cd828 100644
--- a/drivers/net/smc911x.c
+++ b/drivers/net/smc911x.c
@@ -1231,7 +1231,7 @@ static irqreturn_t smc911x_interrupt(int irq, void *dev_id)
 		}
 #endif

-		/* Handle PHY interupt condition */
+		/* Handle PHY interrupt condition */
 		if (status & INT_STS_PHY_INT_) {
 			DBG(SMC_DEBUG_MISC, "%s: PHY irq\n", dev->name);
 			smc911x_phy_interrupt(dev);
diff --git a/drivers/net/spider_net.c b/drivers/net/spider_net.c
index c15e972..3e497c6 100644
--- a/drivers/net/spider_net.c
+++ b/drivers/net/spider_net.c
@@ -1558,7 +1558,7 @@ spider_net_handle_error_irq(struct spider_net_card *card, u32 status_reg)

 /**
  * spider_net_interrupt - interrupt handler for spider_net
- * @irq: interupt number
+ * @irq: interrupt number
  * @ptr: pointer to net_device
  * @regs: PU registers
  *
diff --git a/drivers/net/tc35815.c b/drivers/net/tc35815.c
index 463d600..e097e82 100644
--- a/drivers/net/tc35815.c
+++ b/drivers/net/tc35815.c
@@ -1610,7 +1610,7 @@ tc35815_rx(struct net_device *dev)
 					panic_queues(dev);
 				}
 #endif
-				/* pass BD to controler */
+				/* pass BD to controller */
 #ifndef TC35815_USE_PACKEDBUFFER
 				if (!lp->rx_skbs[curid].skb) {
 					lp->rx_skbs[curid].skb @@ -1650,7 +1650,7 @@ tc35815_rx(struct net_device *dev)
 		}
 #endif
 		for (i = 0; i < (bd_count + 1) / 2 + 1; i++) {
-			/* pass FD to controler */
+			/* pass FD to controller */
 #ifdef DEBUG
 			lp->rfd_cur->fd.FDNext = cpu_to_le32(0xdeaddead);
 #else
diff --git a/drivers/net/via-velocity.c b/drivers/net/via-velocity.c
index 25b75b6..ec695ff 100644
--- a/drivers/net/via-velocity.c
+++ b/drivers/net/via-velocity.c
@@ -1483,7 +1483,7 @@ static int velocity_alloc_rx_buf(struct velocity_info *vptr, int idx)
  *
  *	Scan the queues looking for transmitted packets that
  *	we can complete and clean up. Update any statistics as
- *	neccessary/
+ *	necessary/
  */

 static int velocity_tx_srv(struct velocity_info *vptr, u32 status)
diff --git a/drivers/pci/hotplug/cpqphp_core.c b/drivers/pci/hotplug/cpqphp_core.c
index 5617cfd..5c16326 100644
--- a/drivers/pci/hotplug/cpqphp_core.c
+++ b/drivers/pci/hotplug/cpqphp_core.c
@@ -831,7 +831,7 @@ static int cpqhpc_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 		goto err_disable_device;
 	}

-	/* Check for the proper subsytem ID's
+	/* Check for the proper subsystem ID's
 	 * Intel uses a different SSID programming model than Compaq.
 	 * For Intel, each SSID bit identifies a PHP capability.
 	 * Also Intel HPC's may have RID=0.
diff --git a/drivers/s390/block/dasd_3990_erp.c b/drivers/s390/block/dasd_3990_erp.c
index 8b9d68f..69402f3 100644
--- a/drivers/s390/block/dasd_3990_erp.c
+++ b/drivers/s390/block/dasd_3990_erp.c
@@ -2001,7 +2001,7 @@ dasd_3990_erp_compound_code(struct dasd_ccw_req * erp, char *sense)
 		switch (sense[28]) {
 		case 0x17:
 			/* issue a Diagnostic Control command with an
-			 * Inhibit Write subcommand and controler modifier */
+			 * Inhibit Write subcommand and controller modifier */
 			erp = dasd_3990_erp_DCTL(erp, 0x20);
 			break;

diff --git a/drivers/s390/char/sclp_cpi.c b/drivers/s390/char/sclp_cpi.c
index 29fe2a5..82a13d9 100644
--- a/drivers/s390/char/sclp_cpi.c
+++ b/drivers/s390/char/sclp_cpi.c
@@ -157,7 +157,7 @@ cpi_prepare_req(void)
 	sclp_ascebc_str(evb->system_name, CPI_LENGTH_SYSTEM_NAME);
 	EBC_TOUPPER(evb->system_name, CPI_LENGTH_SYSTEM_NAME);

-	/* set sytem level */
+	/* set system level */
 	evb->system_level = LINUX_VERSION_CODE;

 	/* set sysplex name */
diff --git a/drivers/scsi/aacraid/aacraid.h b/drivers/scsi/aacraid/aacraid.h
index 45ca3e8..a97034e 100644
--- a/drivers/scsi/aacraid/aacraid.h
+++ b/drivers/scsi/aacraid/aacraid.h
@@ -1508,7 +1508,7 @@ struct aac_mntent {
 	__le32			capacityhigh;
 };

-#define FSCS_NOTCLEAN	0x0001  /* fsck is neccessary before mounting */
+#define FSCS_NOTCLEAN	0x0001  /* fsck is necessary before mounting */
 #define FSCS_READONLY	0x0002	/* possible result of broken mirror */
 #define FSCS_HIDDEN	0x0004	/* should be ignored - set during a clear */

diff --git a/drivers/scsi/aic7xxx/cam.h b/drivers/scsi/aic7xxx/cam.h
index 26f17e3..687aef6 100644
--- a/drivers/scsi/aic7xxx/cam.h
+++ b/drivers/scsi/aic7xxx/cam.h
@@ -48,7 +48,7 @@ typedef enum {
 	CAM_REQ_ABORTED,	/* CCB request aborted by the host */
 	CAM_UA_ABORT,		/* Unable to abort CCB request */
 	CAM_REQ_CMP_ERR,	/* CCB request completed with an error */
-	CAM_BUSY,		/* CAM subsytem is busy */
+	CAM_BUSY,		/* CAM subsystem is busy */
 	CAM_REQ_INVALID,	/* CCB request was invalid */
 	CAM_PATH_INVALID,	/* Supplied Path ID is invalid */
 	CAM_SEL_TIMEOUT,	/* Target Selection Timeout */
diff --git a/drivers/scsi/dc395x.c b/drivers/scsi/dc395x.c
index 564ea90..b1c1592 100644
--- a/drivers/scsi/dc395x.c
+++ b/drivers/scsi/dc395x.c
@@ -1821,12 +1821,12 @@ static irqreturn_t dc395x_interrupt(int irq, void *dev_id)
 	irqreturn_t handled = IRQ_NONE;

 	/*
-	 * Check for pending interupt
+	 * Check for pending interrupt
 	 */
 	scsi_status = DC395x_read16(acb, TRM_S1040_SCSI_STATUS);
 	dma_status = DC395x_read8(acb, TRM_S1040_DMA_STATUS);
 	if (scsi_status & SCSIINTERRUPT) {
-		/* interupt pending - let's process it! */
+		/* interrupt pending - let's process it! */
 		dc395x_handle_interrupt(acb, scsi_status);
 		handled = IRQ_HANDLED;
 	}
@@ -4622,7 +4622,7 @@ static void adapter_uninit_chip(struct AdapterCtlBlk *acb)
 	if (acb->config & HCC_SCSI_RESET)
 		reset_scsi_bus(acb);

-	/* clear any pending interupt state */
+	/* clear any pending interrupt state */
 	DC395x_read8(acb, TRM_S1040_SCSI_INTSTATUS);
 }

diff --git a/drivers/scsi/megaraid/megaraid_mbox.c b/drivers/scsi/megaraid/megaraid_mbox.c
index 04d0b69..c986323 100644
--- a/drivers/scsi/megaraid/megaraid_mbox.c
+++ b/drivers/scsi/megaraid/megaraid_mbox.c
@@ -426,7 +426,7 @@ megaraid_exit(void)
  * @id		: pci device id of the class of controllers
  *
  * This routine should be called whenever a new adapter is detected by the
- * PCI hotplug susbsytem.
+ * PCI hotplug susbsystem.
  */
 static int __devinit
 megaraid_probe_one(struct pci_dev *pdev, const struct pci_device_id *id)
diff --git a/drivers/scsi/qla4xxx/ql4_init.c b/drivers/scsi/qla4xxx/ql4_init.c
index 6365df2..5075d34 100644
--- a/drivers/scsi/qla4xxx/ql4_init.c
+++ b/drivers/scsi/qla4xxx/ql4_init.c
@@ -987,7 +987,7 @@ int ql4xxx_lock_drvr_wait(struct scsi_qla_host *ha)
  * qla4xxx_start_firmware - starts qla4xxx firmware
  * @ha: Pointer to host adapter structure.
  *
- * This routine performs the neccessary steps to start the firmware for
+ * This routine performs the necessary steps to start the firmware for
  * the QLA4010 adapter.
  **/
 static int qla4xxx_start_firmware(struct scsi_qla_host *ha)
diff --git a/drivers/scsi/sd.c b/drivers/scsi/sd.c
index 00e4666..a316d7f 100644
--- a/drivers/scsi/sd.c
+++ b/drivers/scsi/sd.c
@@ -650,7 +650,7 @@ static int sd_getgeo(struct block_device *bdev, struct hd_geometry *geo)
  *	success as well). Returns a negated errno value in case of error.
  *
  *	Note: most ioctls are forward onto the block subsystem or further
- *	down in the scsi subsytem.
+ *	down in the scsi subsystem.
  **/
 static int sd_ioctl(struct inode * inode, struct file * filp,
 		    unsigned int cmd, unsigned long arg)
diff --git a/drivers/spi/mpc52xx_psc_spi.c b/drivers/spi/mpc52xx_psc_spi.c
index 052359f..447d09e 100644
--- a/drivers/spi/mpc52xx_psc_spi.c
+++ b/drivers/spi/mpc52xx_psc_spi.c
@@ -181,7 +181,7 @@ static int mpc52xx_psc_spi_transfer_rxtx(struct spi_device *spi,
 		}


-		/* enable interupts and wait for wake up
+		/* enable interrupts and wait for wake up
 		 * if just one byte is expected the Rx FIFO genererates no
 		 * FFULL interrupt, so activate the RxRDY interrupt
 		 */
diff --git a/drivers/usb/host/ehci-hub.c b/drivers/usb/host/ehci-hub.c
index f4d301b..90a2eb4 100644
--- a/drivers/usb/host/ehci-hub.c
+++ b/drivers/usb/host/ehci-hub.c
@@ -357,7 +357,7 @@ ehci_hub_status_data (struct usb_hcd *hcd, char *buf)

 	/* Some boards (mostly VIA?) report bogus overcurrent indications,
 	 * causing massive log spam unless we completely ignore them.  It
-	 * may be relevant that VIA VT8235 controlers, where PORT_POWER is
+	 * may be relevant that VIA VT8235 controllers, where PORT_POWER is
 	 * always set, seem to clear PORT_OCC and PORT_CSC when writing to
 	 * PORT_POWER; that's surprising, but maybe within-spec.
 	 */
diff --git a/drivers/usb/host/sl811-hcd.c b/drivers/usb/host/sl811-hcd.c
index 4cfa3ff..b03cc06 100644
--- a/drivers/usb/host/sl811-hcd.c
+++ b/drivers/usb/host/sl811-hcd.c
@@ -1576,7 +1576,7 @@ sl811h_start(struct usb_hcd *hcd)
 		hcd->power_budget = sl811->board->power * 2;
 	}

-	/* enable power and interupts */
+	/* enable power and interrupts */
 	port_power(sl811, 1);

 	return 0;
diff --git a/fs/jfs/jfs_dtree.c b/fs/jfs/jfs_dtree.c
index 6d62f32..43ee597 100644
--- a/fs/jfs/jfs_dtree.c
+++ b/fs/jfs/jfs_dtree.c
@@ -773,7 +773,7 @@ int dtSearch(struct inode *ip, struct component_name * key, ino_t * data,
 	      getChild:
 		/* update max. number of pages to split */
 		if (BT_STACK_FULL(btstack)) {
-			/* Something's corrupted, mark filesytem dirty so
+			/* Something's corrupted, mark filesystem dirty so
 			 * chkdsk will fix it.
 			 */
 			jfs_error(sb, "stack overrun in dtSearch!");
diff --git a/fs/ocfs2/dcache.c b/fs/ocfs2/dcache.c
index 014e739..3094ddb 100644
--- a/fs/ocfs2/dcache.c
+++ b/fs/ocfs2/dcache.c
@@ -376,7 +376,7 @@ out:
  * directory locks. The dentries have already been deleted on other
  * nodes via ocfs2_remote_dentry_delete().
  *
- * Normally, the VFS handles the d_move() for the file sytem, after
+ * Normally, the VFS handles the d_move() for the file system, after
  * the ->rename() callback. OCFS2 wants to handle this internally, so
  * the new lock can be created atomically with respect to the cluster.
  */
diff --git a/fs/reiserfs/super.c b/fs/reiserfs/super.c
index c776214..8895b7c 100644
--- a/fs/reiserfs/super.c
+++ b/fs/reiserfs/super.c
@@ -306,7 +306,7 @@ static int finish_unfinished(struct super_block *s)

 /* to protect file being unlinked from getting lost we "safe" link files
    being unlinked. This link will be deleted in the same transaction with last
-   item of file. mounting the filesytem we scan all these links and remove
+   item of file. mounting the filesystem we scan all these links and remove
    files which almost got lost */
 void add_save_link(struct reiserfs_transaction_handle *th,
 		   struct inode *inode, int truncate)
diff --git a/fs/super.c b/fs/super.c
index 5260d62..86a0a20 100644
--- a/fs/super.c
+++ b/fs/super.c
@@ -420,7 +420,7 @@ restart:
 }

 /*
- * Call the ->sync_fs super_op against all filesytems which are r/w and
+ * Call the ->sync_fs super_op against all filesystems which are r/w and
  * which implement it.
  *
  * This operation is careful to avoid the livelock which could easily happen
@@ -428,7 +428,7 @@ restart:
  * is used only here.  We set it against all filesystems and then clear it as
  * we sync them.  So redirtied filesystems are skipped.
  *
- * But if process A is currently running sync_filesytems and then process B
+ * But if process A is currently running sync_filesystems and then process B
  * calls sync_filesystems as well, process B will set all the s_need_sync_fs
  * flags again, which will cause process A to resync everything.  Fix that with
  * a local mutex.
diff --git a/include/asm-arm/dma-mapping.h b/include/asm-arm/dma-mapping.h
index c8b5d0d..ca27601 100644
--- a/include/asm-arm/dma-mapping.h
+++ b/include/asm-arm/dma-mapping.h
@@ -401,7 +401,7 @@ extern void dma_sync_sg_for_device(struct device*, struct scatterlist*, int, enu
  *
  * On the SA-1111, a bug limits DMA to only certain regions of RAM.
  * On the IXP425, the PCI inbound window is 64MB (256MB total RAM)
- * On some ADI engineering sytems, PCI inbound window is 32MB (12MB total RAM)
+ * On some ADI engineering systems, PCI inbound window is 32MB (12MB total RAM)
  *
  * The following are helper functions used by the dmabounce subystem
  *
diff --git a/include/asm-mips/pci/bridge.h b/include/asm-mips/pci/bridge.h
index 0c45e75..571d024 100644
--- a/include/asm-mips/pci/bridge.h
+++ b/include/asm-mips/pci/bridge.h
@@ -538,7 +538,7 @@ typedef struct bridge_err_cmdword_s {
 		 BRIDGE_ISR_PMU_ESIZE_FAULT)

 /*
- * List of Errors which are fatal and kill the sytem
+ * List of Errors which are fatal and kill the system
  */
 #define BRIDGE_ISR_ERROR_FATAL		\
 		((BRIDGE_ISR_XTALK_ERROR & ~BRIDGE_ISR_XREAD_REQ_TIMEOUT)|\
diff --git a/include/asm-sh/se7751.h b/include/asm-sh/se7751.h
index 02ca934..b36792a 100644
--- a/include/asm-sh/se7751.h
+++ b/include/asm-sh/se7751.h
@@ -36,7 +36,7 @@
 #define PA_LED		0xba000000	/* LED */
 #define	PA_BCR		0xbb000000	/* FPGA on the MS7751SE01 */

-#define PA_MRSHPC	0xb83fffe0	/* MR-SHPC-01 PCMCIA controler */
+#define PA_MRSHPC	0xb83fffe0	/* MR-SHPC-01 PCMCIA controller */
 #define PA_MRSHPC_MW1	0xb8400000	/* MR-SHPC-01 memory window base */
 #define PA_MRSHPC_MW2	0xb8500000	/* MR-SHPC-01 attribute window base */
 #define PA_MRSHPC_IO	0xb8600000	/* MR-SHPC-01 I/O window base */
diff --git a/include/asm-sh/systemh7751.h b/include/asm-sh/systemh7751.h
index b143bb2..4161122 100644
--- a/include/asm-sh/systemh7751.h
+++ b/include/asm-sh/systemh7751.h
@@ -36,7 +36,7 @@
 #define PA_LED		0xba000000	/* LED */
 #define	PA_BCR		0xbb000000	/* FPGA on the MS7751SE01 */

-#define PA_MRSHPC	0xb83fffe0	/* MR-SHPC-01 PCMCIA controler */
+#define PA_MRSHPC	0xb83fffe0	/* MR-SHPC-01 PCMCIA controller */
 #define PA_MRSHPC_MW1	0xb8400000	/* MR-SHPC-01 memory window base */
 #define PA_MRSHPC_MW2	0xb8500000	/* MR-SHPC-01 attribute window base */
 #define PA_MRSHPC_IO	0xb8600000	/* MR-SHPC-01 I/O window base */
diff --git a/include/linux/ipmi_smi.h b/include/linux/ipmi_smi.h
index c063310..303f777 100644
--- a/include/linux/ipmi_smi.h
+++ b/include/linux/ipmi_smi.h
@@ -118,7 +118,7 @@ struct ipmi_smi_handlers
 	/* Enable/disable firmware maintenance mode.  Note that this
 	   is *not* the modes defined, this is simply an on/off
 	   setting.  The message handler does the mode handling.  Note
-	   that this is called from interupt context, so it cannot
+	   that this is called from interrupt context, so it cannot
 	   block. */
 	void (*set_maintenance_mode)(void *send_info, int enable);

diff --git a/kernel/hrtimer.c b/kernel/hrtimer.c
index 23c03f4..f7fc6ac 100644
--- a/kernel/hrtimer.c
+++ b/kernel/hrtimer.c
@@ -392,7 +392,7 @@ static int hrtimer_reprogram(struct hrtimer *timer,
 	/*
 	 * When the callback is running, we do not reprogram the clock event
 	 * device. The timer callback is either running on a different CPU or
-	 * the callback is executed in the hrtimer_interupt context. The
+	 * the callback is executed in the hrtimer_interrupt context. The
 	 * reprogramming is handled either by the softirq, which called the
 	 * callback or at the end of the hrtimer_interrupt.
 	 */
diff --git a/kernel/sched.c b/kernel/sched.c
index 799d23b..d59d9c8 100644
--- a/kernel/sched.c
+++ b/kernel/sched.c
@@ -5210,7 +5210,7 @@ wait_to_die:

 #ifdef CONFIG_HOTPLUG_CPU
 /*
- * Figure out where task on dead CPU should go, use force if neccessary.
+ * Figure out where task on dead CPU should go, use force if necessary.
  * NOTE: interrupts should be disabled by the caller
  */
 static void move_task_off_dead_cpu(int dead_cpu, struct task_struct *p)
@@ -5409,7 +5409,7 @@ migration_call(struct notifier_block *nfb, unsigned long action, void *hcpu)

 	case CPU_ONLINE:
 	case CPU_ONLINE_FROZEN:
-		/* Strictly unneccessary, as first user will wake it. */
+		/* Strictly unnecessary, as first user will wake it. */
 		wake_up_process(cpu_rq(cpu)->migration_thread);
 		break;

diff --git a/kernel/taskstats.c b/kernel/taskstats.c
index 906cae7..471142a 100644
--- a/kernel/taskstats.c
+++ b/kernel/taskstats.c
@@ -251,7 +251,7 @@ out:

 	stats->version = TASKSTATS_VERSION;
 	/*
-	 * Accounting subsytems can also add calls here to modify
+	 * Accounting subsystems can also add calls here to modify
 	 * fields of taskstats.
 	 */
 	return rc;
diff --git a/lib/kobject_uevent.c b/lib/kobject_uevent.c
index 12e311d..2419e12 100644
--- a/lib/kobject_uevent.c
+++ b/lib/kobject_uevent.c
@@ -115,7 +115,7 @@ int kobject_uevent_env(struct kobject *kobj, enum kobject_action action,
 	else
 		subsystem = kobject_name(&kset->kobj);
 	if (!subsystem) {
-		pr_debug("unset subsytem caused the event to drop!\n");
+		pr_debug("unset subsystem caused the event to drop!\n");
 		return 0;
 	}

diff --git a/mm/slub.c b/mm/slub.c
index b39c8a6..355651b 100644
--- a/mm/slub.c
+++ b/mm/slub.c
@@ -1780,7 +1780,7 @@ static struct kmem_cache_node * __init early_kmem_cache_node_alloc(gfp_t gfpflag
 	BUG_ON(kmalloc_caches->size < sizeof(struct kmem_cache_node));

 	page = new_slab(kmalloc_caches, gfpflags | GFP_THISNODE, node);
-	/* new_slab() disables interupts */
+	/* new_slab() disables interrupts */
 	local_irq_enable();

 	BUG_ON(!page);
diff --git a/net/irda/discovery.c b/net/irda/discovery.c
index f097341..49af60a 100644
--- a/net/irda/discovery.c
+++ b/net/irda/discovery.c
@@ -202,7 +202,7 @@ void irlmp_expire_discoveries(hashbin_t *log, __u32 saddr, int force)
 	/* Drop the spinlock before calling the higher layers, as
 	 * we can't guarantee they won't call us back and create a
 	 * deadlock. We will work on our own private data, so we
-	 * don't care to be interupted. - Jean II */
+	 * don't care to be interrupted. - Jean II */
 	spin_unlock_irqrestore(&log->hb_spinlock, flags);

 	if(buffer = NULL)
diff --git a/net/iucv/iucv.c b/net/iucv/iucv.c
index b733306..c4d8cce 100644
--- a/net/iucv/iucv.c
+++ b/net/iucv/iucv.c
@@ -389,7 +389,7 @@ static void iucv_block_cpu(void *data)
  * iucv_declare_cpu
  * @data: unused
  *
- * Declare a interupt buffer on this cpu.
+ * Declare a interrupt buffer on this cpu.
  */
 static void iucv_declare_cpu(void *data)
 {
diff --git a/net/netfilter/xt_CONNMARK.c b/net/netfilter/xt_CONNMARK.c
index b03ce00..6841e08 100644
--- a/net/netfilter/xt_CONNMARK.c
+++ b/net/netfilter/xt_CONNMARK.c
@@ -23,7 +23,7 @@
 #include <linux/ip.h>
 #include <net/checksum.h>

-MODULE_AUTHOR("Henrik Nordstrom <hno@marasytems.com>");
+MODULE_AUTHOR("Henrik Nordstrom <hno@marasystems.com>");
 MODULE_DESCRIPTION("IP tables CONNMARK matching module");
 MODULE_LICENSE("GPL");
 MODULE_ALIAS("ipt_CONNMARK");
diff --git a/net/netfilter/xt_connmark.c b/net/netfilter/xt_connmark.c
index e180325..499bd0b 100644
--- a/net/netfilter/xt_connmark.c
+++ b/net/netfilter/xt_connmark.c
@@ -25,7 +25,7 @@
 #include <linux/netfilter/x_tables.h>
 #include <linux/netfilter/xt_connmark.h>

-MODULE_AUTHOR("Henrik Nordstrom <hno@marasytems.com>");
+MODULE_AUTHOR("Henrik Nordstrom <hno@marasystems.com>");
 MODULE_DESCRIPTION("IP tables connmark match module");
 MODULE_LICENSE("GPL");
 MODULE_ALIAS("ipt_connmark");
diff --git a/net/sched/em_meta.c b/net/sched/em_meta.c
index 60acf8c..de785e7 100644
--- a/net/sched/em_meta.c
+++ b/net/sched/em_meta.c
@@ -55,7 +55,7 @@
  * 	ppp0..9.
  *
  * 	NOTE: Certain meta values depend on other subsystems and are
- * 	      only available if that subsytem is enabled in the kernel.
+ * 	      only available if that subsystem is enabled in the kernel.
  */

 #include <linux/module.h>
diff --git a/sound/core/seq/seq_midi_emul.c b/sound/core/seq/seq_midi_emul.c
index d7c4fb8..17b3e6f 100644
--- a/sound/core/seq/seq_midi_emul.c
+++ b/sound/core/seq/seq_midi_emul.c
@@ -71,7 +71,7 @@ static void reset_all_channels(struct snd_midi_channel_set *chset);
  * such as GM, GS and XG.
  * There modes that this module will run in are:
  *   Generic MIDI - no interpretation at all, it will just save current values
- *                  of controlers etc.
+ *                  of controllers etc.
  *   GM - You can use all gm_ prefixed elements of chan.  Controls, RPN, NRPN,
  *        SysEx will be interpreded as defined in General Midi.
  *   GS - You can use all gs_ prefixed elements of chan. Codes for GS will be
@@ -176,7 +176,7 @@ snd_midi_process_event(struct snd_midi_op *ops,
 				   ev->data.control.value);
 		break;
 	case SNDRV_SEQ_EVENT_NONREGPARAM:
-		/* Break it back into its controler values */
+		/* Break it back into its controller values */
 		chan->param_type = SNDRV_MIDI_PARAM_TYPE_NONREGISTERED;
 		chan->control[MIDI_CTL_MSB_DATA_ENTRY]
 			= (ev->data.control.value >> 7) & 0x7f;
@@ -189,7 +189,7 @@ snd_midi_process_event(struct snd_midi_op *ops,
 		nrpn(ops, drv, chan, chanset);
 		break;
 	case SNDRV_SEQ_EVENT_REGPARAM:
-		/* Break it back into its controler values */
+		/* Break it back into its controller values */
 		chan->param_type = SNDRV_MIDI_PARAM_TYPE_REGISTERED;
 		chan->control[MIDI_CTL_MSB_DATA_ENTRY]
 			= (ev->data.control.value >> 7) & 0x7f;
@@ -267,7 +267,7 @@ note_off(struct snd_midi_op *ops, void *drv, struct snd_midi_channel *chan,
 }

 /*
- * Do all driver independent operations for this controler and pass
+ * Do all driver independent operations for this controller and pass
  * events that need to take place immediately to the driver.
  */
 static void
diff --git a/sound/drivers/opl3/opl3_midi.c b/sound/drivers/opl3/opl3_midi.c
index 1b6f227..3557b6e 100644
--- a/sound/drivers/opl3/opl3_midi.c
+++ b/sound/drivers/opl3/opl3_midi.c
@@ -808,7 +808,7 @@ static void snd_opl3_pitch_ctrl(struct snd_opl3 *opl3, struct snd_midi_channel *
 }

 /*
- * Deal with a controler type event.  This includes all types of
+ * Deal with a controller type event.  This includes all types of
  * control events, not just the midi controllers
  */
 void snd_opl3_control(void *p, int type, struct snd_midi_channel *chan)
diff --git a/sound/isa/es18xx.c b/sound/isa/es18xx.c
index 725c115..caa06ed 100644
--- a/sound/isa/es18xx.c
+++ b/sound/isa/es18xx.c
@@ -623,7 +623,7 @@ static int snd_es18xx_capture_prepare(struct snd_pcm_substream *substream)
                          (snd_pcm_format_width(runtime->format) = 16 ? 0x04 : 0x00) |
                          (snd_pcm_format_unsigned(runtime->format) ? 0x00 : 0x20));

-        /* Set DMA controler */
+        /* Set DMA controller */
         snd_dma_program(chip->dma1, runtime->dma_addr, size, DMA_MODE_READ | DMA_AUTOINIT);

 	return 0;
@@ -689,7 +689,7 @@ static int snd_es18xx_playback2_prepare(struct snd_es18xx *chip,
                          (snd_pcm_format_width(runtime->format) = 16 ? 0x04 : 0x00) |
                          (snd_pcm_format_unsigned(runtime->format) ? 0x00 : 0x20));

-        /* Set DMA controler */
+        /* Set DMA controller */
         snd_dma_program(chip->dma1, runtime->dma_addr, size, DMA_MODE_WRITE | DMA_AUTOINIT);

 	return 0;
diff --git a/sound/mips/au1x00.c b/sound/mips/au1x00.c
index 8a61a11..24460a5 100644
--- a/sound/mips/au1x00.c
+++ b/sound/mips/au1x00.c
@@ -498,8 +498,8 @@ snd_au1000_ac97_read(struct snd_ac97 *ac97, unsigned short reg)
 	int             i;

 	spin_lock(&au1000->ac97_lock);
-/* would rather use the interupt than this polling but it works and I can't
-get the interupt driven case to work efficiently */
+/* would rather use the interrupt than this polling but it works and I can't
+get the interrupt driven case to work efficiently */
 	for (i = 0; i < 0x5000; i++)
 		if (!(au1000->ac97_ioport->status & AC97C_CP))
 			break;
@@ -535,8 +535,8 @@ snd_au1000_ac97_write(struct snd_ac97 *ac97, unsigned short reg, unsigned short
 	int i;

 	spin_lock(&au1000->ac97_lock);
-/* would rather use the interupt than this polling but it works and I can't
-get the interupt driven case to work efficiently */
+/* would rather use the interrupt than this polling but it works and I can't
+get the interrupt driven case to work efficiently */
 	for (i = 0; i < 0x5000; i++)
 		if (!(au1000->ac97_ioport->status & AC97C_CP))
 			break;
diff --git a/sound/pci/au88x0/au88x0.c b/sound/pci/au88x0/au88x0.c
index 238154b..521a70b 100644
--- a/sound/pci/au88x0/au88x0.c
+++ b/sound/pci/au88x0/au88x0.c
@@ -191,7 +191,7 @@ snd_vortex_create(struct snd_card *card, struct pci_dev *pci, vortex_t ** rchip)

 	/* Init audio core.
 	 * This must be done before we do request_irq otherwise we can get spurious
-	 * interupts that we do not handle properly and make a mess of things */
+	 * interrupts that we do not handle properly and make a mess of things */
 	if ((err = vortex_core_init(chip)) != 0) {
 		printk(KERN_ERR "hw core init failed\n");
 		goto core_out;
diff --git a/sound/pci/emu10k1/emu10k1_main.c b/sound/pci/emu10k1/emu10k1_main.c
index 80aa585..7b4159c 100644
--- a/sound/pci/emu10k1/emu10k1_main.c
+++ b/sound/pci/emu10k1/emu10k1_main.c
@@ -1560,7 +1560,7 @@ int __devinit snd_emu10k1_create(struct snd_card *card,
 	if (c->subsystem && !subsystem)
 		snd_printdd("Sound card name=%s\n", c->name);
 	else if (subsystem)
-		snd_printdd("Sound card name=%s, vendor=0x%x, device=0x%x, subsystem=0x%x. Forced to subsytem=0x%x\n",
+		snd_printdd("Sound card name=%s, vendor=0x%x, device=0x%x, subsystem=0x%x. Forced to subsystem=0x%x\n",
 		       	c->name, pci->vendor, pci->device, emu->serial, c->subsystem);
 	else
 		snd_printdd("Sound card name=%s, vendor=0x%x, device=0x%x, subsystem=0x%x.\n",
diff --git a/sound/pci/rme9652/hdspm.c b/sound/pci/rme9652/hdspm.c
index 6e95857..2d65892 100644
--- a/sound/pci/rme9652/hdspm.c
+++ b/sound/pci/rme9652/hdspm.c
@@ -3409,7 +3409,7 @@ static int snd_hdspm_set_defaults(struct hdspm * hdspm)


 /*------------------------------------------------------------
-   interupt
+   interrupt
  ------------------------------------------------------------*/

 static irqreturn_t snd_hdspm_interrupt(int irq, void *dev_id)
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 36519ae..377ed64 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -263,7 +263,7 @@ out:
 }

 /*
- * Power down the audio subsytem pmdown_time msecs after close is called.
+ * Power down the audio subsystem pmdown_time msecs after close is called.
  * This is to ensure there are no pops or clicks in between any music tracks
  * due to DAPM power cycling.
  */
diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index 7caf8c7..484f13a 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -24,7 +24,7 @@
  *    o Automatic Mic Bias support
  *    o Jack insertion power event initiation - e.g. hp insertion will enable
  *      sinks, dacs, etc
- *    o Delayed powerdown of audio susbsytem to reduce pops between a quick
+ *    o Delayed powerdown of audio susbsystem to reduce pops between a quick
  *      device reopen.
  *
  *  Todo:
diff --git a/sound/synth/emux/emux_synth.c b/sound/synth/emux/emux_synth.c
index 3733118..478369b 100644
--- a/sound/synth/emux/emux_synth.c
+++ b/sound/synth/emux/emux_synth.c
@@ -317,7 +317,7 @@ snd_emux_update_port(struct snd_emux_port *port, int update)


 /*
- * Deal with a controler type event.  This includes all types of
+ * Deal with a controller type event.  This includes all types of
  * control events, not just the midi controllers
  */
 void


-- 
====================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry
Waterloo, Ontario, CANADA

http://fsdev.net/wiki/index.php?title=Main_Page
====================================
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
