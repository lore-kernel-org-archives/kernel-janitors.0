From: Adam Buchbinder <adam.buchbinder@gmail.com>
Date: Thu, 20 Sep 2012 01:48:00 +0000
Subject: [PATCH] Fix misspellings of "whether" in comments.
Message-Id: <1348105682-25196-3-git-send-email-adam.buchbinder@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

"Whether" is misspelled in various comments across the tree; this
fixes them. No code changes.

Signed-off-by: Adam Buchbinder <adam.buchbinder@gmail.com>
---
 arch/arm/mach-s3c24xx/include/mach/bast-map.h      |    2 +-
 arch/arm/mach-s3c24xx/include/mach/dma.h           |    2 +-
 arch/arm/mach-s3c24xx/include/mach/vr1000-map.h    |    2 +-
 arch/arm/mach-s3c24xx/pm.c                         |    2 +-
 arch/arm/plat-s3c24xx/dma.c                        |    2 +-
 arch/m68k/math-emu/fp_log.c                        |    2 +-
 arch/powerpc/include/asm/pte-hash64-64k.h          |    2 +-
 arch/powerpc/include/asm/smu.h                     |    4 ++--
 arch/powerpc/kernel/legacy_serial.c                |    2 +-
 arch/powerpc/kernel/of_platform.c                  |    2 +-
 arch/powerpc/kernel/signal_64.c                    |    2 +-
 arch/powerpc/mm/slice.c                            |    2 +-
 arch/powerpc/platforms/52xx/mpc52xx_gpt.c          |    2 +-
 arch/powerpc/platforms/cell/iommu.c                |    2 +-
 arch/powerpc/platforms/cell/spider-pic.c           |    6 +++---
 arch/powerpc/platforms/powermac/pic.c              |    2 +-
 drivers/gpu/drm/radeon/evergreen.c                 |    2 +-
 drivers/gpu/drm/radeon/ni.c                        |    4 ++--
 drivers/gpu/drm/radeon/si.c                        |    6 +++---
 drivers/i2c/busses/i2c-nuc900.c                    |    2 +-
 drivers/i2c/busses/i2c-s3c2410.c                   |    4 ++--
 drivers/macintosh/macio_asic.c                     |    2 +-
 drivers/mtd/maps/plat-ram.c                        |    2 +-
 drivers/mtd/nand/s3c2410.c                         |    2 +-
 drivers/net/ethernet/8390/ax88796.c                |    2 +-
 .../myricom/myri10ge/myri10ge_mcp_gen_header.h     |    2 +-
 drivers/net/sungem_phy.c                           |    8 ++++----
 drivers/rtc/rtc-isl1208.c                          |    2 +-
 drivers/rtc/rtc-s3c.c                              |    2 +-
 drivers/s390/block/dasd_devmap.c                   |    2 +-
 drivers/usb/storage/realtek_cr.c                   |    2 +-
 drivers/watchdog/booke_wdt.c                       |    2 +-
 fs/btrfs/extent-tree.c                             |    2 +-
 fs/btrfs/ordered-data.h                            |    2 +-
 fs/ext4/ext4.h                                     |    2 +-
 fs/fhandle.c                                       |    4 ++--
 fs/jbd/transaction.c                               |    2 +-
 fs/jbd2/transaction.c                              |    2 +-
 fs/logfs/inode.c                                   |    2 +-
 include/linux/lru_cache.h                          |    4 ++--
 include/linux/nl80211.h                            |    4 ++--
 include/linux/vgaarb.h                             |    4 ++--
 include/linux/watchdog.h                           |    2 +-
 include/linux/wimax.h                              |    2 +-
 include/net/sock.h                                 |    2 +-
 net/can/proc.c                                     |    2 +-
 sound/pci/es1968.c                                 |    2 +-
 sound/usb/quirks.c                                 |    2 +-
 48 files changed, 62 insertions(+), 62 deletions(-)

diff --git a/arch/arm/mach-s3c24xx/include/mach/bast-map.h b/arch/arm/mach-s3c24xx/include/mach/bast-map.h
index 6e7dc9d..eecea2a 100644
--- a/arch/arm/mach-s3c24xx/include/mach/bast-map.h
+++ b/arch/arm/mach-s3c24xx/include/mach/bast-map.h
@@ -74,7 +74,7 @@
 
 
 /* 0xE0000000 contains the IO space that is split by speed and
- * wether the access is for 8 or 16bit IO... this ensures that
+ * whether the access is for 8 or 16bit IO... this ensures that
  * the correct access is made
  *
  * 0x10000000 of space, partitioned as so:
diff --git a/arch/arm/mach-s3c24xx/include/mach/dma.h b/arch/arm/mach-s3c24xx/include/mach/dma.h
index ee99fd5..6b72d5a 100644
--- a/arch/arm/mach-s3c24xx/include/mach/dma.h
+++ b/arch/arm/mach-s3c24xx/include/mach/dma.h
@@ -88,7 +88,7 @@ enum s3c2410_dma_state {
  *
  * This represents the state of the DMA engine, wrt to the loaded / running
  * transfers. Since we don't have any way of knowing exactly the state of
- * the DMA transfers, we need to know the state to make decisions on wether
+ * the DMA transfers, we need to know the state to make decisions on whether
  * we can
  *
  * S3C2410_DMA_NONE
diff --git a/arch/arm/mach-s3c24xx/include/mach/vr1000-map.h b/arch/arm/mach-s3c24xx/include/mach/vr1000-map.h
index 99612fc..28376e5 100644
--- a/arch/arm/mach-s3c24xx/include/mach/vr1000-map.h
+++ b/arch/arm/mach-s3c24xx/include/mach/vr1000-map.h
@@ -51,7 +51,7 @@
 #define VR1000_VA_PC104_IRQMASK VR1000_IOADDR(0x00600000)
 
 /* 0xE0000000 contains the IO space that is split by speed and
- * wether the access is for 8 or 16bit IO... this ensures that
+ * whether the access is for 8 or 16bit IO... this ensures that
  * the correct access is made
  *
  * 0x10000000 of space, partitioned as so:
diff --git a/arch/arm/mach-s3c24xx/pm.c b/arch/arm/mach-s3c24xx/pm.c
index 60627e6..724755f 100644
--- a/arch/arm/mach-s3c24xx/pm.c
+++ b/arch/arm/mach-s3c24xx/pm.c
@@ -121,7 +121,7 @@ void s3c_pm_configure_extint(void)
 	int pin;
 
 	/* for each of the external interrupts (EINT0..EINT15) we
-	 * need to check wether it is an external interrupt source,
+	 * need to check whether it is an external interrupt source,
 	 * and then configure it as an input if it is not
 	*/
 
diff --git a/arch/arm/plat-s3c24xx/dma.c b/arch/arm/plat-s3c24xx/dma.c
index db98e70..3eb5139 100644
--- a/arch/arm/plat-s3c24xx/dma.c
+++ b/arch/arm/plat-s3c24xx/dma.c
@@ -325,7 +325,7 @@ static int s3c2410_dma_start(struct s3c2410_dma_chan *chan)
 
 	chan->state = S3C2410_DMA_RUNNING;
 
-	/* check wether there is anything to load, and if not, see
+	/* check whether there is anything to load, and if not, see
 	 * if we can find anything to load
 	 */
 
diff --git a/arch/m68k/math-emu/fp_log.c b/arch/m68k/math-emu/fp_log.c
index 3384a52..0663067 100644
--- a/arch/m68k/math-emu/fp_log.c
+++ b/arch/m68k/math-emu/fp_log.c
@@ -50,7 +50,7 @@ fp_fsqrt(struct fp_ext *dest, struct fp_ext *src)
 	 * sqrt(m*2^e)  	 *		 sqrt(2*m) * 2^(p)	, if e = 2*p + 1
 	 *
-	 * So we use the last bit of the exponent to decide wether to
+	 * So we use the last bit of the exponent to decide whether to
 	 * use the m or 2*m.
 	 *
 	 * Since only the fractional part of the mantissa is stored and
diff --git a/arch/powerpc/include/asm/pte-hash64-64k.h b/arch/powerpc/include/asm/pte-hash64-64k.h
index 59247e8..8cc9079 100644
--- a/arch/powerpc/include/asm/pte-hash64-64k.h
+++ b/arch/powerpc/include/asm/pte-hash64-64k.h
@@ -23,7 +23,7 @@
 
 /* Note the full page bits must be in the same location as for normal
  * 4k pages as the same assembly will be used to insert 64K pages
- * wether the kernel has CONFIG_PPC_64K_PAGES or not
+ * whether the kernel has CONFIG_PPC_64K_PAGES or not
  */
 #define _PAGE_F_SECOND  0x00008000 /* full page: hidx bits */
 #define _PAGE_F_GIX     0x00007000 /* full page: hidx bits */
diff --git a/arch/powerpc/include/asm/smu.h b/arch/powerpc/include/asm/smu.h
index ae20ce1..6e909f3 100644
--- a/arch/powerpc/include/asm/smu.h
+++ b/arch/powerpc/include/asm/smu.h
@@ -132,7 +132,7 @@
   *
   * At this point, the OF driver seems to have a limitation on transfer
   * sizes of 0xd bytes on reads and 0x5 bytes on writes. I do not know
-  * wether this is just an OF limit due to some temporary buffer size
+  * whether this is just an OF limit due to some temporary buffer size
   * or if this is an SMU imposed limit. This driver has the same limitation
   * for now as I use a 0x10 bytes temporary buffer as well
   *
@@ -236,7 +236,7 @@
  *   3 (optional): enable nmi? [0x00 or 0x01]
  *
  * Returns:
- *   If parameter 2 is 0x00 and parameter 3 is not specified, returns wether
+ *   If parameter 2 is 0x00 and parameter 3 is not specified, returns whether
  *   NMI is enabled. Otherwise unknown.
  */
 #define   SMU_CMD_MISC_df_NMI_OPTION		0x04
diff --git a/arch/powerpc/kernel/legacy_serial.c b/arch/powerpc/kernel/legacy_serial.c
index bedd12e..0733b05 100644
--- a/arch/powerpc/kernel/legacy_serial.c
+++ b/arch/powerpc/kernel/legacy_serial.c
@@ -387,7 +387,7 @@ void __init find_legacy_serial_ports(void)
 			of_node_put(parent);
 			continue;
 		}
-		/* Check for known pciclass, and also check wether we have
+		/* Check for known pciclass, and also check whether we have
 		 * a device with child nodes for ports or not
 		 */
 		if (of_device_is_compatible(np, "pciclass,0700") ||
diff --git a/arch/powerpc/kernel/of_platform.c b/arch/powerpc/kernel/of_platform.c
index 2049f2d..9db8ec0 100644
--- a/arch/powerpc/kernel/of_platform.c
+++ b/arch/powerpc/kernel/of_platform.c
@@ -82,7 +82,7 @@ static int __devinit of_pci_phb_probe(struct platform_device *dev)
 		return -ENXIO;
 
 	/* Claim resources. This might need some rework as well depending
-	 * wether we are doing probe-only or not, like assigning unassigned
+	 * whether we are doing probe-only or not, like assigning unassigned
 	 * resources etc...
 	 */
 	pcibios_claim_one_bus(phb->bus);
diff --git a/arch/powerpc/kernel/signal_64.c b/arch/powerpc/kernel/signal_64.c
index d183f87..1ca045d 100644
--- a/arch/powerpc/kernel/signal_64.c
+++ b/arch/powerpc/kernel/signal_64.c
@@ -83,7 +83,7 @@ static long setup_sigcontext(struct sigcontext __user *sc, struct pt_regs *regs,
 	 * the context). This is very important because we must ensure we
 	 * don't lose the VRSAVE content that may have been set prior to
 	 * the process doing its first vector operation
-	 * Userland shall check AT_HWCAP to know wether it can rely on the
+	 * Userland shall check AT_HWCAP to know whether it can rely on the
 	 * v_regs pointer or not
 	 */
 #ifdef CONFIG_ALTIVEC
diff --git a/arch/powerpc/mm/slice.c b/arch/powerpc/mm/slice.c
index 73709f7..4de5e95 100644
--- a/arch/powerpc/mm/slice.c
+++ b/arch/powerpc/mm/slice.c
@@ -688,7 +688,7 @@ void slice_set_range_psize(struct mm_struct *mm, unsigned long start,
 }
 
 /*
- * is_hugepage_only_range() is used by generic code to verify wether
+ * is_hugepage_only_range() is used by generic code to verify whether
  * a normal mmap mapping (non hugetlbfs) is valid on a given area.
  *
  * until the generic code provides a more generic hook and/or starts
diff --git a/arch/powerpc/platforms/52xx/mpc52xx_gpt.c b/arch/powerpc/platforms/52xx/mpc52xx_gpt.c
index 028470b..a51cb07 100644
--- a/arch/powerpc/platforms/52xx/mpc52xx_gpt.c
+++ b/arch/powerpc/platforms/52xx/mpc52xx_gpt.c
@@ -526,7 +526,7 @@ EXPORT_SYMBOL(mpc52xx_gpt_timer_period);
 
 #define WDT_IDENTITY	    "mpc52xx watchdog on GPT0"
 
-/* wdt_is_active stores wether or not the /dev/watchdog device is opened */
+/* wdt_is_active stores whether or not the /dev/watchdog device is opened */
 static unsigned long wdt_is_active;
 
 /* wdt-capable gpt */
diff --git a/arch/powerpc/platforms/cell/iommu.c b/arch/powerpc/platforms/cell/iommu.c
index dca2136..e56bb65 100644
--- a/arch/powerpc/platforms/cell/iommu.c
+++ b/arch/powerpc/platforms/cell/iommu.c
@@ -728,7 +728,7 @@ static struct cbe_iommu * __init cell_iommu_alloc(struct device_node *np)
 		 nid, np->full_name);
 
 	/* XXX todo: If we can have multiple windows on the same IOMMU, which
-	 * isn't the case today, we probably want here to check wether the
+	 * isn't the case today, we probably want here to check whether the
 	 * iommu for that node is already setup.
 	 * However, there might be issue with getting the size right so let's
 	 * ignore that for now. We might want to completely get rid of the
diff --git a/arch/powerpc/platforms/cell/spider-pic.c b/arch/powerpc/platforms/cell/spider-pic.c
index d8b7cc8..8e29944 100644
--- a/arch/powerpc/platforms/cell/spider-pic.c
+++ b/arch/powerpc/platforms/cell/spider-pic.c
@@ -148,7 +148,7 @@ static int spider_set_irq_type(struct irq_data *d, unsigned int type)
 
 	/* Configure the source. One gross hack that was there before and
 	 * that I've kept around is the priority to the BE which I set to
-	 * be the same as the interrupt source number. I don't know wether
+	 * be the same as the interrupt source number. I don't know whether
 	 * that's supposed to make any kind of sense however, we'll have to
 	 * decide that, but for now, I'm not changing the behaviour.
 	 */
@@ -220,7 +220,7 @@ static void spider_irq_cascade(unsigned int irq, struct irq_desc *desc)
 /* For hooking up the cascace we have a problem. Our device-tree is
  * crap and we don't know on which BE iic interrupt we are hooked on at
  * least not the "standard" way. We can reconstitute it based on two
- * informations though: which BE node we are connected to and wether
+ * informations though: which BE node we are connected to and whether
  * we are connected to IOIF0 or IOIF1. Right now, we really only care
  * about the IBM cell blade and we know that its firmware gives us an
  * interrupt-map property which is pretty strange.
@@ -232,7 +232,7 @@ static unsigned int __init spider_find_cascade_and_node(struct spider_pic *pic)
 	int imaplen, intsize, unit;
 	struct device_node *iic;
 
-	/* First, we check wether we have a real "interrupts" in the device
+	/* First, we check whether we have a real "interrupts" in the device
 	 * tree in case the device-tree is ever fixed
 	 */
 	struct of_irq oirq;
diff --git a/arch/powerpc/platforms/powermac/pic.c b/arch/powerpc/platforms/powermac/pic.c
index c4e6305..31036b5 100644
--- a/arch/powerpc/platforms/powermac/pic.c
+++ b/arch/powerpc/platforms/powermac/pic.c
@@ -529,7 +529,7 @@ static int __init pmac_pic_probe_mpic(void)
 void __init pmac_pic_init(void)
 {
 	/* We configure the OF parsing based on our oldworld vs. newworld
-	 * platform type and wether we were booted by BootX.
+	 * platform type and whether we were booted by BootX.
 	 */
 #ifdef CONFIG_PPC32
 	if (!pmac_newworld)
diff --git a/drivers/gpu/drm/radeon/evergreen.c b/drivers/gpu/drm/radeon/evergreen.c
index e93b80a..b355448 100644
--- a/drivers/gpu/drm/radeon/evergreen.c
+++ b/drivers/gpu/drm/radeon/evergreen.c
@@ -1595,7 +1595,7 @@ int evergreen_cp_resume(struct radeon_device *rdev)
 	ring->wptr = 0;
 	WREG32(CP_RB_WPTR, ring->wptr);
 
-	/* set the wb address wether it's enabled or not */
+	/* set the wb address whether it's enabled or not */
 	WREG32(CP_RB_RPTR_ADDR,
 	       ((rdev->wb.gpu_addr + RADEON_WB_CP_RPTR_OFFSET) & 0xFFFFFFFC));
 	WREG32(CP_RB_RPTR_ADDR_HI, upper_32_bits(rdev->wb.gpu_addr + RADEON_WB_CP_RPTR_OFFSET) & 0xFF);
diff --git a/drivers/gpu/drm/radeon/ni.c b/drivers/gpu/drm/radeon/ni.c
index 853800e..caeece9 100644
--- a/drivers/gpu/drm/radeon/ni.c
+++ b/drivers/gpu/drm/radeon/ni.c
@@ -1054,7 +1054,7 @@ int cayman_cp_resume(struct radeon_device *rdev)
 
 	WREG32(CP_DEBUG, (1 << 27));
 
-	/* set the wb address wether it's enabled or not */
+	/* set the wb address whether it's enabled or not */
 	WREG32(SCRATCH_ADDR, ((rdev->wb.gpu_addr + RADEON_WB_SCRATCH_OFFSET) >> 8) & 0xFFFFFFFF);
 	WREG32(SCRATCH_UMSK, 0xff);
 
@@ -1071,7 +1071,7 @@ int cayman_cp_resume(struct radeon_device *rdev)
 #endif
 		WREG32(cp_rb_cntl[i], rb_cntl);
 
-		/* set the wb address wether it's enabled or not */
+		/* set the wb address whether it's enabled or not */
 		addr = rdev->wb.gpu_addr + RADEON_WB_CP_RPTR_OFFSET;
 		WREG32(cp_rb_rptr_addr[i], addr & 0xFFFFFFFC);
 		WREG32(cp_rb_rptr_addr_hi[i], upper_32_bits(addr) & 0xFF);
diff --git a/drivers/gpu/drm/radeon/si.c b/drivers/gpu/drm/radeon/si.c
index 0139e22..74925f7 100644
--- a/drivers/gpu/drm/radeon/si.c
+++ b/drivers/gpu/drm/radeon/si.c
@@ -2006,7 +2006,7 @@ static int si_cp_resume(struct radeon_device *rdev)
 	ring->wptr = 0;
 	WREG32(CP_RB0_WPTR, ring->wptr);
 
-	/* set the wb address wether it's enabled or not */
+	/* set the wb address whether it's enabled or not */
 	WREG32(CP_RB0_RPTR_ADDR, (rdev->wb.gpu_addr + RADEON_WB_CP_RPTR_OFFSET) & 0xFFFFFFFC);
 	WREG32(CP_RB0_RPTR_ADDR_HI, upper_32_bits(rdev->wb.gpu_addr + RADEON_WB_CP_RPTR_OFFSET) & 0xFF);
 
@@ -2039,7 +2039,7 @@ static int si_cp_resume(struct radeon_device *rdev)
 	ring->wptr = 0;
 	WREG32(CP_RB1_WPTR, ring->wptr);
 
-	/* set the wb address wether it's enabled or not */
+	/* set the wb address whether it's enabled or not */
 	WREG32(CP_RB1_RPTR_ADDR, (rdev->wb.gpu_addr + RADEON_WB_CP1_RPTR_OFFSET) & 0xFFFFFFFC);
 	WREG32(CP_RB1_RPTR_ADDR_HI, upper_32_bits(rdev->wb.gpu_addr + RADEON_WB_CP1_RPTR_OFFSET) & 0xFF);
 
@@ -2065,7 +2065,7 @@ static int si_cp_resume(struct radeon_device *rdev)
 	ring->wptr = 0;
 	WREG32(CP_RB2_WPTR, ring->wptr);
 
-	/* set the wb address wether it's enabled or not */
+	/* set the wb address whether it's enabled or not */
 	WREG32(CP_RB2_RPTR_ADDR, (rdev->wb.gpu_addr + RADEON_WB_CP2_RPTR_OFFSET) & 0xFFFFFFFC);
 	WREG32(CP_RB2_RPTR_ADDR_HI, upper_32_bits(rdev->wb.gpu_addr + RADEON_WB_CP2_RPTR_OFFSET) & 0xFF);
 
diff --git a/drivers/i2c/busses/i2c-nuc900.c b/drivers/i2c/busses/i2c-nuc900.c
index a26dfb8..e57675f 100644
--- a/drivers/i2c/busses/i2c-nuc900.c
+++ b/drivers/i2c/busses/i2c-nuc900.c
@@ -304,7 +304,7 @@ retry_write:
 
 	case STATE_READ:
 		/* we have a byte of data in the data register, do
-		 * something with it, and then work out wether we are
+		 * something with it, and then work out whether we are
 		 * going to do any more read/write
 		 */
 
diff --git a/drivers/i2c/busses/i2c-s3c2410.c b/drivers/i2c/busses/i2c-s3c2410.c
index 5ae3b02..f1f0a32 100644
--- a/drivers/i2c/busses/i2c-s3c2410.c
+++ b/drivers/i2c/busses/i2c-s3c2410.c
@@ -208,7 +208,7 @@ static void s3c24xx_i2c_message_start(struct s3c24xx_i2c *i2c,
 	if (msg->flags & I2C_M_REV_DIR_ADDR)
 		addr ^= 1;
 
-	/* todo - check for wether ack wanted or not */
+	/* todo - check for whether ack wanted or not */
 	s3c24xx_i2c_enable_ack(i2c);
 
 	iiccon = readl(i2c->regs + S3C2410_IICCON);
@@ -397,7 +397,7 @@ static int i2c_s3c_irq_nextbyte(struct s3c24xx_i2c *i2c, unsigned long iicstat)
 
 	case STATE_READ:
 		/* we have a byte of data in the data register, do
-		 * something with it, and then work out wether we are
+		 * something with it, and then work out whether we are
 		 * going to do any more read/write
 		 */
 
diff --git a/drivers/macintosh/macio_asic.c b/drivers/macintosh/macio_asic.c
index 20e5c2c..0819b28 100644
--- a/drivers/macintosh/macio_asic.c
+++ b/drivers/macintosh/macio_asic.c
@@ -746,7 +746,7 @@ static void __devexit macio_pci_remove(struct pci_dev* pdev)
 
 /*
  * MacIO is matched against any Apple ID, it's probe() function
- * will then decide wether it applies or not
+ * will then decide whether it applies or not
  */
 static const struct pci_device_id __devinitdata pci_ids [] = { {
 	.vendor		= PCI_VENDOR_ID_APPLE,
diff --git a/drivers/mtd/maps/plat-ram.c b/drivers/mtd/maps/plat-ram.c
index 891558d..2de66b0 100644
--- a/drivers/mtd/maps/plat-ram.c
+++ b/drivers/mtd/maps/plat-ram.c
@@ -219,7 +219,7 @@ static int platram_probe(struct platform_device *pdev)
 
 	platram_setrw(info, PLATRAM_RW);
 
-	/* check to see if there are any available partitions, or wether
+	/* check to see if there are any available partitions, or whether
 	 * to add this device whole */
 
 	err = mtd_device_parse_register(info->mtd, pdata->probes, NULL,
diff --git a/drivers/mtd/nand/s3c2410.c b/drivers/mtd/nand/s3c2410.c
index 91121f3..cb25e89 100644
--- a/drivers/mtd/nand/s3c2410.c
+++ b/drivers/mtd/nand/s3c2410.c
@@ -898,7 +898,7 @@ static void s3c2410_nand_update_chip(struct s3c2410_nand_info *info,
 	if (chip->ecc.mode != NAND_ECC_HW)
 		return;
 
-		/* change the behaviour depending on wether we are using
+		/* change the behaviour depending on whether we are using
 		 * the large or small page nand device */
 
 	if (chip->page_shift > 10) {
diff --git a/drivers/net/ethernet/8390/ax88796.c b/drivers/net/ethernet/8390/ax88796.c
index 203ff9d..846381c 100644
--- a/drivers/net/ethernet/8390/ax88796.c
+++ b/drivers/net/ethernet/8390/ax88796.c
@@ -109,7 +109,7 @@ static inline struct ax_device *to_ax_dev(struct net_device *dev)
 /*
  * ax_initial_check
  *
- * do an initial probe for the card to check wether it exists
+ * do an initial probe for the card to check whether it exists
  * and is functional
  */
 static int ax_initial_check(struct net_device *dev)
diff --git a/drivers/net/ethernet/myricom/myri10ge/myri10ge_mcp_gen_header.h b/drivers/net/ethernet/myricom/myri10ge/myri10ge_mcp_gen_header.h
index 7ec4b86..75ec5e7 100644
--- a/drivers/net/ethernet/myricom/myri10ge/myri10ge_mcp_gen_header.h
+++ b/drivers/net/ethernet/myricom/myri10ge/myri10ge_mcp_gen_header.h
@@ -27,7 +27,7 @@ struct mcp_gen_header {
 	 *
 	 * Fields below this comment are extensions added in later versions
 	 * of this struct, drivers should compare the header_length against
-	 * offsetof(field) to check wether a given MCP implements them.
+	 * offsetof(field) to check whether a given MCP implements them.
 	 *
 	 * Never remove any field.  Keep everything naturally align.
 	 */
diff --git a/drivers/net/sungem_phy.c b/drivers/net/sungem_phy.c
index 58f13ad..ae7cd7f 100644
--- a/drivers/net/sungem_phy.c
+++ b/drivers/net/sungem_phy.c
@@ -608,7 +608,7 @@ static int bcm5421_poll_link(struct mii_phy* phy)
 	if ( mode = BCM54XX_COPPER)
 		return genmii_poll_link(phy);
 
-	/* try to find out wether we have a link */
+	/* try to find out whether we have a link */
 	phy_write(phy, MII_NCONFIG, 0x2000);
 	phy_reg = phy_read(phy, MII_NCONFIG);
 
@@ -634,7 +634,7 @@ static int bcm5421_read_link(struct mii_phy* phy)
 
 	phy->speed = SPEED_1000;
 
-	/* find out wether we are running half- or full duplex */
+	/* find out whether we are running half- or full duplex */
 	phy_write(phy, MII_NCONFIG, 0x2000);
 	phy_reg = phy_read(phy, MII_NCONFIG);
 
@@ -681,7 +681,7 @@ static int bcm5461_poll_link(struct mii_phy* phy)
 	if ( mode = BCM54XX_COPPER)
 		return genmii_poll_link(phy);
 
-	/* find out wether we have a link */
+	/* find out whether we have a link */
 	phy_write(phy, MII_NCONFIG, 0x7000);
 	phy_reg = phy_read(phy, MII_NCONFIG);
 
@@ -710,7 +710,7 @@ static int bcm5461_read_link(struct mii_phy* phy)
 
 	phy->speed = SPEED_1000;
 
-	/* find out wether we are running half- or full duplex */
+	/* find out whether we are running half- or full duplex */
 	phy_write(phy, MII_NCONFIG, 0x7000);
 	phy_reg = phy_read(phy, MII_NCONFIG);
 
diff --git a/drivers/rtc/rtc-isl1208.c b/drivers/rtc/rtc-isl1208.c
index dd2aeee..75d53b7 100644
--- a/drivers/rtc/rtc-isl1208.c
+++ b/drivers/rtc/rtc-isl1208.c
@@ -106,7 +106,7 @@ isl1208_i2c_set_regs(struct i2c_client *client, u8 reg, u8 const buf[],
 	return ret;
 }
 
-/* simple check to see wether we have a isl1208 */
+/* simple check to see whether we have a isl1208 */
 static int
 isl1208_i2c_validate_client(struct i2c_client *client)
 {
diff --git a/drivers/rtc/rtc-s3c.c b/drivers/rtc/rtc-s3c.c
index bfbd92c..e91251e 100644
--- a/drivers/rtc/rtc-s3c.c
+++ b/drivers/rtc/rtc-s3c.c
@@ -186,7 +186,7 @@ static int s3c_rtc_gettime(struct device *dev, struct rtc_time *rtc_tm)
 	rtc_tm->tm_year = readb(base + S3C2410_RTCYEAR);
 	rtc_tm->tm_sec  = readb(base + S3C2410_RTCSEC);
 
-	/* the only way to work out wether the system was mid-update
+	/* the only way to work out whether the system was mid-update
 	 * when we read it is to check the second counter, and if it
 	 * is zero, then we re-try the entire read
 	 */
diff --git a/drivers/s390/block/dasd_devmap.c b/drivers/s390/block/dasd_devmap.c
index b2b8c18..20cfd02 100644
--- a/drivers/s390/block/dasd_devmap.c
+++ b/drivers/s390/block/dasd_devmap.c
@@ -1344,7 +1344,7 @@ dasd_get_feature(struct ccw_device *cdev, int feature)
 
 /*
  * Set / reset given feature.
- * Flag indicates wether to set (!=0) or the reset (=0) the feature.
+ * Flag indicates whether to set (!=0) or the reset (=0) the feature.
  */
 int
 dasd_set_feature(struct ccw_device *cdev, int feature, int flag)
diff --git a/drivers/usb/storage/realtek_cr.c b/drivers/usb/storage/realtek_cr.c
index 63cf282..d261ede 100644
--- a/drivers/usb/storage/realtek_cr.c
+++ b/drivers/usb/storage/realtek_cr.c
@@ -883,7 +883,7 @@ static void rts51x_invoke_transport(struct scsi_cmnd *srb, struct us_data *us)
 		} else {
 			US_DEBUGP("%s: NOT working scsi, not SS\n", __func__);
 			chip->proto_handler_backup(srb, us);
-			/* Check wether card is plugged in */
+			/* Check whether card is plugged in */
 			if (srb->cmnd[0] = TEST_UNIT_READY) {
 				if (srb->result = SAM_STAT_GOOD) {
 					SET_LUN_READY(chip, srb->device->lun);
diff --git a/drivers/watchdog/booke_wdt.c b/drivers/watchdog/booke_wdt.c
index 5b06d31..c0bc92d 100644
--- a/drivers/watchdog/booke_wdt.c
+++ b/drivers/watchdog/booke_wdt.c
@@ -212,7 +212,7 @@ static long booke_wdt_ioctl(struct file *file,
 	return 0;
 }
 
-/* wdt_is_active stores wether or not the /dev/watchdog device is opened */
+/* wdt_is_active stores whether or not the /dev/watchdog device is opened */
 static unsigned long wdt_is_active;
 
 static int booke_wdt_open(struct inode *inode, struct file *file)
diff --git a/fs/btrfs/extent-tree.c b/fs/btrfs/extent-tree.c
index ba58024..be46299 100644
--- a/fs/btrfs/extent-tree.c
+++ b/fs/btrfs/extent-tree.c
@@ -3840,7 +3840,7 @@ static int flush_space(struct btrfs_root *root,
  * @root - the root we're allocating for
  * @block_rsv - the block_rsv we're allocating for
  * @orig_bytes - the number of bytes we want
- * @flush - wether or not we can flush to make our reservation
+ * @flush - whether or not we can flush to make our reservation
  *
  * This will reserve orgi_bytes number of bytes from the space info associated
  * with the block_rsv.  If there is not enough space it will make an attempt to
diff --git a/fs/btrfs/ordered-data.h b/fs/btrfs/ordered-data.h
index e03c560..a06d98e 100644
--- a/fs/btrfs/ordered-data.h
+++ b/fs/btrfs/ordered-data.h
@@ -76,7 +76,7 @@ struct btrfs_ordered_sum {
 
 #define BTRFS_ORDERED_IOERR 6 /* We had an io error when writing this out */
 
-#define BTRFS_ORDERED_UPDATED_ISIZE 7 /* indicates wether this ordered extent
+#define BTRFS_ORDERED_UPDATED_ISIZE 7 /* indicates whether this ordered extent
 				       * has done its due diligence in updating
 				       * the isize. */
 
diff --git a/fs/ext4/ext4.h b/fs/ext4/ext4.h
index c3411d4..80b8067 100644
--- a/fs/ext4/ext4.h
+++ b/fs/ext4/ext4.h
@@ -2436,7 +2436,7 @@ TAS_BUFFER_FNS(Uninit, uninit)
 BUFFER_FNS(Da_Mapped, da_mapped)
 
 /*
- * Add new method to test wether block and inode bitmaps are properly
+ * Add new method to test whether block and inode bitmaps are properly
  * initialized. With uninit_bg reading the block from disk is not enough
  * to mark the bitmap uptodate. We need to also zero-out the bitmap
  */
diff --git a/fs/fhandle.c b/fs/fhandle.c
index a48e4a1..91f4e94 100644
--- a/fs/fhandle.c
+++ b/fs/fhandle.c
@@ -22,7 +22,7 @@ static long do_sys_name_to_handle(struct path *path,
 	struct file_handle *handle = NULL;
 
 	/*
-	 * We need t make sure wether the file system
+	 * We need to make sure whether the file system
 	 * support decoding of the file handle
 	 */
 	if (!path->dentry->d_sb->s_export_op ||
@@ -40,7 +40,7 @@ static long do_sys_name_to_handle(struct path *path,
 	if (!handle)
 		return -ENOMEM;
 
-	/* convert handle size to  multiple of sizeof(u32) */
+	/* convert handle size to multiple of sizeof(u32) */
 	handle_dwords = f_handle.handle_bytes >> 2;
 
 	/* we ask for a non connected handle */
diff --git a/fs/jbd/transaction.c b/fs/jbd/transaction.c
index febc10d..18b9b15 100644
--- a/fs/jbd/transaction.c
+++ b/fs/jbd/transaction.c
@@ -1259,7 +1259,7 @@ int journal_forget (handle_t *handle, struct buffer_head *bh)
 		goto not_jbd;
 	}
 
-	/* keep track of wether or not this transaction modified us */
+	/* keep track of whether or not this transaction modified us */
 	was_modified = jh->b_modified;
 
 	/*
diff --git a/fs/jbd2/transaction.c b/fs/jbd2/transaction.c
index fb1ab953..986a5a2 100644
--- a/fs/jbd2/transaction.c
+++ b/fs/jbd2/transaction.c
@@ -1261,7 +1261,7 @@ int jbd2_journal_forget (handle_t *handle, struct buffer_head *bh)
 		goto not_jbd;
 	}
 
-	/* keep track of wether or not this transaction modified us */
+	/* keep track of whether or not this transaction modified us */
 	was_modified = jh->b_modified;
 
 	/*
diff --git a/fs/logfs/inode.c b/fs/logfs/inode.c
index 6984562..683ffdf 100644
--- a/fs/logfs/inode.c
+++ b/fs/logfs/inode.c
@@ -33,7 +33,7 @@
  * are being written out - and waiting for GC to make progress, naturally.
  *
  * So we cannot just call iget() or some variant of it, but first have to check
- * wether the inode in question might be in I_FREEING state.  Therefore we
+ * whether the inode in question might be in I_FREEING state.  Therefore we
  * maintain our own per-sb list of "almost deleted" inodes and check against
  * that list first.  Normally this should be at most 1-2 entries long.
  *
diff --git a/include/linux/lru_cache.h b/include/linux/lru_cache.h
index 7a71ffa..cafc7f9 100644
--- a/include/linux/lru_cache.h
+++ b/include/linux/lru_cache.h
@@ -52,8 +52,8 @@ We replicate IO (more or less synchronously) to local and remote disk.
 
 For crash recovery after replication node failure,
   we need to resync all regions that have been target of in-flight WRITE IO
-  (in use, or "hot", regions), as we don't know wether or not those WRITEs have
-  made it to stable storage.
+  (in use, or "hot", regions), as we don't know whether or not those WRITEs
+  have made it to stable storage.
 
   To avoid a "full resync", we need to persistently track these regions.
 
diff --git a/include/linux/nl80211.h b/include/linux/nl80211.h
index 2f38788..d5076ac 100644
--- a/include/linux/nl80211.h
+++ b/include/linux/nl80211.h
@@ -1058,10 +1058,10 @@ enum nl80211_commands {
  *	bit. Depending on which antennas are selected in the bitmap, 802.11n
  *	drivers can derive which chainmasks to use (if all antennas belonging to
  *	a particular chain are disabled this chain should be disabled) and if
- *	a chain has diversity antennas wether diversity should be used or not.
+ *	a chain has diversity antennas whether diversity should be used or not.
  *	HT capabilities (STBC, TX Beamforming, Antenna selection) can be
  *	derived from the available chains after applying the antenna mask.
- *	Non-802.11n drivers can derive wether to use diversity or not.
+ *	Non-802.11n drivers can derive whether to use diversity or not.
  *	Drivers may reject configurations or RX/TX mask combinations they cannot
  *	support by returning -EINVAL.
  *
diff --git a/include/linux/vgaarb.h b/include/linux/vgaarb.h
index 0ee42d9..2c02f3a 100644
--- a/include/linux/vgaarb.h
+++ b/include/linux/vgaarb.h
@@ -78,7 +78,7 @@ extern void vga_set_legacy_decoding(struct pci_dev *pdev,
  *     This function acquires VGA resources for the given
  *     card and mark those resources locked. If the resource requested
  *     are "normal" (and not legacy) resources, the arbiter will first check
- *     wether the card is doing legacy decoding for that type of resource. If
+ *     whether the card is doing legacy decoding for that type of resource. If
  *     yes, the lock is "converted" into a legacy resource lock.
  *     The arbiter will first look for all VGA cards that might conflict
  *     and disable their IOs and/or Memory access, including VGA forwarding
@@ -89,7 +89,7 @@ extern void vga_set_legacy_decoding(struct pci_dev *pdev,
  *     This function will block if some conflicting card is already locking
  *     one of the required resources (or any resource on a different bus
  *     segment, since P2P bridges don't differenciate VGA memory and IO
- *     afaik). You can indicate wether this blocking should be interruptible
+ *     afaik). You can indicate whether this blocking should be interruptible
  *     by a signal (for userland interface) or not.
  *     Must not be called at interrupt time or in atomic context.
  *     If the card already owns the resources, the function succeeds.
diff --git a/include/linux/watchdog.h b/include/linux/watchdog.h
index da70f0f..3664d1b 100644
--- a/include/linux/watchdog.h
+++ b/include/linux/watchdog.h
@@ -150,7 +150,7 @@ struct watchdog_device {
 #define WATCHDOG_NOWAYOUT_INIT_STATUS	0
 #endif
 
-/* Use the following function to check wether or not the watchdog is active */
+/* Use the following function to check whether or not the watchdog is active */
 static inline bool watchdog_active(struct watchdog_device *wdd)
 {
 	return test_bit(WDOG_ACTIVE, &wdd->status);
diff --git a/include/linux/wimax.h b/include/linux/wimax.h
index 9f6b77a..c41c520 100644
--- a/include/linux/wimax.h
+++ b/include/linux/wimax.h
@@ -160,7 +160,7 @@ enum {
  *     before being operational.
  *     Some WiMAX API calls might work.
  *
- * @WIMAX_ST_RADIO_OFF: The device is fully up; radio is off (wether
+ * @WIMAX_ST_RADIO_OFF: The device is fully up; radio is off (whether
  *     by hardware or software switches).
  *     It is recommended to always leave the device in this state
  *     after initialization.
diff --git a/include/net/sock.h b/include/net/sock.h
index adb7da2..161812c 100644
--- a/include/net/sock.h
+++ b/include/net/sock.h
@@ -213,7 +213,7 @@ struct cg_proto;
   *	@sk_sndbuf: size of send buffer in bytes
   *	@sk_flags: %SO_LINGER (l_onoff), %SO_BROADCAST, %SO_KEEPALIVE,
   *		   %SO_OOBINLINE settings, %SO_TIMESTAMPING settings
-  *	@sk_no_check: %SO_NO_CHECK setting, wether or not checkup packets
+  *	@sk_no_check: %SO_NO_CHECK setting, whether or not checkup packets
   *	@sk_route_caps: route capabilities (e.g. %NETIF_F_TSO)
   *	@sk_route_nocaps: forbidden route capabilities (e.g NETIF_F_GSO_MASK)
   *	@sk_gso_type: GSO type (e.g. %SKB_GSO_TCPV4)
diff --git a/net/can/proc.c b/net/can/proc.c
index 3b6dd31..ae56690 100644
--- a/net/can/proc.c
+++ b/net/can/proc.c
@@ -397,7 +397,7 @@ static inline void can_rcvlist_sff_proc_show_one(struct seq_file *m,
 	int i;
 	int all_empty = 1;
 
-	/* check wether at least one list is non-empty */
+	/* check whether at least one list is non-empty */
 	for (i = 0; i < 0x800; i++)
 		if (!hlist_empty(&d->rx_sff[i])) {
 			all_empty = 0;
diff --git a/sound/pci/es1968.c b/sound/pci/es1968.c
index fb4c90b9..50c82b8 100644
--- a/sound/pci/es1968.c
+++ b/sound/pci/es1968.c
@@ -2291,7 +2291,7 @@ static void snd_es1968_chip_init(struct es1968 *chip)
 	outb(0x88, iobase+0x1f);
 
 	/* it appears some maestros (dell 7500) only work if these are set,
-	   regardless of wether we use the assp or not. */
+	   regardless of whether we use the assp or not. */
 
 	outb(0, iobase + ASSP_CONTROL_B);
 	outb(3, iobase + ASSP_CONTROL_A);	/* M: Reserved bits... */
diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index 2781726..3a25c4b 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -675,7 +675,7 @@ int snd_usb_apply_boot_quirk(struct usb_device *dev,
  */
 int snd_usb_is_big_endian_format(struct snd_usb_audio *chip, struct audioformat *fp)
 {
-	/* it depends on altsetting wether the device is big-endian or not */
+	/* it depends on altsetting whether the device is big-endian or not */
 	switch (chip->usb_id) {
 	case USB_ID(0x0763, 0x2001): /* M-Audio Quattro: captured data only */
 		if (fp->altsetting = 2 || fp->altsetting = 3 ||
-- 
1.7.7.3

