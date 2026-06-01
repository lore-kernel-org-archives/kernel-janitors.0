Received: from smtp.smtpout.orange.fr (smtp-20.smtpout.orange.fr [80.12.242.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0866A2C0F91
	for <kernel-janitors@vger.kernel.org>; Mon,  1 Jun 2026 20:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780345200; cv=none; b=kHRs+W2wDKntPXABbu1arYQP2Y2VvQSoVIlaP8BPJYChtrs6ddVi1TjQMZTXA1M0nmj5h9QSAD3EsWH3ng5zEbvybRvtp/jSE5tVCGybBiZrKgVLqsXAmGVHsHYYWee3K6VtbsDC4Ih4VxRnlkfmTpsibyvcViplb9GsqeK/130=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780345200; c=relaxed/simple;
	bh=CaCbvYjJk6+PviosdWPMg5c2U7XWFyfkeJa9m6qjHhE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J2Z7JMns7CGXIMC/jCLtetgHZnp/+oHMOEop1fXpjdT1Ehavrt27gd/CR0bszQ+IHp4Vn4u8Z6v+T6Y7sxHvJZHJNdG0dfYcoB+QLP0WXYzVcUGvfrJk2L3+o1GYjy7jdQLukRoWHY2lrrKdt2FaayAi1zPMTGibGp51rRswZn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=lCr65sPM; arc=none smtp.client-ip=80.12.242.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="lCr65sPM"
Received: from fedora.home ([IPv6:2a01:cb10:785:b00:8347:f260:7456:7662])
	by smtp.orange.fr with ESMTPSA
	id U96bwqrR9v48RU970wPoT1; Mon, 01 Jun 2026 22:19:51 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1780345191;
	bh=fZCgRtPiXVL2MwA2067NJ9dTWvLbH9v0jHp231uPe64=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=lCr65sPMKCje1wQuaNkKWMxAsRmBOGbiUJf6uy3GPwddZd3S8j9bi9e24d8QFWVFo
	 fpBV9Oy6ZiBaxOqb2XYBpH+AW4AEs70l5J7e6UEvBQCP4AKFJEhWmR7doIeo0Fpav4
	 X6EpNBPT+TYBBxZNhXGtRmhL2fwdQQEF5ipEFvvPM3ZiNrA9VMEzz0vFfvCeiwOV8i
	 8aLO0eHZcMNv55yPaVmMatecBLGuC+D3Ko9y24N0HU9lxqOXyy1MRN9KAOuCs/6fbu
	 igZfFKYpMct7ltjw+YpEaG4EnkkrWjftYMkdilWu6vhWR2/FQTle9iY32KatyGzANj
	 aErWOq4iI7fxA==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Mon, 01 Jun 2026 22:19:51 +0200
X-ME-IP: 2a01:cb10:785:b00:8347:f260:7456:7662
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: tglx@kernel.org
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH v2 6/7] treewide: Constify some struct irq_chip *
Date: Mon,  1 Jun 2026 22:19:06 +0200
Message-ID: <bf0965d60022608419c700c0ec7cae7aab305a76.1780343698.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1780343698.git.christophe.jaillet@wanadoo.fr>
References: <cover.1780343698.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When the 'chip' member of struct irq_data will be turned into a const
struct irq_chip, the const qualifier will be needed for local
variables that keep a reference to this field.

When irq_desc_get_chip(), irq_get_chip() and irq_data_get_irq_chip() will
return a const struct irq_chip *, many const qualifier will be needed.

Update all of these place with the following coccinelle script:

Note that some direct field accesses are replaced by an equivalent
accessor helper.

///////////////////////////
//
// Transform irq_get_chip()
//
///////////////////////////
@@
expression __IRQ;
identifier __CHIP;
@@
(
	const struct irq_chip *__CHIP = irq_get_chip(__IRQ);
|
-	struct irq_chip *__CHIP = irq_get_chip(__IRQ);
+	const struct irq_chip *__CHIP = irq_get_chip(__IRQ);
)

@@
expression __IRQ;
identifier __CHIP;
@@
(
	const struct irq_chip *__CHIP;
|
-	struct irq_chip *__CHIP;
+	const struct irq_chip *__CHIP;
)
	...
	__CHIP = irq_get_chip(__IRQ);

////////////////////////////////
//
// Transform irq_desc_get_chip()
//
////////////////////////////////
@@
expression __DESC;
identifier __CHIP;
@@
(
	const struct irq_chip *__CHIP = irq_desc_get_chip(__DESC);
|
	const struct irq_chip *__CHIP = desc->irq_data.chip;
|
-	struct irq_chip *__CHIP = irq_desc_get_chip(__DESC);
+	const struct irq_chip *__CHIP = irq_desc_get_chip(__DESC);
|
-	struct irq_chip *__CHIP = desc->irq_data.chip;
+	const struct irq_chip *__CHIP = irq_desc_get_chip(desc);
)

@@
expression __DESC;
identifier __CHIP;
@@
(
	const struct irq_chip *__CHIP;
|
-	struct irq_chip *__CHIP;
+	const struct irq_chip *__CHIP;
)
	...
	__CHIP = irq_desc_get_chip(__DESC);

////////////////////////////////////
//
// Transform irq_data_get_irq_chip()
//
////////////////////////////////////
@@
expression __DATA;
identifier __CHIP;
@@
(
-	struct irq_chip *__CHIP = irq_data_get_irq_chip(__DATA);
+	const struct irq_chip *__CHIP = irq_data_get_irq_chip(__DATA);
|
-	struct irq_chip *__CHIP = data->chip;
+	const struct irq_chip *__CHIP = irq_data_get_irq_chip(data);
)

@@
expression __DATA;
identifier __CHIP;
@@
(
	const struct irq_chip *__CHIP;
|
-	struct irq_chip *__CHIP;
+	const struct irq_chip *__CHIP;
)
	...
	__CHIP = irq_data_get_irq_chip(__DATA);

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Compile tested only, on x86.

Changes in v2:
   - New patch

v1: none
---
 arch/alpha/kernel/irq.c                        |  2 +-
 arch/arc/kernel/mcip.c                         |  2 +-
 arch/arm/mach-omap2/prm_common.c               |  2 +-
 arch/mips/alchemy/devboards/bcsr.c             |  2 +-
 arch/powerpc/kvm/book3s_hv.c                   |  2 +-
 arch/powerpc/platforms/44x/uic.c               |  2 +-
 arch/powerpc/platforms/52xx/media5200.c        |  2 +-
 arch/powerpc/platforms/85xx/common.c           |  2 +-
 arch/powerpc/platforms/85xx/mpc85xx_8259.c     |  2 +-
 .../powerpc/platforms/85xx/socrates_fpga_pic.c |  2 +-
 arch/powerpc/platforms/86xx/pic.c              |  2 +-
 arch/powerpc/platforms/chrp/setup.c            |  2 +-
 arch/powerpc/platforms/embedded6xx/hlwd-pic.c  |  2 +-
 arch/powerpc/platforms/embedded6xx/mvme5100.c  |  2 +-
 arch/powerpc/platforms/pasemi/setup.c          |  2 +-
 arch/powerpc/platforms/pseries/setup.c         |  2 +-
 arch/powerpc/sysdev/ge/ge_pic.c                |  2 +-
 arch/powerpc/sysdev/mpic.c                     |  2 +-
 arch/powerpc/sysdev/tsi108_pci.c               |  2 +-
 arch/powerpc/sysdev/xics/xics-common.c         |  2 +-
 arch/riscv/kernel/sbi-ipi.c                    |  2 +-
 arch/sh/boards/mach-se/7343/irq.c              |  2 +-
 arch/sh/boards/mach-se/7722/irq.c              |  2 +-
 arch/sh/boards/mach-x3proto/gpio.c             |  2 +-
 arch/sh/kernel/cpu/irq/ipr.c                   |  2 +-
 arch/x86/kernel/apic/io_apic.c                 |  2 +-
 drivers/clocksource/timer-clint.c              |  2 +-
 drivers/edac/altera_edac.c                     |  2 +-
 drivers/gpio/gpio-altera.c                     |  4 ++--
 drivers/gpio/gpio-aspeed-sgpio.c               |  2 +-
 drivers/gpio/gpio-aspeed.c                     |  2 +-
 drivers/gpio/gpio-ath79.c                      |  2 +-
 drivers/gpio/gpio-bcm-kona.c                   |  2 +-
 drivers/gpio/gpio-blzp1600.c                   |  2 +-
 drivers/gpio/gpio-brcmstb.c                    |  2 +-
 drivers/gpio/gpio-cadence.c                    |  2 +-
 drivers/gpio/gpio-dwapb.c                      |  2 +-
 drivers/gpio/gpio-eic-sprd.c                   |  2 +-
 drivers/gpio/gpio-ep93xx.c                     |  2 +-
 drivers/gpio/gpio-ftgpio010.c                  |  2 +-
 drivers/gpio/gpio-hisi.c                       |  2 +-
 drivers/gpio/gpio-hlwd.c                       |  2 +-
 drivers/gpio/gpio-idt3243x.c                   |  2 +-
 drivers/gpio/gpio-loongson-64bit.c             |  2 +-
 drivers/gpio/gpio-mpfs.c                       |  2 +-
 drivers/gpio/gpio-mvebu.c                      |  2 +-
 drivers/gpio/gpio-mxc.c                        |  4 ++--
 drivers/gpio/gpio-npcm-sgpio.c                 |  2 +-
 drivers/gpio/gpio-pl061.c                      |  2 +-
 drivers/gpio/gpio-rda.c                        |  2 +-
 drivers/gpio/gpio-realtek-otto.c               |  2 +-
 drivers/gpio/gpio-rockchip.c                   |  2 +-
 drivers/gpio/gpio-rtd.c                        |  2 +-
 drivers/gpio/gpio-sprd.c                       |  2 +-
 drivers/gpio/gpio-tangier.c                    |  2 +-
 drivers/gpio/gpio-tegra.c                      |  2 +-
 drivers/gpio/gpio-tegra186.c                   |  2 +-
 drivers/gpio/gpio-tqmx86.c                     |  2 +-
 drivers/gpio/gpio-vf610.c                      |  2 +-
 drivers/gpio/gpio-xilinx.c                     |  2 +-
 drivers/gpio/gpio-xlp.c                        |  2 +-
 drivers/gpio/gpio-zynq.c                       |  2 +-
 drivers/gpu/drm/msm/msm_mdss.c                 |  2 +-
 drivers/gpu/ipu-v3/ipu-common.c                |  4 ++--
 drivers/iio/adc/stm32-adc-core.c               |  2 +-
 drivers/iio/industrialio-trigger.c             |  4 ++--
 drivers/irqchip/exynos-combiner.c              |  4 ++--
 drivers/irqchip/irq-aclint-sswi.c              |  2 +-
 drivers/irqchip/irq-al-fic.c                   |  2 +-
 drivers/irqchip/irq-armada-370-xp.c            |  2 +-
 drivers/irqchip/irq-aspeed-i2c-ic.c            |  2 +-
 drivers/irqchip/irq-aspeed-scu-ic.c            |  4 ++--
 drivers/irqchip/irq-ast2700-intc1.c            |  2 +-
 drivers/irqchip/irq-ath79-misc.c               |  2 +-
 drivers/irqchip/irq-bcm2836.c                  |  2 +-
 drivers/irqchip/irq-bcm6345-l1.c               |  2 +-
 drivers/irqchip/irq-bcm7038-l1.c               |  2 +-
 drivers/irqchip/irq-bcm7120-l2.c               |  2 +-
 drivers/irqchip/irq-brcmstb-l2.c               |  2 +-
 drivers/irqchip/irq-dw-apb-ictl.c              |  2 +-
 drivers/irqchip/irq-econet-en751221.c          |  2 +-
 drivers/irqchip/irq-gic.c                      |  2 +-
 drivers/irqchip/irq-goldfish-pic.c             |  2 +-
 drivers/irqchip/irq-idt3243x.c                 |  2 +-
 drivers/irqchip/irq-imx-mu-msi.c               |  2 +-
 drivers/irqchip/irq-ingenic-tcu.c              |  2 +-
 drivers/irqchip/irq-lan966x-oic.c              |  2 +-
 drivers/irqchip/irq-loongarch-avec.c           |  2 +-
 drivers/irqchip/irq-loongson-eiointc.c         |  2 +-
 drivers/irqchip/irq-loongson-htpic.c           |  2 +-
 drivers/irqchip/irq-loongson-htvec.c           |  2 +-
 drivers/irqchip/irq-loongson-liointc.c         |  2 +-
 drivers/irqchip/irq-loongson-pch-lpc.c         |  2 +-
 drivers/irqchip/irq-lpc32xx.c                  |  2 +-
 drivers/irqchip/irq-ls1x.c                     |  2 +-
 drivers/irqchip/irq-mmp.c                      |  2 +-
 drivers/irqchip/irq-mscc-ocelot.c              |  2 +-
 drivers/irqchip/irq-mvebu-pic.c                |  2 +-
 drivers/irqchip/irq-mvebu-sei.c                |  2 +-
 drivers/irqchip/irq-pruss-intc.c               |  2 +-
 drivers/irqchip/irq-realtek-rtl.c              |  2 +-
 drivers/irqchip/irq-riscv-aplic-direct.c       |  2 +-
 drivers/irqchip/irq-riscv-imsic-early.c        |  2 +-
 drivers/irqchip/irq-sifive-plic.c              |  4 ++--
 drivers/irqchip/irq-sp7021-intc.c              |  2 +-
 drivers/irqchip/irq-starfive-jhb100-intc.c     |  2 +-
 drivers/irqchip/irq-stm32-exti.c               |  2 +-
 drivers/irqchip/irq-sunxi-nmi.c                |  2 +-
 drivers/irqchip/irq-ts4800.c                   |  2 +-
 drivers/irqchip/irq-versatile-fpga.c           |  2 +-
 drivers/irqchip/irq-vic.c                      |  2 +-
 drivers/irqchip/irq-vt8500.c                   |  2 +-
 drivers/irqchip/irq-xilinx-intc.c              |  2 +-
 drivers/irqchip/qcom-irq-combiner.c            |  2 +-
 drivers/mfd/fsl-imx25-tsadc.c                  |  2 +-
 drivers/misc/rp1/rp1_pci.c                     |  2 +-
 drivers/pci/controller/dwc/pci-dra7xx.c        |  2 +-
 drivers/pci/controller/dwc/pci-keystone.c      |  4 ++--
 .../pci/controller/dwc/pcie-designware-host.c  |  2 +-
 drivers/pci/controller/dwc/pcie-dw-rockchip.c  |  2 +-
 drivers/pci/controller/dwc/pcie-keembay.c      |  2 +-
 drivers/pci/controller/dwc/pcie-sophgo.c       |  2 +-
 drivers/pci/controller/dwc/pcie-uniphier.c     |  2 +-
 .../controller/mobiveil/pcie-mobiveil-host.c   |  2 +-
 drivers/pci/controller/pci-ftpci100.c          |  2 +-
 drivers/pci/controller/pci-mvebu.c             |  2 +-
 drivers/pci/controller/pci-tegra.c             |  2 +-
 drivers/pci/controller/pci-xgene-msi.c         |  2 +-
 drivers/pci/controller/pcie-altera-msi.c       |  2 +-
 drivers/pci/controller/pcie-altera.c           |  4 ++--
 drivers/pci/controller/pcie-apple.c            |  2 +-
 drivers/pci/controller/pcie-brcmstb.c          |  2 +-
 drivers/pci/controller/pcie-iproc-msi.c        |  2 +-
 drivers/pci/controller/pcie-mediatek-gen3.c    |  2 +-
 drivers/pci/controller/pcie-mediatek.c         |  2 +-
 drivers/pci/controller/pcie-rockchip-host.c    |  2 +-
 drivers/pci/controller/pcie-rzg3s-host.c       |  2 +-
 drivers/pci/controller/pcie-xilinx-cpm.c       |  4 ++--
 drivers/pci/controller/pcie-xilinx-nwl.c       |  6 +++---
 drivers/pci/controller/plda/pcie-plda-host.c   |  6 +++---
 drivers/pinctrl/actions/pinctrl-owl.c          |  2 +-
 drivers/pinctrl/bcm/pinctrl-bcm2835.c          |  2 +-
 drivers/pinctrl/bcm/pinctrl-iproc-gpio.c       |  2 +-
 drivers/pinctrl/intel/pinctrl-baytrail.c       |  2 +-
 drivers/pinctrl/intel/pinctrl-cherryview.c     |  2 +-
 drivers/pinctrl/intel/pinctrl-lynxpoint.c      |  2 +-
 drivers/pinctrl/mediatek/mtk-eint.c            |  2 +-
 drivers/pinctrl/mvebu/pinctrl-armada-37xx.c    |  2 +-
 drivers/pinctrl/nuvoton/pinctrl-ma35.c         |  2 +-
 drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c      |  2 +-
 drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c      |  2 +-
 drivers/pinctrl/nuvoton/pinctrl-wpcm450.c      |  2 +-
 drivers/pinctrl/pinctrl-apple-gpio.c           |  2 +-
 drivers/pinctrl/pinctrl-at91-pio4.c            |  2 +-
 drivers/pinctrl/pinctrl-at91.c                 |  2 +-
 drivers/pinctrl/pinctrl-equilibrium.c          |  2 +-
 drivers/pinctrl/pinctrl-ingenic.c              |  2 +-
 drivers/pinctrl/pinctrl-keembay.c              |  2 +-
 drivers/pinctrl/pinctrl-microchip-sgpio.c      |  2 +-
 drivers/pinctrl/pinctrl-ocelot.c               |  4 ++--
 drivers/pinctrl/pinctrl-pic32.c                |  2 +-
 drivers/pinctrl/pinctrl-pistachio.c            |  2 +-
 drivers/pinctrl/pinctrl-rp1.c                  |  2 +-
 drivers/pinctrl/pinctrl-single.c               |  2 +-
 drivers/pinctrl/pinctrl-st.c                   |  4 ++--
 drivers/pinctrl/qcom/pinctrl-msm.c             |  2 +-
 drivers/pinctrl/samsung/pinctrl-exynos.c       | 12 ++++++------
 drivers/pinctrl/samsung/pinctrl-s3c64xx.c      |  4 ++--
 drivers/pinctrl/spear/pinctrl-plgpio.c         |  2 +-
 .../pinctrl/starfive/pinctrl-starfive-jh7100.c |  2 +-
 .../starfive/pinctrl-starfive-jh7110-aon.c     |  2 +-
 .../starfive/pinctrl-starfive-jh7110-sys.c     |  2 +-
 drivers/pinctrl/sunxi/pinctrl-sunxi.c          |  2 +-
 drivers/sh/intc/core.c                         |  4 ++--
 drivers/sh/intc/internals.h                    |  2 +-
 drivers/sh/intc/virq.c                         |  2 +-
 drivers/soc/fsl/qe/qe_ic.c                     |  6 +++---
 drivers/spmi/spmi-mtk-pmif.c                   |  2 +-
 drivers/spmi/spmi-pmic-arb.c                   |  2 +-
 kernel/irq/chip.c                              | 18 +++++++++---------
 kernel/irq/cpuhotplug.c                        |  2 +-
 kernel/irq/debugfs.c                           |  2 +-
 kernel/irq/ipi.c                               |  4 ++--
 kernel/irq/kexec.c                             |  2 +-
 kernel/irq/manage.c                            | 10 +++++-----
 kernel/irq/migration.c                         |  2 +-
 186 files changed, 224 insertions(+), 224 deletions(-)

diff --git a/arch/alpha/kernel/irq.c b/arch/alpha/kernel/irq.c
index c67047c5d830..a7387d3c3ae8 100644
--- a/arch/alpha/kernel/irq.c
+++ b/arch/alpha/kernel/irq.c
@@ -45,7 +45,7 @@ static char irq_user_affinity[NR_IRQS];
 int irq_select_affinity(unsigned int irq)
 {
 	struct irq_data *data = irq_get_irq_data(irq);
-	struct irq_chip *chip;
+	const struct irq_chip *chip;
 	static int last_cpu;
 	int cpu = last_cpu + 1;
 
diff --git a/arch/arc/kernel/mcip.c b/arch/arc/kernel/mcip.c
index 02b28a9324f4..d0c0b24ae8bc 100644
--- a/arch/arc/kernel/mcip.c
+++ b/arch/arc/kernel/mcip.c
@@ -345,7 +345,7 @@ static struct irq_chip idu_irq_chip = {
 static void idu_cascade_isr(struct irq_desc *desc)
 {
 	struct irq_domain *idu_domain = irq_desc_get_handler_data(desc);
-	struct irq_chip *core_chip = irq_desc_get_chip(desc);
+	const struct irq_chip *core_chip = irq_desc_get_chip(desc);
 	irq_hw_number_t core_hwirq = irqd_to_hwirq(irq_desc_get_irq_data(desc));
 	irq_hw_number_t idu_hwirq = core_hwirq - FIRST_EXT_IRQ;
 
diff --git a/arch/arm/mach-omap2/prm_common.c b/arch/arm/mach-omap2/prm_common.c
index ee4588acda50..63761654eee8 100644
--- a/arch/arm/mach-omap2/prm_common.c
+++ b/arch/arm/mach-omap2/prm_common.c
@@ -108,7 +108,7 @@ static void omap_prcm_irq_handler(struct irq_desc *desc)
 {
 	unsigned long pending[OMAP_PRCM_MAX_NR_PENDING_REG];
 	unsigned long priority_pending[OMAP_PRCM_MAX_NR_PENDING_REG];
-	struct irq_chip *chip = irq_desc_get_chip(desc);
+	const struct irq_chip *chip = irq_desc_get_chip(desc);
 	unsigned int virtirq;
 	int nr_irq = prcm_irq_setup->nr_regs * 32;
 
diff --git a/arch/mips/alchemy/devboards/bcsr.c b/arch/mips/alchemy/devboards/bcsr.c
index 8df0ccdc9287..ee73e331519a 100644
--- a/arch/mips/alchemy/devboards/bcsr.c
+++ b/arch/mips/alchemy/devboards/bcsr.c
@@ -91,7 +91,7 @@ EXPORT_SYMBOL_GPL(bcsr_mod);
 static void bcsr_csc_handler(struct irq_desc *d)
 {
 	unsigned short bisr = __raw_readw(bcsr_virt + BCSR_REG_INTSTAT);
-	struct irq_chip *chip = irq_desc_get_chip(d);
+	const struct irq_chip *chip = irq_desc_get_chip(d);
 
 	chained_irq_enter(chip, d);
 	generic_handle_irq(bcsr_csc_base + __ffs(bisr));
diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 61dbeea317f3..fe937f888f9d 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -5967,7 +5967,7 @@ static int kvmppc_set_passthru_irq(struct kvm *kvm, int host_irq, int guest_gsi)
 	struct irq_desc *desc;
 	struct kvmppc_irq_map *irq_map;
 	struct kvmppc_passthru_irqmap *pimap;
-	struct irq_chip *chip;
+	const struct irq_chip *chip;
 	int i, rc = 0;
 	struct irq_data *host_data;
 
diff --git a/arch/powerpc/platforms/44x/uic.c b/arch/powerpc/platforms/44x/uic.c
index 3f90126a9056..02f047696343 100644
--- a/arch/powerpc/platforms/44x/uic.c
+++ b/arch/powerpc/platforms/44x/uic.c
@@ -195,7 +195,7 @@ static const struct irq_domain_ops uic_host_ops = {
 
 static void uic_irq_cascade(struct irq_desc *desc)
 {
-	struct irq_chip *chip = irq_desc_get_chip(desc);
+	const struct irq_chip *chip = irq_desc_get_chip(desc);
 	struct irq_data *idata = irq_desc_get_irq_data(desc);
 	struct uic *uic = irq_desc_get_handler_data(desc);
 	u32 msr;
diff --git a/arch/powerpc/platforms/52xx/media5200.c b/arch/powerpc/platforms/52xx/media5200.c
index c20ac8010f6d..806f8e0a7715 100644
--- a/arch/powerpc/platforms/52xx/media5200.c
+++ b/arch/powerpc/platforms/52xx/media5200.c
@@ -78,7 +78,7 @@ static struct irq_chip media5200_irq_chip = {
 
 static void media5200_irq_cascade(struct irq_desc *desc)
 {
-	struct irq_chip *chip = irq_desc_get_chip(desc);
+	const struct irq_chip *chip = irq_desc_get_chip(desc);
 	int val;
 	u32 status, enable;
 
diff --git a/arch/powerpc/platforms/85xx/common.c b/arch/powerpc/platforms/85xx/common.c
index 757811155587..7a8ca769bf29 100644
--- a/arch/powerpc/platforms/85xx/common.c
+++ b/arch/powerpc/platforms/85xx/common.c
@@ -52,7 +52,7 @@ int __init mpc85xx_common_publish_devices(void)
 #ifdef CONFIG_CPM2
 static void cpm2_cascade(struct irq_desc *desc)
 {
-	struct irq_chip *chip = irq_desc_get_chip(desc);
+	const struct irq_chip *chip = irq_desc_get_chip(desc);
 	int cascade_irq;
 
 	while ((cascade_irq = cpm2_get_irq()) >= 0)
diff --git a/arch/powerpc/platforms/85xx/mpc85xx_8259.c b/arch/powerpc/platforms/85xx/mpc85xx_8259.c
index cb00d596ad80..ccf6e02f2f77 100644
--- a/arch/powerpc/platforms/85xx/mpc85xx_8259.c
+++ b/arch/powerpc/platforms/85xx/mpc85xx_8259.c
@@ -21,7 +21,7 @@
 
 static void mpc85xx_8259_cascade(struct irq_desc *desc)
 {
-	struct irq_chip *chip = irq_desc_get_chip(desc);
+	const struct irq_chip *chip = irq_desc_get_chip(desc);
 	unsigned int cascade_irq = i8259_irq();
 
 	if (cascade_irq)
diff --git a/arch/powerpc/platforms/85xx/socrates_fpga_pic.c b/arch/powerpc/platforms/85xx/socrates_fpga_pic.c
index 4b69fb321a68..4eee891989b1 100644
--- a/arch/powerpc/platforms/85xx/socrates_fpga_pic.c
+++ b/arch/powerpc/platforms/85xx/socrates_fpga_pic.c
@@ -89,7 +89,7 @@ static inline unsigned int socrates_fpga_pic_get_irq(unsigned int irq)
 
 static void socrates_fpga_pic_cascade(struct irq_desc *desc)
 {
-	struct irq_chip *chip = irq_desc_get_chip(desc);
+	const struct irq_chip *chip = irq_desc_get_chip(desc);
 	unsigned int irq = irq_desc_get_irq(desc);
 	unsigned int cascade_irq;
 
diff --git a/arch/powerpc/platforms/86xx/pic.c b/arch/powerpc/platforms/86xx/pic.c
index 9ca36de23532..227e351c6a16 100644
--- a/arch/powerpc/platforms/86xx/pic.c
+++ b/arch/powerpc/platforms/86xx/pic.c
@@ -17,7 +17,7 @@
 #ifdef CONFIG_PPC_I8259
 static void mpc86xx_8259_cascade(struct irq_desc *desc)
 {
-	struct irq_chip *chip = irq_desc_get_chip(desc);
+	const struct irq_chip *chip = irq_desc_get_chip(desc);
 	unsigned int cascade_irq = i8259_irq();
 
 	if (cascade_irq)
diff --git a/arch/powerpc/platforms/chrp/setup.c b/arch/powerpc/platforms/chrp/setup.c
index c1bfa4c3444c..2131d42f0f64 100644
--- a/arch/powerpc/platforms/chrp/setup.c
+++ b/arch/powerpc/platforms/chrp/setup.c
@@ -350,7 +350,7 @@ static void __init chrp_setup_arch(void)
 
 static void chrp_8259_cascade(struct irq_desc *desc)
 {
-	struct irq_chip *chip = irq_desc_get_chip(desc);
+	const struct irq_chip *chip = irq_desc_get_chip(desc);
 	unsigned int cascade_irq = i8259_irq();
 
 	if (cascade_irq)
diff --git a/arch/powerpc/platforms/embedded6xx/hlwd-pic.c b/arch/powerpc/platforms/embedded6xx/hlwd-pic.c
index 1522a8bece29..322e53cd7f99 100644
--- a/arch/powerpc/platforms/embedded6xx/hlwd-pic.c
+++ b/arch/powerpc/platforms/embedded6xx/hlwd-pic.c
@@ -120,7 +120,7 @@ static unsigned int __hlwd_pic_get_irq(struct irq_domain *h)
 
 static void hlwd_pic_irq_cascade(struct irq_desc *desc)
 {
-	struct irq_chip *chip = irq_desc_get_chip(desc);
+	const struct irq_chip *chip = irq_desc_get_chip(desc);
 	struct irq_domain *irq_domain = irq_desc_get_handler_data(desc);
 	unsigned int hwirq;
 
diff --git a/arch/powerpc/platforms/embedded6xx/mvme5100.c b/arch/powerpc/platforms/embedded6xx/mvme5100.c
index 5ca41972ef22..5598420c0ed7 100644
--- a/arch/powerpc/platforms/embedded6xx/mvme5100.c
+++ b/arch/powerpc/platforms/embedded6xx/mvme5100.c
@@ -40,7 +40,7 @@ static u_char *restart;
 
 static void mvme5100_8259_cascade(struct irq_desc *desc)
 {
-	struct irq_chip *chip = irq_desc_get_chip(desc);
+	const struct irq_chip *chip = irq_desc_get_chip(desc);
 	unsigned int cascade_irq = i8259_irq();
 
 	if (cascade_irq)
diff --git a/arch/powerpc/platforms/pasemi/setup.c b/arch/powerpc/platforms/pasemi/setup.c
index d03b41336901..0d807ee45ac3 100644
--- a/arch/powerpc/platforms/pasemi/setup.c
+++ b/arch/powerpc/platforms/pasemi/setup.c
@@ -205,7 +205,7 @@ machine_device_initcall(pasemi, pas_setup_mce_regs);
 #ifdef CONFIG_PPC_PASEMI_NEMO
 static void sb600_8259_cascade(struct irq_desc *desc)
 {
-	struct irq_chip *chip = irq_desc_get_chip(desc);
+	const struct irq_chip *chip = irq_desc_get_chip(desc);
 	unsigned int cascade_irq = i8259_irq();
 
 	if (cascade_irq)
diff --git a/arch/powerpc/platforms/pseries/setup.c b/arch/powerpc/platforms/pseries/setup.c
index 1223dc961242..84ee62199372 100644
--- a/arch/powerpc/platforms/pseries/setup.c
+++ b/arch/powerpc/platforms/pseries/setup.c
@@ -199,7 +199,7 @@ machine_subsys_initcall(pseries, pseries_wdt_init);
 
 static void pseries_8259_cascade(struct irq_desc *desc)
 {
-	struct irq_chip *chip = irq_desc_get_chip(desc);
+	const struct irq_chip *chip = irq_desc_get_chip(desc);
 	unsigned int cascade_irq = i8259_irq();
 
 	if (cascade_irq)
diff --git a/arch/powerpc/sysdev/ge/ge_pic.c b/arch/powerpc/sysdev/ge/ge_pic.c
index 0bc3f0b36528..34595d48698c 100644
--- a/arch/powerpc/sysdev/ge/ge_pic.c
+++ b/arch/powerpc/sysdev/ge/ge_pic.c
@@ -95,7 +95,7 @@ static int gef_pic_cascade_irq;
 
 static void gef_pic_cascade(struct irq_desc *desc)
 {
-	struct irq_chip *chip = irq_desc_get_chip(desc);
+	const struct irq_chip *chip = irq_desc_get_chip(desc);
 	unsigned int cascade_irq;
 
 	/*
diff --git a/arch/powerpc/sysdev/mpic.c b/arch/powerpc/sysdev/mpic.c
index 257886ec3f70..c99d3897d219 100644
--- a/arch/powerpc/sysdev/mpic.c
+++ b/arch/powerpc/sysdev/mpic.c
@@ -1167,7 +1167,7 @@ static int mpic_host_xlate(struct irq_domain *h, struct device_node *ct,
 /* IRQ handler for a secondary MPIC cascaded from another IRQ controller */
 static void mpic_cascade(struct irq_desc *desc)
 {
-	struct irq_chip *chip = irq_desc_get_chip(desc);
+	const struct irq_chip *chip = irq_desc_get_chip(desc);
 	struct mpic *mpic = irq_desc_get_handler_data(desc);
 	unsigned int virq;
 
diff --git a/arch/powerpc/sysdev/tsi108_pci.c b/arch/powerpc/sysdev/tsi108_pci.c
index 07d0f6a83879..3ce2e86b1886 100644
--- a/arch/powerpc/sysdev/tsi108_pci.c
+++ b/arch/powerpc/sysdev/tsi108_pci.c
@@ -416,7 +416,7 @@ void __init tsi108_pci_int_init(struct device_node *node)
 
 void tsi108_irq_cascade(struct irq_desc *desc)
 {
-	struct irq_chip *chip = irq_desc_get_chip(desc);
+	const struct irq_chip *chip = irq_desc_get_chip(desc);
 	unsigned int cascade_irq = get_pci_source();
 
 	if (cascade_irq)
diff --git a/arch/powerpc/sysdev/xics/xics-common.c b/arch/powerpc/sysdev/xics/xics-common.c
index c3fa539a9898..b1ed995b8ee1 100644
--- a/arch/powerpc/sysdev/xics/xics-common.c
+++ b/arch/powerpc/sysdev/xics/xics-common.c
@@ -196,7 +196,7 @@ void xics_migrate_irqs_away(void)
 	xics_set_cpu_giq(xics_default_distrib_server, 0);
 
 	for_each_irq_desc(virq, desc) {
-		struct irq_chip *chip;
+		const struct irq_chip *chip;
 		long server;
 		unsigned long flags;
 		struct irq_data *irqd;
diff --git a/arch/riscv/kernel/sbi-ipi.c b/arch/riscv/kernel/sbi-ipi.c
index 0cc5559c08d8..2fca592f4824 100644
--- a/arch/riscv/kernel/sbi-ipi.c
+++ b/arch/riscv/kernel/sbi-ipi.c
@@ -20,7 +20,7 @@ static int sbi_ipi_virq;
 
 static void sbi_ipi_handle(struct irq_desc *desc)
 {
-	struct irq_chip *chip = irq_desc_get_chip(desc);
+	const struct irq_chip *chip = irq_desc_get_chip(desc);
 
 	chained_irq_enter(chip, desc);
 
diff --git a/arch/sh/boards/mach-se/7343/irq.c b/arch/sh/boards/mach-se/7343/irq.c
index 730c01b225bd..b71091b95a94 100644
--- a/arch/sh/boards/mach-se/7343/irq.c
+++ b/arch/sh/boards/mach-se/7343/irq.c
@@ -29,7 +29,7 @@ struct irq_domain *se7343_irq_domain;
 static void se7343_irq_demux(struct irq_desc *desc)
 {
 	struct irq_data *data = irq_desc_get_irq_data(desc);
-	struct irq_chip *chip = irq_data_get_irq_chip(data);
+	const struct irq_chip *chip = irq_data_get_irq_chip(data);
 	unsigned long mask;
 	int bit;
 
diff --git a/arch/sh/boards/mach-se/7722/irq.c b/arch/sh/boards/mach-se/7722/irq.c
index 49aa3a2b1b8f..49b5ef4f3c1e 100644
--- a/arch/sh/boards/mach-se/7722/irq.c
+++ b/arch/sh/boards/mach-se/7722/irq.c
@@ -28,7 +28,7 @@ struct irq_domain *se7722_irq_domain;
 static void se7722_irq_demux(struct irq_desc *desc)
 {
 	struct irq_data *data = irq_desc_get_irq_data(desc);
-	struct irq_chip *chip = irq_data_get_irq_chip(data);
+	const struct irq_chip *chip = irq_data_get_irq_chip(data);
 	unsigned long mask;
 	int bit;
 
diff --git a/arch/sh/boards/mach-x3proto/gpio.c b/arch/sh/boards/mach-x3proto/gpio.c
index c13d51b29702..98f283aacb45 100644
--- a/arch/sh/boards/mach-x3proto/gpio.c
+++ b/arch/sh/boards/mach-x3proto/gpio.c
@@ -60,7 +60,7 @@ static int x3proto_gpio_to_irq(struct gpio_chip *chip, unsigned gpio)
 static void x3proto_gpio_irq_handler(struct irq_desc *desc)
 {
 	struct irq_data *data = irq_desc_get_irq_data(desc);
-	struct irq_chip *chip = irq_data_get_irq_chip(data);
+	const struct irq_chip *chip = irq_data_get_irq_chip(data);
 	unsigned long mask;
 	int pin;
 
diff --git a/arch/sh/kernel/cpu/irq/ipr.c b/arch/sh/kernel/cpu/irq/ipr.c
index d41bce71f211..3bfa28f7addc 100644
--- a/arch/sh/kernel/cpu/irq/ipr.c
+++ b/arch/sh/kernel/cpu/irq/ipr.c
@@ -23,7 +23,7 @@
 
 static inline struct ipr_desc *get_ipr_desc(struct irq_data *data)
 {
-	struct irq_chip *chip = irq_data_get_irq_chip(data);
+	const struct irq_chip *chip = irq_data_get_irq_chip(data);
 	return container_of(chip, struct ipr_desc, chip);
 }
 
diff --git a/arch/x86/kernel/apic/io_apic.c b/arch/x86/kernel/apic/io_apic.c
index 352ed5558cbc..2d7cec0690d7 100644
--- a/arch/x86/kernel/apic/io_apic.c
+++ b/arch/x86/kernel/apic/io_apic.c
@@ -1245,7 +1245,7 @@ void __init print_IO_APICs(void)
 	apic_dbg("IRQ to pin mappings:\n");
 	for_each_active_irq(irq) {
 		struct irq_pin_list *entry;
-		struct irq_chip *chip;
+		const struct irq_chip *chip;
 		struct mp_chip_data *data;
 
 		chip = irq_get_chip(irq);
diff --git a/drivers/clocksource/timer-clint.c b/drivers/clocksource/timer-clint.c
index 0bdd9d7ec545..f396f2369b3e 100644
--- a/drivers/clocksource/timer-clint.c
+++ b/drivers/clocksource/timer-clint.c
@@ -58,7 +58,7 @@ static void clint_clear_ipi(void)
 
 static void clint_ipi_interrupt(struct irq_desc *desc)
 {
-	struct irq_chip *chip = irq_desc_get_chip(desc);
+	const struct irq_chip *chip = irq_desc_get_chip(desc);
 
 	chained_irq_enter(chip, desc);
 
diff --git a/drivers/edac/altera_edac.c b/drivers/edac/altera_edac.c
index 4edd2088c2db..04cc91d4ca4a 100644
--- a/drivers/edac/altera_edac.c
+++ b/drivers/edac/altera_edac.c
@@ -1833,7 +1833,7 @@ static void altr_edac_a10_irq_handler(struct irq_desc *desc)
 {
 	int dberr, bit, sm_offset, irq_status;
 	struct altr_arria10_edac *edac = irq_desc_get_handler_data(desc);
-	struct irq_chip *chip = irq_desc_get_chip(desc);
+	const struct irq_chip *chip = irq_desc_get_chip(desc);
 	int irq = irq_desc_get_irq(desc);
 	unsigned long bits;
 
diff --git a/drivers/gpio/gpio-altera.c b/drivers/gpio/gpio-altera.c
index fe144360a88d..a9a124161477 100644
--- a/drivers/gpio/gpio-altera.c
+++ b/drivers/gpio/gpio-altera.c
@@ -112,7 +112,7 @@ static void altera_gpio_irq_edge_handler(struct irq_desc *desc)
 	struct gpio_chip *gc = irq_desc_get_handler_data(desc);
 	struct altera_gpio_chip *altera_gc = gpiochip_get_data(gc);
 	struct irq_domain *irqdomain = gc->irq.domain;
-	struct irq_chip *chip;
+	const struct irq_chip *chip;
 	unsigned long status;
 	int i;
 
@@ -136,7 +136,7 @@ static void altera_gpio_irq_leveL_high_handler(struct irq_desc *desc)
 	struct gpio_chip *gc = irq_desc_get_handler_data(desc);
 	struct altera_gpio_chip *altera_gc = gpiochip_get_data(gc);
 	struct irq_domain *irqdomain = gc->irq.domain;
-	struct irq_chip *chip;
+	const struct irq_chip *chip;
 	unsigned long status;
 	int i;
 
diff --git a/drivers/gpio/gpio-aspeed-sgpio.c b/drivers/gpio/gpio-aspeed-sgpio.c
index 4225261f61c8..d4a8a00b8b3d 100644
--- a/drivers/gpio/gpio-aspeed-sgpio.c
+++ b/drivers/gpio/gpio-aspeed-sgpio.c
@@ -366,7 +366,7 @@ static int aspeed_sgpio_set_type(struct irq_data *d, unsigned int type)
 static void aspeed_sgpio_irq_handler(struct irq_desc *desc)
 {
 	struct gpio_chip *gc = irq_desc_get_handler_data(desc);
-	struct irq_chip *ic = irq_desc_get_chip(desc);
+	const struct irq_chip *ic = irq_desc_get_chip(desc);
 	struct aspeed_sgpio *data = gpiochip_get_data(gc);
 	unsigned int i, p, banks;
 	unsigned long reg;
diff --git a/drivers/gpio/gpio-aspeed.c b/drivers/gpio/gpio-aspeed.c
index dc53b2decb66..26757b208a8a 100644
--- a/drivers/gpio/gpio-aspeed.c
+++ b/drivers/gpio/gpio-aspeed.c
@@ -628,7 +628,7 @@ static int aspeed_gpio_set_type(struct irq_data *d, unsigned int type)
 static void aspeed_gpio_irq_handler(struct irq_desc *desc)
 {
 	struct gpio_chip *gc = irq_desc_get_handler_data(desc);
-	struct irq_chip *ic = irq_desc_get_chip(desc);
+	const struct irq_chip *ic = irq_desc_get_chip(desc);
 	unsigned int i, p, banks;
 	unsigned long reg;
 	struct aspeed_gpio *gpio = gpiochip_get_data(gc);
diff --git a/drivers/gpio/gpio-ath79.c b/drivers/gpio/gpio-ath79.c
index 85bd994d15d4..3e3a13ae37cf 100644
--- a/drivers/gpio/gpio-ath79.c
+++ b/drivers/gpio/gpio-ath79.c
@@ -180,7 +180,7 @@ static const struct irq_chip ath79_gpio_irqchip = {
 static void ath79_gpio_irq_handler(struct irq_desc *desc)
 {
 	struct gpio_chip *gc = irq_desc_get_handler_data(desc);
-	struct irq_chip *irqchip = irq_desc_get_chip(desc);
+	const struct irq_chip *irqchip = irq_desc_get_chip(desc);
 	struct gpio_generic_chip *gen_gc = to_gpio_generic_chip(gc);
 	struct ath79_gpio_ctrl *ctrl =
 		container_of(gen_gc, struct ath79_gpio_ctrl, chip);
diff --git a/drivers/gpio/gpio-bcm-kona.c b/drivers/gpio/gpio-bcm-kona.c
index b1d32d590cf8..71b3a816e2fc 100644
--- a/drivers/gpio/gpio-bcm-kona.c
+++ b/drivers/gpio/gpio-bcm-kona.c
@@ -452,7 +452,7 @@ static void bcm_kona_gpio_irq_handler(struct irq_desc *desc)
 	int bit, bank_id;
 	unsigned long sta;
 	struct bcm_kona_gpio_bank *bank = irq_desc_get_handler_data(desc);
-	struct irq_chip *chip = irq_desc_get_chip(desc);
+	const struct irq_chip *chip = irq_desc_get_chip(desc);
 
 	chained_irq_enter(chip, desc);
 
diff --git a/drivers/gpio/gpio-blzp1600.c b/drivers/gpio/gpio-blzp1600.c
index 0f8c826ba876..84dd8cc3f24e 100644
--- a/drivers/gpio/gpio-blzp1600.c
+++ b/drivers/gpio/gpio-blzp1600.c
@@ -181,7 +181,7 @@ static const struct irq_chip blzp1600_gpio_irqchip = {
 static void blzp1600_gpio_irqhandler(struct irq_desc *desc)
 {
 	struct blzp1600_gpio *gpio = get_blzp1600_gpio_from_irq_desc(desc);
-	struct irq_chip *irqchip = irq_desc_get_chip(desc);
+	const struct irq_chip *irqchip = irq_desc_get_chip(desc);
 	unsigned long irq_status;
 	int hwirq = 0;
 
diff --git a/drivers/gpio/gpio-brcmstb.c b/drivers/gpio/gpio-brcmstb.c
index 44ca798cf832..56dfc0e3c4af 100644
--- a/drivers/gpio/gpio-brcmstb.c
+++ b/drivers/gpio/gpio-brcmstb.c
@@ -313,7 +313,7 @@ static void brcmstb_gpio_irq_bank_handler(struct brcmstb_gpio_bank *bank)
 static void brcmstb_gpio_irq_handler(struct irq_desc *desc)
 {
 	struct brcmstb_gpio_priv *priv = irq_desc_get_handler_data(desc);
-	struct irq_chip *chip = irq_desc_get_chip(desc);
+	const struct irq_chip *chip = irq_desc_get_chip(desc);
 	struct brcmstb_gpio_bank *bank;
 
 	/* Interrupts weren't properly cleared during probe */
diff --git a/drivers/gpio/gpio-cadence.c b/drivers/gpio/gpio-cadence.c
index d7790fc35c22..a2d136e6c347 100644
--- a/drivers/gpio/gpio-cadence.c
+++ b/drivers/gpio/gpio-cadence.c
@@ -143,7 +143,7 @@ static void cdns_gpio_irq_handler(struct irq_desc *desc)
 {
 	struct gpio_chip *chip = irq_desc_get_handler_data(desc);
 	struct cdns_gpio_chip *cgpio = gpiochip_get_data(chip);
-	struct irq_chip *irqchip = irq_desc_get_chip(desc);
+	const struct irq_chip *irqchip = irq_desc_get_chip(desc);
 	unsigned long status;
 	int hwirq;
 
diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
index c1f3d83a67c1..797a0ce61b15 100644
--- a/drivers/gpio/gpio-dwapb.c
+++ b/drivers/gpio/gpio-dwapb.c
@@ -223,7 +223,7 @@ static u32 dwapb_do_irq(struct dwapb_gpio *gpio)
 static void dwapb_irq_handler(struct irq_desc *desc)
 {
 	struct dwapb_gpio *gpio = irq_desc_get_handler_data(desc);
-	struct irq_chip *chip = irq_desc_get_chip(desc);
+	const struct irq_chip *chip = irq_desc_get_chip(desc);
 
 	chained_irq_enter(chip, desc);
 	dwapb_do_irq(gpio);
diff --git a/drivers/gpio/gpio-eic-sprd.c b/drivers/gpio/gpio-eic-sprd.c
index 50fafeda8d7e..b1a89bcbc64d 100644
--- a/drivers/gpio/gpio-eic-sprd.c
+++ b/drivers/gpio/gpio-eic-sprd.c
@@ -567,7 +567,7 @@ static void sprd_eic_handle_one_type(struct gpio_chip *chip)
 
 static void sprd_eic_irq_handler(struct irq_desc *desc)
 {
-	struct irq_chip *ic = irq_desc_get_chip(desc);
+	const struct irq_chip *ic = irq_desc_get_chip(desc);
 
 	chained_irq_enter(ic, desc);
 
diff --git a/drivers/gpio/gpio-ep93xx.c b/drivers/gpio/gpio-ep93xx.c
index 8784e433e1ff..aed03154e75e 100644
--- a/drivers/gpio/gpio-ep93xx.c
+++ b/drivers/gpio/gpio-ep93xx.c
@@ -107,7 +107,7 @@ static irqreturn_t ep93xx_ab_irq_handler(int irq, void *dev_id)
 
 static void ep93xx_gpio_f_irq_handler(struct irq_desc *desc)
 {
-	struct irq_chip *irqchip = irq_desc_get_chip(desc);
+	const struct irq_chip *irqchip = irq_desc_get_chip(desc);
 	struct gpio_chip *gc = irq_desc_get_handler_data(desc);
 	struct gpio_irq_chip *gic = &gc->irq;
 	unsigned int parent = irq_desc_get_irq(desc);
diff --git a/drivers/gpio/gpio-ftgpio010.c b/drivers/gpio/gpio-ftgpio010.c
index 11e6907c3b54..2d3cead63769 100644
--- a/drivers/gpio/gpio-ftgpio010.c
+++ b/drivers/gpio/gpio-ftgpio010.c
@@ -142,7 +142,7 @@ static void ftgpio_gpio_irq_handler(struct irq_desc *desc)
 {
 	struct gpio_chip *gc = irq_desc_get_handler_data(desc);
 	struct ftgpio_gpio *g = gpiochip_get_data(gc);
-	struct irq_chip *irqchip = irq_desc_get_chip(desc);
+	const struct irq_chip *irqchip = irq_desc_get_chip(desc);
 	int offset;
 	unsigned long stat;
 
diff --git a/drivers/gpio/gpio-hisi.c b/drivers/gpio/gpio-hisi.c
index d26298c8351b..4ce8cef83515 100644
--- a/drivers/gpio/gpio-hisi.c
+++ b/drivers/gpio/gpio-hisi.c
@@ -184,7 +184,7 @@ static void hisi_gpio_irq_handler(struct irq_desc *desc)
 	struct hisi_gpio *hisi_gpio = irq_desc_get_handler_data(desc);
 	unsigned long irq_msk = hisi_gpio_read_reg(&hisi_gpio->chip.gc,
 						   HISI_GPIO_INTSTATUS_WX);
-	struct irq_chip *irq_c = irq_desc_get_chip(desc);
+	const struct irq_chip *irq_c = irq_desc_get_chip(desc);
 	int hwirq;
 
 	chained_irq_enter(irq_c, desc);
diff --git a/drivers/gpio/gpio-hlwd.c b/drivers/gpio/gpio-hlwd.c
index 043ce5ef3b07..63a4e82378dc 100644
--- a/drivers/gpio/gpio-hlwd.c
+++ b/drivers/gpio/gpio-hlwd.c
@@ -61,7 +61,7 @@ static void hlwd_gpio_irqhandler(struct irq_desc *desc)
 {
 	struct hlwd_gpio *hlwd =
 		gpiochip_get_data(irq_desc_get_handler_data(desc));
-	struct irq_chip *chip = irq_desc_get_chip(desc);
+	const struct irq_chip *chip = irq_desc_get_chip(desc);
 	unsigned long pending;
 	int hwirq;
 	u32 emulated_pending;
diff --git a/drivers/gpio/gpio-idt3243x.c b/drivers/gpio/gpio-idt3243x.c
index 56f1f1e57b69..290f77504e00 100644
--- a/drivers/gpio/gpio-idt3243x.c
+++ b/drivers/gpio/gpio-idt3243x.c
@@ -29,7 +29,7 @@ static void idt_gpio_dispatch(struct irq_desc *desc)
 {
 	struct gpio_chip *gc = irq_desc_get_handler_data(desc);
 	struct idt_gpio_ctrl *ctrl = gpiochip_get_data(gc);
-	struct irq_chip *host_chip = irq_desc_get_chip(desc);
+	const struct irq_chip *host_chip = irq_desc_get_chip(desc);
 	unsigned int bit, virq;
 	unsigned long pending;
 
diff --git a/drivers/gpio/gpio-loongson-64bit.c b/drivers/gpio/gpio-loongson-64bit.c
index 0fdf15faa344..7046edd2f91a 100644
--- a/drivers/gpio/gpio-loongson-64bit.c
+++ b/drivers/gpio/gpio-loongson-64bit.c
@@ -218,7 +218,7 @@ static int loongson_gpio_irq_set_type(struct irq_data *data, unsigned int type)
 static void loongson_gpio_ls2k0300_irq_handler(struct irq_desc *desc)
 {
 	struct loongson_gpio_chip *lgpio = irq_desc_get_handler_data(desc);
-	struct irq_chip *girqchip = irq_desc_get_chip(desc);
+	const struct irq_chip *girqchip = irq_desc_get_chip(desc);
 	int i;
 
 	chained_irq_enter(girqchip, desc);
diff --git a/drivers/gpio/gpio-mpfs.c b/drivers/gpio/gpio-mpfs.c
index 1a4cf213c723..c4e0abcf48c2 100644
--- a/drivers/gpio/gpio-mpfs.c
+++ b/drivers/gpio/gpio-mpfs.c
@@ -181,7 +181,7 @@ static const struct irq_chip mpfs_gpio_irqchip = {
 
 static void mpfs_gpio_irq_handler(struct irq_desc *desc)
 {
-	struct irq_chip *irqchip = irq_desc_get_chip(desc);
+	const struct irq_chip *irqchip = irq_desc_get_chip(desc);
 	struct mpfs_gpio_chip *mpfs_gpio = irq_desc_get_handler_data(desc);
 	unsigned long status;
 	u32 val;
diff --git a/drivers/gpio/gpio-mvebu.c b/drivers/gpio/gpio-mvebu.c
index 22c36b79e249..af451d17dbdb 100644
--- a/drivers/gpio/gpio-mvebu.c
+++ b/drivers/gpio/gpio-mvebu.c
@@ -554,7 +554,7 @@ static int mvebu_gpio_irq_set_type(struct irq_data *d, unsigned int type)
 static void mvebu_gpio_irq_handler(struct irq_desc *desc)
 {
 	struct mvebu_gpio_chip *mvchip = irq_desc_get_handler_data(desc);
-	struct irq_chip *chip = irq_desc_get_chip(desc);
+	const struct irq_chip *chip = irq_desc_get_chip(desc);
 	u32 cause, type, data_in, level_mask, edge_cause, edge_mask;
 	int i;
 
diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
index 647b6f4861b7..ea13bce4f46b 100644
--- a/drivers/gpio/gpio-mxc.c
+++ b/drivers/gpio/gpio-mxc.c
@@ -273,7 +273,7 @@ static void mx3_gpio_irq_handler(struct irq_desc *desc)
 {
 	u32 irq_stat;
 	struct mxc_gpio_port *port = irq_desc_get_handler_data(desc);
-	struct irq_chip *chip = irq_desc_get_chip(desc);
+	const struct irq_chip *chip = irq_desc_get_chip(desc);
 
 	if (port->is_pad_wakeup)
 		return;
@@ -292,7 +292,7 @@ static void mx2_gpio_irq_handler(struct irq_desc *desc)
 {
 	u32 irq_msk, irq_stat;
 	struct mxc_gpio_port *port;
-	struct irq_chip *chip = irq_desc_get_chip(desc);
+	const struct irq_chip *chip = irq_desc_get_chip(desc);
 
 	chained_irq_enter(chip, desc);
 
diff --git a/drivers/gpio/gpio-npcm-sgpio.c b/drivers/gpio/gpio-npcm-sgpio.c
index 83c77a2c0623..74f1a6bdd0cc 100644
--- a/drivers/gpio/gpio-npcm-sgpio.c
+++ b/drivers/gpio/gpio-npcm-sgpio.c
@@ -432,7 +432,7 @@ static int npcm_sgpio_set_type(struct irq_data *d, unsigned int type)
 static void npcm_sgpio_irq_handler(struct irq_desc *desc)
 {
 	struct gpio_chip *gc = irq_desc_get_handler_data(desc);
-	struct irq_chip *ic = irq_desc_get_chip(desc);
+	const struct irq_chip *ic = irq_desc_get_chip(desc);
 	struct npcm_sgpio *gpio = gpiochip_get_data(gc);
 	unsigned int i, j;
 	unsigned long reg;
diff --git a/drivers/gpio/gpio-pl061.c b/drivers/gpio/gpio-pl061.c
index 919cf86fd590..cfdb85fef206 100644
--- a/drivers/gpio/gpio-pl061.c
+++ b/drivers/gpio/gpio-pl061.c
@@ -214,7 +214,7 @@ static void pl061_irq_handler(struct irq_desc *desc)
 	int offset;
 	struct gpio_chip *gc = irq_desc_get_handler_data(desc);
 	struct pl061 *pl061 = gpiochip_get_data(gc);
-	struct irq_chip *irqchip = irq_desc_get_chip(desc);
+	const struct irq_chip *irqchip = irq_desc_get_chip(desc);
 
 	chained_irq_enter(irqchip, desc);
 
diff --git a/drivers/gpio/gpio-rda.c b/drivers/gpio/gpio-rda.c
index 7bbc6f0ce4c8..c549cac912b2 100644
--- a/drivers/gpio/gpio-rda.c
+++ b/drivers/gpio/gpio-rda.c
@@ -180,7 +180,7 @@ static int rda_gpio_irq_set_type(struct irq_data *data, unsigned int flow_type)
 static void rda_gpio_irq_handler(struct irq_desc *desc)
 {
 	struct gpio_chip *chip = irq_desc_get_handler_data(desc);
-	struct irq_chip *ic = irq_desc_get_chip(desc);
+	const struct irq_chip *ic = irq_desc_get_chip(desc);
 	struct rda_gpio *rda_gpio = gpiochip_get_data(chip);
 	unsigned long status;
 	u32 n;
diff --git a/drivers/gpio/gpio-realtek-otto.c b/drivers/gpio/gpio-realtek-otto.c
index 5e3152c2e51a..2769dac38d22 100644
--- a/drivers/gpio/gpio-realtek-otto.c
+++ b/drivers/gpio/gpio-realtek-otto.c
@@ -252,7 +252,7 @@ static void realtek_gpio_irq_handler(struct irq_desc *desc)
 {
 	struct gpio_chip *gc = irq_desc_get_handler_data(desc);
 	struct realtek_gpio_ctrl *ctrl = gpiochip_get_data(gc);
-	struct irq_chip *irq_chip = irq_desc_get_chip(desc);
+	const struct irq_chip *irq_chip = irq_desc_get_chip(desc);
 	unsigned long status;
 	int offset;
 
diff --git a/drivers/gpio/gpio-rockchip.c b/drivers/gpio/gpio-rockchip.c
index 44d7ebd12724..23c914869c3e 100644
--- a/drivers/gpio/gpio-rockchip.c
+++ b/drivers/gpio/gpio-rockchip.c
@@ -332,7 +332,7 @@ static const struct gpio_chip rockchip_gpiolib_chip = {
 
 static void rockchip_irq_demux(struct irq_desc *desc)
 {
-	struct irq_chip *chip = irq_desc_get_chip(desc);
+	const struct irq_chip *chip = irq_desc_get_chip(desc);
 	struct rockchip_pin_bank *bank = irq_desc_get_handler_data(desc);
 	unsigned long pending;
 	unsigned int irq;
diff --git a/drivers/gpio/gpio-rtd.c b/drivers/gpio/gpio-rtd.c
index d46b40dd5283..c54963f5a186 100644
--- a/drivers/gpio/gpio-rtd.c
+++ b/drivers/gpio/gpio-rtd.c
@@ -378,7 +378,7 @@ static void rtd_gpio_irq_handle(struct irq_desc *desc)
 	int (*get_reg_offset)(struct rtd_gpio *gpio, unsigned int offset);
 	struct rtd_gpio *data = irq_desc_get_handler_data(desc);
 	struct irq_domain *domain = data->gpio_chip.irq.domain;
-	struct irq_chip *chip = irq_desc_get_chip(desc);
+	const struct irq_chip *chip = irq_desc_get_chip(desc);
 	unsigned int irq = irq_desc_get_irq(desc);
 	unsigned long status;
 	int reg_offset, i, j;
diff --git a/drivers/gpio/gpio-sprd.c b/drivers/gpio/gpio-sprd.c
index 2cc8abe705cd..d682da2d0caa 100644
--- a/drivers/gpio/gpio-sprd.c
+++ b/drivers/gpio/gpio-sprd.c
@@ -191,7 +191,7 @@ static int sprd_gpio_irq_set_type(struct irq_data *data,
 static void sprd_gpio_irq_handler(struct irq_desc *desc)
 {
 	struct gpio_chip *chip = irq_desc_get_handler_data(desc);
-	struct irq_chip *ic = irq_desc_get_chip(desc);
+	const struct irq_chip *ic = irq_desc_get_chip(desc);
 	struct sprd_gpio *sprd_gpio = gpiochip_get_data(chip);
 	u32 bank, n;
 
diff --git a/drivers/gpio/gpio-tangier.c b/drivers/gpio/gpio-tangier.c
index ba5a8ede8912..3bab9dd5668d 100644
--- a/drivers/gpio/gpio-tangier.c
+++ b/drivers/gpio/gpio-tangier.c
@@ -346,7 +346,7 @@ static void tng_irq_handler(struct irq_desc *desc)
 {
 	struct gpio_chip *gc = irq_desc_get_handler_data(desc);
 	struct tng_gpio *priv = gpiochip_get_data(gc);
-	struct irq_chip *irqchip = irq_desc_get_chip(desc);
+	const struct irq_chip *irqchip = irq_desc_get_chip(desc);
 	unsigned long base, gpio;
 
 	chained_irq_enter(irqchip, desc);
diff --git a/drivers/gpio/gpio-tegra.c b/drivers/gpio/gpio-tegra.c
index df06b56a2ade..312d967c3df9 100644
--- a/drivers/gpio/gpio-tegra.c
+++ b/drivers/gpio/gpio-tegra.c
@@ -380,7 +380,7 @@ static void tegra_gpio_irq_shutdown(struct irq_data *d)
 static void tegra_gpio_irq_handler(struct irq_desc *desc)
 {
 	struct tegra_gpio_info *tgi = irq_desc_get_handler_data(desc);
-	struct irq_chip *chip = irq_desc_get_chip(desc);
+	const struct irq_chip *chip = irq_desc_get_chip(desc);
 	struct irq_domain *domain = tgi->gc.irq.domain;
 	unsigned int irq = irq_desc_get_irq(desc);
 	struct tegra_gpio_bank *bank = NULL;
diff --git a/drivers/gpio/gpio-tegra186.c b/drivers/gpio/gpio-tegra186.c
index d9a2dedf50ea..eb7c01b0b918 100644
--- a/drivers/gpio/gpio-tegra186.c
+++ b/drivers/gpio/gpio-tegra186.c
@@ -662,7 +662,7 @@ static void tegra186_gpio_irq(struct irq_desc *desc)
 {
 	struct tegra_gpio *gpio = irq_desc_get_handler_data(desc);
 	struct irq_domain *domain = gpio->gpio.irq.domain;
-	struct irq_chip *chip = irq_desc_get_chip(desc);
+	const struct irq_chip *chip = irq_desc_get_chip(desc);
 	unsigned int parent = irq_desc_get_irq(desc);
 	unsigned int i, j, offset = 0;
 
diff --git a/drivers/gpio/gpio-tqmx86.c b/drivers/gpio/gpio-tqmx86.c
index eedfc0e371e3..7d4e7326016d 100644
--- a/drivers/gpio/gpio-tqmx86.c
+++ b/drivers/gpio/gpio-tqmx86.c
@@ -226,7 +226,7 @@ static void tqmx86_gpio_irq_handler(struct irq_desc *desc)
 {
 	struct gpio_chip *chip = irq_desc_get_handler_data(desc);
 	struct tqmx86_gpio_data *gpio = gpiochip_get_data(chip);
-	struct irq_chip *irq_chip = irq_desc_get_chip(desc);
+	const struct irq_chip *irq_chip = irq_desc_get_chip(desc);
 	unsigned long irq_bits;
 	int i, hwirq;
 	u8 irq_status;
diff --git a/drivers/gpio/gpio-vf610.c b/drivers/gpio/gpio-vf610.c
index aa8586d8a787..36022534c00c 100644
--- a/drivers/gpio/gpio-vf610.c
+++ b/drivers/gpio/gpio-vf610.c
@@ -98,7 +98,7 @@ static void vf610_gpio_irq_handler(struct irq_desc *desc)
 {
 	struct vf610_gpio_port *port =
 		gpiochip_get_data(irq_desc_get_handler_data(desc));
-	struct irq_chip *chip = irq_desc_get_chip(desc);
+	const struct irq_chip *chip = irq_desc_get_chip(desc);
 	int pin;
 	unsigned long irq_isfr;
 
diff --git a/drivers/gpio/gpio-xilinx.c b/drivers/gpio/gpio-xilinx.c
index 532205175827..e9f2dab9ec9d 100644
--- a/drivers/gpio/gpio-xilinx.c
+++ b/drivers/gpio/gpio-xilinx.c
@@ -478,7 +478,7 @@ static void xgpio_irqhandler(struct irq_desc *desc)
 {
 	struct xgpio_instance *chip = irq_desc_get_handler_data(desc);
 	struct gpio_chip *gc = &chip->gc;
-	struct irq_chip *irqchip = irq_desc_get_chip(desc);
+	const struct irq_chip *irqchip = irq_desc_get_chip(desc);
 	DECLARE_BITMAP(rising, 64);
 	DECLARE_BITMAP(falling, 64);
 	DECLARE_BITMAP(hw, 64);
diff --git a/drivers/gpio/gpio-xlp.c b/drivers/gpio/gpio-xlp.c
index aede6324387f..d9bb7fd266e5 100644
--- a/drivers/gpio/gpio-xlp.c
+++ b/drivers/gpio/gpio-xlp.c
@@ -182,7 +182,7 @@ static struct irq_chip xlp_gpio_irq_chip = {
 static void xlp_gpio_generic_handler(struct irq_desc *desc)
 {
 	struct xlp_gpio_priv *priv = irq_desc_get_handler_data(desc);
-	struct irq_chip *irqchip = irq_desc_get_chip(desc);
+	const struct irq_chip *irqchip = irq_desc_get_chip(desc);
 	int gpio, regoff;
 	u32 gpio_stat;
 
diff --git a/drivers/gpio/gpio-zynq.c b/drivers/gpio/gpio-zynq.c
index 8118ae3412c2..78608e3921bf 100644
--- a/drivers/gpio/gpio-zynq.c
+++ b/drivers/gpio/gpio-zynq.c
@@ -657,7 +657,7 @@ static void zynq_gpio_irqhandler(struct irq_desc *desc)
 	unsigned int bank_num;
 	struct zynq_gpio *gpio =
 		gpiochip_get_data(irq_desc_get_handler_data(desc));
-	struct irq_chip *irqchip = irq_desc_get_chip(desc);
+	const struct irq_chip *irqchip = irq_desc_get_chip(desc);
 
 	chained_irq_enter(irqchip, desc);
 
diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 9087c4b290db..46c0b04be03a 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -76,7 +76,7 @@ static int msm_mdss_parse_data_bus_icc_path(struct device *dev,
 static void msm_mdss_irq(struct irq_desc *desc)
 {
 	struct msm_mdss *msm_mdss = irq_desc_get_handler_data(desc);
-	struct irq_chip *chip = irq_desc_get_chip(desc);
+	const struct irq_chip *chip = irq_desc_get_chip(desc);
 	u32 interrupts;
 
 	chained_irq_enter(chip, desc);
diff --git a/drivers/gpu/ipu-v3/ipu-common.c b/drivers/gpu/ipu-v3/ipu-common.c
index 5db100bb1e4d..c8b2e33074aa 100644
--- a/drivers/gpu/ipu-v3/ipu-common.c
+++ b/drivers/gpu/ipu-v3/ipu-common.c
@@ -981,7 +981,7 @@ static void ipu_irq_handle(struct ipu_soc *ipu, const int *regs, int num_regs)
 static void ipu_irq_handler(struct irq_desc *desc)
 {
 	struct ipu_soc *ipu = irq_desc_get_handler_data(desc);
-	struct irq_chip *chip = irq_desc_get_chip(desc);
+	const struct irq_chip *chip = irq_desc_get_chip(desc);
 	static const int int_reg[] = { 0, 1, 2, 3, 10, 11, 12, 13, 14};
 
 	chained_irq_enter(chip, desc);
@@ -994,7 +994,7 @@ static void ipu_irq_handler(struct irq_desc *desc)
 static void ipu_err_irq_handler(struct irq_desc *desc)
 {
 	struct ipu_soc *ipu = irq_desc_get_handler_data(desc);
-	struct irq_chip *chip = irq_desc_get_chip(desc);
+	const struct irq_chip *chip = irq_desc_get_chip(desc);
 	static const int int_reg[] = { 4, 5, 8, 9};
 
 	chained_irq_enter(chip, desc);
diff --git a/drivers/iio/adc/stm32-adc-core.c b/drivers/iio/adc/stm32-adc-core.c
index a42d82d61cb8..446e505bc03a 100644
--- a/drivers/iio/adc/stm32-adc-core.c
+++ b/drivers/iio/adc/stm32-adc-core.c
@@ -354,7 +354,7 @@ static unsigned int stm32_adc_eoc_enabled(struct stm32_adc_priv *priv,
 static void stm32_adc_irq_handler(struct irq_desc *desc)
 {
 	struct stm32_adc_priv *priv = irq_desc_get_handler_data(desc);
-	struct irq_chip *chip = irq_desc_get_chip(desc);
+	const struct irq_chip *chip = irq_desc_get_chip(desc);
 	int i;
 	u32 status;
 
diff --git a/drivers/iio/industrialio-trigger.c b/drivers/iio/industrialio-trigger.c
index 17781c12bc85..2d0460096cab 100644
--- a/drivers/iio/industrialio-trigger.c
+++ b/drivers/iio/industrialio-trigger.c
@@ -534,7 +534,7 @@ static const struct device_type iio_trig_type = {
 
 static void iio_trig_subirqmask(struct irq_data *d)
 {
-	struct irq_chip *chip = irq_data_get_irq_chip(d);
+	const struct irq_chip *chip = irq_data_get_irq_chip(d);
 	struct iio_trigger *trig = container_of(chip, struct iio_trigger, subirq_chip);
 
 	trig->subirqs[d->irq - trig->subirq_base].enabled = false;
@@ -542,7 +542,7 @@ static void iio_trig_subirqmask(struct irq_data *d)
 
 static void iio_trig_subirqunmask(struct irq_data *d)
 {
-	struct irq_chip *chip = irq_data_get_irq_chip(d);
+	const struct irq_chip *chip = irq_data_get_irq_chip(d);
 	struct iio_trigger *trig = container_of(chip, struct iio_trigger, subirq_chip);
 
 	trig->subirqs[d->irq - trig->subirq_base].enabled = true;
diff --git a/drivers/irqchip/exynos-combiner.c b/drivers/irqchip/exynos-combiner.c
index 03cafcc5c835..5cc2f409f998 100644
--- a/drivers/irqchip/exynos-combiner.c
+++ b/drivers/irqchip/exynos-combiner.c
@@ -65,7 +65,7 @@ static void combiner_unmask_irq(struct irq_data *data)
 static void combiner_handle_cascade_irq(struct irq_desc *desc)
 {
 	struct combiner_chip_data *chip_data = irq_desc_get_handler_data(desc);
-	struct irq_chip *chip = irq_desc_get_chip(desc);
+	const struct irq_chip *chip = irq_desc_get_chip(desc);
 	unsigned int combiner_irq;
 	unsigned long status;
 	int ret;
@@ -94,7 +94,7 @@ static int combiner_set_affinity(struct irq_data *d,
 				 const struct cpumask *mask_val, bool force)
 {
 	struct combiner_chip_data *chip_data = irq_data_get_irq_chip_data(d);
-	struct irq_chip *chip = irq_get_chip(chip_data->parent_irq);
+	const struct irq_chip *chip = irq_get_chip(chip_data->parent_irq);
 	struct irq_data *data = irq_get_irq_data(chip_data->parent_irq);
 
 	if (chip && chip->irq_set_affinity)
diff --git a/drivers/irqchip/irq-aclint-sswi.c b/drivers/irqchip/irq-aclint-sswi.c
index ca06efd86fa1..cb1c5de8e395 100644
--- a/drivers/irqchip/irq-aclint-sswi.c
+++ b/drivers/irqchip/irq-aclint-sswi.c
@@ -31,7 +31,7 @@ static void aclint_sswi_ipi_clear(void)
 
 static void aclint_sswi_ipi_handle(struct irq_desc *desc)
 {
-	struct irq_chip *chip = irq_desc_get_chip(desc);
+	const struct irq_chip *chip = irq_desc_get_chip(desc);
 
 	chained_irq_enter(chip, desc);
 
diff --git a/drivers/irqchip/irq-al-fic.c b/drivers/irqchip/irq-al-fic.c
index d10ac9b63c99..f8aff8ed553d 100644
--- a/drivers/irqchip/irq-al-fic.c
+++ b/drivers/irqchip/irq-al-fic.c
@@ -99,7 +99,7 @@ static void al_fic_irq_handler(struct irq_desc *desc)
 {
 	struct al_fic *fic = irq_desc_get_handler_data(desc);
 	struct irq_domain *domain = fic->domain;
-	struct irq_chip *irqchip = irq_desc_get_chip(desc);
+	const struct irq_chip *irqchip = irq_desc_get_chip(desc);
 	struct irq_chip_generic *gc = irq_get_domain_generic_chip(domain, 0);
 	unsigned long pending;
 	u32 hwirq;
diff --git a/drivers/irqchip/irq-armada-370-xp.c b/drivers/irqchip/irq-armada-370-xp.c
index 1ba82ac0c26b..dc754c2e90d3 100644
--- a/drivers/irqchip/irq-armada-370-xp.c
+++ b/drivers/irqchip/irq-armada-370-xp.c
@@ -670,7 +670,7 @@ static inline void mpic_handle_ipi_irq(struct mpic *mpic) {}
 static void mpic_handle_cascade_irq(struct irq_desc *desc)
 {
 	struct mpic *mpic = irq_desc_get_handler_data(desc);
-	struct irq_chip *chip = irq_desc_get_chip(desc);
+	const struct irq_chip *chip = irq_desc_get_chip(desc);
 	unsigned long cause;
 	u32 irqsrc, cpuid;
 	irq_hw_number_t i;
diff --git a/drivers/irqchip/irq-aspeed-i2c-ic.c b/drivers/irqchip/irq-aspeed-i2c-ic.c
index 7996fd5cbae6..9710f183a8a2 100644
--- a/drivers/irqchip/irq-aspeed-i2c-ic.c
+++ b/drivers/irqchip/irq-aspeed-i2c-ic.c
@@ -32,7 +32,7 @@ struct aspeed_i2c_ic {
 static void aspeed_i2c_ic_irq_handler(struct irq_desc *desc)
 {
 	struct aspeed_i2c_ic *i2c_ic = irq_desc_get_handler_data(desc);
-	struct irq_chip *chip = irq_desc_get_chip(desc);
+	const struct irq_chip *chip = irq_desc_get_chip(desc);
 	unsigned long bit, status;
 
 	chained_irq_enter(chip, desc);
diff --git a/drivers/irqchip/irq-aspeed-scu-ic.c b/drivers/irqchip/irq-aspeed-scu-ic.c
index 097cf45b2126..146d4b35e625 100644
--- a/drivers/irqchip/irq-aspeed-scu-ic.c
+++ b/drivers/irqchip/irq-aspeed-scu-ic.c
@@ -66,7 +66,7 @@ static inline bool scu_has_split_isr(struct aspeed_scu_ic *scu)
 static void aspeed_scu_ic_irq_handler_combined(struct irq_desc *desc)
 {
 	struct aspeed_scu_ic *scu_ic = irq_desc_get_handler_data(desc);
-	struct irq_chip *chip = irq_desc_get_chip(desc);
+	const struct irq_chip *chip = irq_desc_get_chip(desc);
 	unsigned long bit, enabled, max, status;
 	unsigned int sts, mask;
 
@@ -102,7 +102,7 @@ static void aspeed_scu_ic_irq_handler_combined(struct irq_desc *desc)
 static void aspeed_scu_ic_irq_handler_split(struct irq_desc *desc)
 {
 	struct aspeed_scu_ic *scu_ic = irq_desc_get_handler_data(desc);
-	struct irq_chip *chip = irq_desc_get_chip(desc);
+	const struct irq_chip *chip = irq_desc_get_chip(desc);
 	unsigned long bit, enabled, max, status;
 	unsigned int sts;
 
diff --git a/drivers/irqchip/irq-ast2700-intc1.c b/drivers/irqchip/irq-ast2700-intc1.c
index 59e8f0d5ddcd..e09777d1efb0 100644
--- a/drivers/irqchip/irq-ast2700-intc1.c
+++ b/drivers/irqchip/irq-ast2700-intc1.c
@@ -51,7 +51,7 @@ static void aspeed_intc1_disable_int(struct aspeed_intc1 *intc1)
 static void aspeed_intc1_irq_handler(struct irq_desc *desc)
 {
 	struct aspeed_intc1 *intc1 = irq_desc_get_handler_data(desc);
-	struct irq_chip *chip = irq_desc_get_chip(desc);
+	const struct irq_chip *chip = irq_desc_get_chip(desc);
 	unsigned long bit, status;
 
 	chained_irq_enter(chip, desc);
diff --git a/drivers/irqchip/irq-ath79-misc.c b/drivers/irqchip/irq-ath79-misc.c
index 258b8e9a2d57..d1cf66513af2 100644
--- a/drivers/irqchip/irq-ath79-misc.c
+++ b/drivers/irqchip/irq-ath79-misc.c
@@ -34,7 +34,7 @@ EXPORT_SYMBOL_GPL(get_c0_perfcount_int);
 static void ath79_misc_irq_handler(struct irq_desc *desc)
 {
 	struct irq_domain *domain = irq_desc_get_handler_data(desc);
-	struct irq_chip *chip = irq_desc_get_chip(desc);
+	const struct irq_chip *chip = irq_desc_get_chip(desc);
 	void __iomem *base = domain->host_data;
 	u32 pending;
 
diff --git a/drivers/irqchip/irq-bcm2836.c b/drivers/irqchip/irq-bcm2836.c
index fafd1f71348e..8529f8a40a86 100644
--- a/drivers/irqchip/irq-bcm2836.c
+++ b/drivers/irqchip/irq-bcm2836.c
@@ -155,7 +155,7 @@ static struct irq_domain *ipi_domain;
 
 static void bcm2836_arm_irqchip_handle_ipi(struct irq_desc *desc)
 {
-	struct irq_chip *chip = irq_desc_get_chip(desc);
+	const struct irq_chip *chip = irq_desc_get_chip(desc);
 	int cpu = smp_processor_id();
 	u32 mbox_val;
 
diff --git a/drivers/irqchip/irq-bcm6345-l1.c b/drivers/irqchip/irq-bcm6345-l1.c
index d446d8124a8b..c0db2d8df0f8 100644
--- a/drivers/irqchip/irq-bcm6345-l1.c
+++ b/drivers/irqchip/irq-bcm6345-l1.c
@@ -117,7 +117,7 @@ static void bcm6345_l1_irq_handle(struct irq_desc *desc)
 {
 	struct bcm6345_l1_cpu *cpu = irq_desc_get_handler_data(desc);
 	struct bcm6345_l1_chip *intc = cpu->intc;
-	struct irq_chip *chip = irq_desc_get_chip(desc);
+	const struct irq_chip *chip = irq_desc_get_chip(desc);
 	unsigned int idx;
 
 	chained_irq_enter(chip, desc);
diff --git a/drivers/irqchip/irq-bcm7038-l1.c b/drivers/irqchip/irq-bcm7038-l1.c
index 54a8557ef557..1cc0a7979aa8 100644
--- a/drivers/irqchip/irq-bcm7038-l1.c
+++ b/drivers/irqchip/irq-bcm7038-l1.c
@@ -114,7 +114,7 @@ static void bcm7038_l1_irq_handle(struct irq_desc *desc)
 {
 	struct bcm7038_l1_chip *intc = irq_desc_get_handler_data(desc);
 	struct bcm7038_l1_cpu *cpu;
-	struct irq_chip *chip = irq_desc_get_chip(desc);
+	const struct irq_chip *chip = irq_desc_get_chip(desc);
 	unsigned int idx;
 
 #if defined(CONFIG_SMP) && defined(CONFIG_MIPS)
diff --git a/drivers/irqchip/irq-bcm7120-l2.c b/drivers/irqchip/irq-bcm7120-l2.c
index a98f0ee46b6c..2013be3496ba 100644
--- a/drivers/irqchip/irq-bcm7120-l2.c
+++ b/drivers/irqchip/irq-bcm7120-l2.c
@@ -56,7 +56,7 @@ static void bcm7120_l2_intc_irq_handle(struct irq_desc *desc)
 {
 	struct bcm7120_l1_intc_data *data = irq_desc_get_handler_data(desc);
 	struct bcm7120_l2_intc_data *b = data->b;
-	struct irq_chip *chip = irq_desc_get_chip(desc);
+	const struct irq_chip *chip = irq_desc_get_chip(desc);
 	unsigned int idx;
 
 	chained_irq_enter(chip, desc);
diff --git a/drivers/irqchip/irq-brcmstb-l2.c b/drivers/irqchip/irq-brcmstb-l2.c
index d336ac822ea0..1de83d41999e 100644
--- a/drivers/irqchip/irq-brcmstb-l2.c
+++ b/drivers/irqchip/irq-brcmstb-l2.c
@@ -64,7 +64,7 @@ struct brcmstb_l2_intc_data {
 static void brcmstb_l2_intc_irq_handle(struct irq_desc *desc)
 {
 	struct brcmstb_l2_intc_data *b = irq_desc_get_handler_data(desc);
-	struct irq_chip *chip = irq_desc_get_chip(desc);
+	const struct irq_chip *chip = irq_desc_get_chip(desc);
 	unsigned int irq;
 	u32 status;
 
diff --git a/drivers/irqchip/irq-dw-apb-ictl.c b/drivers/irqchip/irq-dw-apb-ictl.c
index 4240a0dbf627..f11b9673807c 100644
--- a/drivers/irqchip/irq-dw-apb-ictl.c
+++ b/drivers/irqchip/irq-dw-apb-ictl.c
@@ -51,7 +51,7 @@ static void __irq_entry dw_apb_ictl_handle_irq(struct pt_regs *regs)
 static void dw_apb_ictl_handle_irq_cascaded(struct irq_desc *desc)
 {
 	struct irq_domain *d = irq_desc_get_handler_data(desc);
-	struct irq_chip *chip = irq_desc_get_chip(desc);
+	const struct irq_chip *chip = irq_desc_get_chip(desc);
 	int n;
 
 	chained_irq_enter(chip, desc);
diff --git a/drivers/irqchip/irq-econet-en751221.c b/drivers/irqchip/irq-econet-en751221.c
index 2ca5d901866f..50c0d2846ac4 100644
--- a/drivers/irqchip/irq-econet-en751221.c
+++ b/drivers/irqchip/irq-econet-en751221.c
@@ -136,7 +136,7 @@ static void econet_intc_handle_pending(struct irq_domain *d, u32 pending, u32 of
 
 static void econet_intc_from_parent(struct irq_desc *desc)
 {
-	struct irq_chip *chip = irq_desc_get_chip(desc);
+	const struct irq_chip *chip = irq_desc_get_chip(desc);
 	struct irq_domain *domain;
 	u32 pending0, pending1;
 
diff --git a/drivers/irqchip/irq-gic.c b/drivers/irqchip/irq-gic.c
index ec70c84e9f91..ea628ba5a5b2 100644
--- a/drivers/irqchip/irq-gic.c
+++ b/drivers/irqchip/irq-gic.c
@@ -374,7 +374,7 @@ static void __exception_irq_entry gic_handle_irq(struct pt_regs *regs)
 static void gic_handle_cascade_irq(struct irq_desc *desc)
 {
 	struct gic_chip_data *chip_data = irq_desc_get_handler_data(desc);
-	struct irq_chip *chip = irq_desc_get_chip(desc);
+	const struct irq_chip *chip = irq_desc_get_chip(desc);
 	unsigned int gic_irq;
 	unsigned long status;
 	int ret;
diff --git a/drivers/irqchip/irq-goldfish-pic.c b/drivers/irqchip/irq-goldfish-pic.c
index d458cf898f8e..6e8acd0c01ef 100644
--- a/drivers/irqchip/irq-goldfish-pic.c
+++ b/drivers/irqchip/irq-goldfish-pic.c
@@ -33,7 +33,7 @@ struct goldfish_pic_data {
 static void goldfish_pic_cascade(struct irq_desc *desc)
 {
 	struct goldfish_pic_data *gfpic = irq_desc_get_handler_data(desc);
-	struct irq_chip *host_chip = irq_desc_get_chip(desc);
+	const struct irq_chip *host_chip = irq_desc_get_chip(desc);
 	u32 pending, hwirq;
 
 	chained_irq_enter(host_chip, desc);
diff --git a/drivers/irqchip/irq-idt3243x.c b/drivers/irqchip/irq-idt3243x.c
index 8b150c7f7e46..a1e9ee3989d2 100644
--- a/drivers/irqchip/irq-idt3243x.c
+++ b/drivers/irqchip/irq-idt3243x.c
@@ -27,7 +27,7 @@ struct idt_pic_data {
 static void idt_irq_dispatch(struct irq_desc *desc)
 {
 	struct idt_pic_data *idtpic = irq_desc_get_handler_data(desc);
-	struct irq_chip *host_chip = irq_desc_get_chip(desc);
+	const struct irq_chip *host_chip = irq_desc_get_chip(desc);
 	u32 pending, hwirq;
 
 	chained_irq_enter(host_chip, desc);
diff --git a/drivers/irqchip/irq-imx-mu-msi.c b/drivers/irqchip/irq-imx-mu-msi.c
index c598f2f52fc6..adc714a1cc4d 100644
--- a/drivers/irqchip/irq-imx-mu-msi.c
+++ b/drivers/irqchip/irq-imx-mu-msi.c
@@ -191,7 +191,7 @@ static const struct irq_domain_ops imx_mu_msi_domain_ops = {
 static void imx_mu_msi_irq_handler(struct irq_desc *desc)
 {
 	struct imx_mu_msi *msi_data = irq_desc_get_handler_data(desc);
-	struct irq_chip *chip = irq_desc_get_chip(desc);
+	const struct irq_chip *chip = irq_desc_get_chip(desc);
 	u32 status;
 	int i;
 
diff --git a/drivers/irqchip/irq-ingenic-tcu.c b/drivers/irqchip/irq-ingenic-tcu.c
index eebfdf107bd9..ec672dc1c99b 100644
--- a/drivers/irqchip/irq-ingenic-tcu.c
+++ b/drivers/irqchip/irq-ingenic-tcu.c
@@ -23,7 +23,7 @@ struct ingenic_tcu {
 
 static void ingenic_tcu_intc_cascade(struct irq_desc *desc)
 {
-	struct irq_chip *irq_chip = irq_data_get_irq_chip(&desc->irq_data);
+	const struct irq_chip *irq_chip = irq_data_get_irq_chip(&desc->irq_data);
 	struct irq_domain *domain = irq_desc_get_handler_data(desc);
 	struct irq_chip_generic *gc = irq_get_domain_generic_chip(domain, 0);
 	struct regmap *map = gc->private;
diff --git a/drivers/irqchip/irq-lan966x-oic.c b/drivers/irqchip/irq-lan966x-oic.c
index 11d3a0ffa261..f5ab5f43cfd2 100644
--- a/drivers/irqchip/irq-lan966x-oic.c
+++ b/drivers/irqchip/irq-lan966x-oic.c
@@ -130,7 +130,7 @@ static void lan966x_oic_irq_handler_domain(struct irq_domain *d, u32 first_irq)
 static void lan966x_oic_irq_handler(struct irq_desc *desc)
 {
 	struct irq_domain *d = irq_desc_get_handler_data(desc);
-	struct irq_chip *chip = irq_desc_get_chip(desc);
+	const struct irq_chip *chip = irq_desc_get_chip(desc);
 
 	chained_irq_enter(chip, desc);
 	lan966x_oic_irq_handler_domain(d, 0);
diff --git a/drivers/irqchip/irq-loongarch-avec.c b/drivers/irqchip/irq-loongarch-avec.c
index 758262fd5bd6..5e82c761ed82 100644
--- a/drivers/irqchip/irq-loongarch-avec.c
+++ b/drivers/irqchip/irq-loongarch-avec.c
@@ -230,7 +230,7 @@ static struct irq_chip avec_irq_controller = {
 
 static void avecintc_irq_dispatch(struct irq_desc *desc)
 {
-	struct irq_chip *chip = irq_desc_get_chip(desc);
+	const struct irq_chip *chip = irq_desc_get_chip(desc);
 	struct irq_desc *d;
 
 	chained_irq_enter(chip, desc);
diff --git a/drivers/irqchip/irq-loongson-eiointc.c b/drivers/irqchip/irq-loongson-eiointc.c
index a9e8b481d31d..5c6d52ad1d82 100644
--- a/drivers/irqchip/irq-loongson-eiointc.c
+++ b/drivers/irqchip/irq-loongson-eiointc.c
@@ -308,7 +308,7 @@ static inline void write_isr(int i, unsigned long val)
 static void eiointc_irq_dispatch(struct irq_desc *desc)
 {
 	struct eiointc_ip_route *info = irq_desc_get_handler_data(desc);
-	struct irq_chip *chip = irq_desc_get_chip(desc);
+	const struct irq_chip *chip = irq_desc_get_chip(desc);
 	unsigned long pending;
 	bool handled = false;
 	int i;
diff --git a/drivers/irqchip/irq-loongson-htpic.c b/drivers/irqchip/irq-loongson-htpic.c
index 2d78112f7fc7..00d3c3524c25 100644
--- a/drivers/irqchip/irq-loongson-htpic.c
+++ b/drivers/irqchip/irq-loongson-htpic.c
@@ -29,7 +29,7 @@ static struct loongson_htpic *htpic;
 static void htpic_irq_dispatch(struct irq_desc *desc)
 {
 	struct loongson_htpic *priv = irq_desc_get_handler_data(desc);
-	struct irq_chip *chip = irq_desc_get_chip(desc);
+	const struct irq_chip *chip = irq_desc_get_chip(desc);
 	uint32_t pending;
 
 	chained_irq_enter(chip, desc);
diff --git a/drivers/irqchip/irq-loongson-htvec.c b/drivers/irqchip/irq-loongson-htvec.c
index 75e40ba6069d..d8e222811611 100644
--- a/drivers/irqchip/irq-loongson-htvec.c
+++ b/drivers/irqchip/irq-loongson-htvec.c
@@ -41,7 +41,7 @@ static void htvec_irq_dispatch(struct irq_desc *desc)
 	int i;
 	u32 pending;
 	bool handled = false;
-	struct irq_chip *chip = irq_desc_get_chip(desc);
+	const struct irq_chip *chip = irq_desc_get_chip(desc);
 	struct htvec *priv = irq_desc_get_handler_data(desc);
 
 	chained_irq_enter(chip, desc);
diff --git a/drivers/irqchip/irq-loongson-liointc.c b/drivers/irqchip/irq-loongson-liointc.c
index cf44a333b9c8..808df1678a02 100644
--- a/drivers/irqchip/irq-loongson-liointc.c
+++ b/drivers/irqchip/irq-loongson-liointc.c
@@ -71,7 +71,7 @@ struct fwnode_handle *liointc_handle;
 static void liointc_chained_handle_irq(struct irq_desc *desc)
 {
 	struct liointc_handler_data *handler = irq_desc_get_handler_data(desc);
-	struct irq_chip *chip = irq_desc_get_chip(desc);
+	const struct irq_chip *chip = irq_desc_get_chip(desc);
 	struct irq_chip_generic *gc = handler->priv->gc;
 	int core = liointc_core_id % LIOINTC_NUM_CORES;
 	u32 pending;
diff --git a/drivers/irqchip/irq-loongson-pch-lpc.c b/drivers/irqchip/irq-loongson-pch-lpc.c
index 7117ca6fc2f0..65a761160d69 100644
--- a/drivers/irqchip/irq-loongson-pch-lpc.c
+++ b/drivers/irqchip/irq-loongson-pch-lpc.c
@@ -107,7 +107,7 @@ static const struct irq_chip pch_lpc_irq_chip = {
 static void lpc_irq_dispatch(struct irq_desc *desc)
 {
 	u32 pending, bit;
-	struct irq_chip *chip = irq_desc_get_chip(desc);
+	const struct irq_chip *chip = irq_desc_get_chip(desc);
 	struct pch_lpc *priv = irq_desc_get_handler_data(desc);
 
 	chained_irq_enter(chip, desc);
diff --git a/drivers/irqchip/irq-lpc32xx.c b/drivers/irqchip/irq-lpc32xx.c
index 6ff93df614f8..ad27202c227f 100644
--- a/drivers/irqchip/irq-lpc32xx.c
+++ b/drivers/irqchip/irq-lpc32xx.c
@@ -152,7 +152,7 @@ static void __exception_irq_entry lpc32xx_handle_irq(struct pt_regs *regs)
 static void lpc32xx_sic_handler(struct irq_desc *desc)
 {
 	struct lpc32xx_irq_chip *ic = irq_desc_get_handler_data(desc);
-	struct irq_chip *chip = irq_desc_get_chip(desc);
+	const struct irq_chip *chip = irq_desc_get_chip(desc);
 	u32 hwirq = lpc32xx_ic_read(ic, LPC32XX_INTC_STAT), irq;
 
 	chained_irq_enter(chip, desc);
diff --git a/drivers/irqchip/irq-ls1x.c b/drivers/irqchip/irq-ls1x.c
index 208f9d4cd99f..daea7f3c2cd4 100644
--- a/drivers/irqchip/irq-ls1x.c
+++ b/drivers/irqchip/irq-ls1x.c
@@ -37,7 +37,7 @@ struct ls1x_intc_priv {
 static void ls1x_chained_handle_irq(struct irq_desc *desc)
 {
 	struct ls1x_intc_priv *priv = irq_desc_get_handler_data(desc);
-	struct irq_chip *chip = irq_desc_get_chip(desc);
+	const struct irq_chip *chip = irq_desc_get_chip(desc);
 	u32 pending;
 
 	chained_irq_enter(chip, desc);
diff --git a/drivers/irqchip/irq-mmp.c b/drivers/irqchip/irq-mmp.c
index 8e210cb451be..7b5b183443e7 100644
--- a/drivers/irqchip/irq-mmp.c
+++ b/drivers/irqchip/irq-mmp.c
@@ -146,7 +146,7 @@ static const struct irq_chip icu_irq_chip = {
 static void icu_mux_irq_demux(struct irq_desc *desc)
 {
 	unsigned int irq = irq_desc_get_irq(desc);
-	struct irq_chip *chip = irq_desc_get_chip(desc);
+	const struct irq_chip *chip = irq_desc_get_chip(desc);
 	struct irq_domain *domain;
 	struct icu_chip_data *data;
 	int i;
diff --git a/drivers/irqchip/irq-mscc-ocelot.c b/drivers/irqchip/irq-mscc-ocelot.c
index 8cbc191f750b..7bf2dbc008ef 100644
--- a/drivers/irqchip/irq-mscc-ocelot.c
+++ b/drivers/irqchip/irq-mscc-ocelot.c
@@ -101,7 +101,7 @@ static void ocelot_irq_unmask(struct irq_data *data)
 
 static void ocelot_irq_handler(struct irq_desc *desc)
 {
-	struct irq_chip *chip = irq_desc_get_chip(desc);
+	const struct irq_chip *chip = irq_desc_get_chip(desc);
 	struct irq_domain *d = irq_desc_get_handler_data(desc);
 	struct chip_props *p = d->host_data;
 	struct irq_chip_generic *gc = irq_get_domain_generic_chip(d, 0);
diff --git a/drivers/irqchip/irq-mvebu-pic.c b/drivers/irqchip/irq-mvebu-pic.c
index 10b85128183a..541c82946a25 100644
--- a/drivers/irqchip/irq-mvebu-pic.c
+++ b/drivers/irqchip/irq-mvebu-pic.c
@@ -103,7 +103,7 @@ static const struct irq_domain_ops mvebu_pic_domain_ops = {
 static void mvebu_pic_handle_cascade_irq(struct irq_desc *desc)
 {
 	struct mvebu_pic *pic = irq_desc_get_handler_data(desc);
-	struct irq_chip *chip = irq_desc_get_chip(desc);
+	const struct irq_chip *chip = irq_desc_get_chip(desc);
 	unsigned long irqmap, irqn;
 
 	irqmap = readl_relaxed(pic->base + PIC_CAUSE);
diff --git a/drivers/irqchip/irq-mvebu-sei.c b/drivers/irqchip/irq-mvebu-sei.c
index 5822ea864765..e2d136a11eb3 100644
--- a/drivers/irqchip/irq-mvebu-sei.c
+++ b/drivers/irqchip/irq-mvebu-sei.c
@@ -313,7 +313,7 @@ static const struct irq_domain_ops mvebu_sei_cp_domain_ops = {
 static void mvebu_sei_handle_cascade_irq(struct irq_desc *desc)
 {
 	struct mvebu_sei *sei = irq_desc_get_handler_data(desc);
-	struct irq_chip *chip = irq_desc_get_chip(desc);
+	const struct irq_chip *chip = irq_desc_get_chip(desc);
 	u32 idx;
 
 	chained_irq_enter(chip, desc);
diff --git a/drivers/irqchip/irq-pruss-intc.c b/drivers/irqchip/irq-pruss-intc.c
index 81078d56f38d..0db4a1a88858 100644
--- a/drivers/irqchip/irq-pruss-intc.c
+++ b/drivers/irqchip/irq-pruss-intc.c
@@ -479,7 +479,7 @@ static const struct irq_domain_ops pruss_intc_irq_domain_ops = {
 static void pruss_intc_irq_handler(struct irq_desc *desc)
 {
 	unsigned int irq = irq_desc_get_irq(desc);
-	struct irq_chip *chip = irq_desc_get_chip(desc);
+	const struct irq_chip *chip = irq_desc_get_chip(desc);
 	struct pruss_host_irq_data *host_irq_data = irq_get_handler_data(irq);
 	struct pruss_intc *intc = host_irq_data->intc;
 	u8 host_irq = host_irq_data->host_irq + FIRST_PRU_HOST_INT;
diff --git a/drivers/irqchip/irq-realtek-rtl.c b/drivers/irqchip/irq-realtek-rtl.c
index 942c1f8c363d..defb807b0246 100644
--- a/drivers/irqchip/irq-realtek-rtl.c
+++ b/drivers/irqchip/irq-realtek-rtl.c
@@ -102,7 +102,7 @@ static const struct irq_domain_ops irq_domain_ops = {
 
 static void realtek_irq_dispatch(struct irq_desc *desc)
 {
-	struct irq_chip *chip = irq_desc_get_chip(desc);
+	const struct irq_chip *chip = irq_desc_get_chip(desc);
 	struct irq_domain *domain;
 	unsigned long pending;
 	unsigned int soc_int;
diff --git a/drivers/irqchip/irq-riscv-aplic-direct.c b/drivers/irqchip/irq-riscv-aplic-direct.c
index 5a9650225dd8..86e832ec89cb 100644
--- a/drivers/irqchip/irq-riscv-aplic-direct.c
+++ b/drivers/irqchip/irq-riscv-aplic-direct.c
@@ -139,7 +139,7 @@ static void aplic_direct_handle_irq(struct irq_desc *desc)
 {
 	struct aplic_idc *idc = this_cpu_ptr(&aplic_idcs);
 	struct irq_domain *irqdomain = idc->direct->irqdomain;
-	struct irq_chip *chip = irq_desc_get_chip(desc);
+	const struct irq_chip *chip = irq_desc_get_chip(desc);
 	irq_hw_number_t hw_irq;
 	int irq;
 
diff --git a/drivers/irqchip/irq-riscv-imsic-early.c b/drivers/irqchip/irq-riscv-imsic-early.c
index a7a1852b548c..c46fb1abd275 100644
--- a/drivers/irqchip/irq-riscv-imsic-early.c
+++ b/drivers/irqchip/irq-riscv-imsic-early.c
@@ -93,7 +93,7 @@ static int __init imsic_ipi_domain_init(void) { return 0; }
 static void imsic_handle_irq(struct irq_desc *desc)
 {
 	struct imsic_local_priv *lpriv = this_cpu_ptr(imsic->lpriv);
-	struct irq_chip *chip = irq_desc_get_chip(desc);
+	const struct irq_chip *chip = irq_desc_get_chip(desc);
 	unsigned long local_id;
 
 	/*
diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
index 5b0dac104814..b24a5a7448fc 100644
--- a/drivers/irqchip/irq-sifive-plic.c
+++ b/drivers/irqchip/irq-sifive-plic.c
@@ -382,7 +382,7 @@ static const struct irq_domain_ops plic_irqdomain_ops = {
 static void plic_handle_irq(struct irq_desc *desc)
 {
 	struct plic_handler *handler = this_cpu_ptr(&plic_handlers);
-	struct irq_chip *chip = irq_desc_get_chip(desc);
+	const struct irq_chip *chip = irq_desc_get_chip(desc);
 	void __iomem *claim = handler->hart_base + CONTEXT_CLAIM;
 	irq_hw_number_t hwirq;
 
@@ -474,7 +474,7 @@ static irq_hw_number_t cp100_get_hwirq(struct plic_handler *handler, void __iome
 static void plic_handle_irq_cp100(struct irq_desc *desc)
 {
 	struct plic_handler *handler = this_cpu_ptr(&plic_handlers);
-	struct irq_chip *chip = irq_desc_get_chip(desc);
+	const struct irq_chip *chip = irq_desc_get_chip(desc);
 	void __iomem *claim = handler->hart_base + CONTEXT_CLAIM;
 	irq_hw_number_t hwirq;
 
diff --git a/drivers/irqchip/irq-sp7021-intc.c b/drivers/irqchip/irq-sp7021-intc.c
index 2a6eda9ab62e..e19d75d54e2f 100644
--- a/drivers/irqchip/irq-sp7021-intc.c
+++ b/drivers/irqchip/irq-sp7021-intc.c
@@ -166,7 +166,7 @@ static int sp_intc_get_ext_irq(int ext_num)
 
 static void sp_intc_handle_ext_cascaded(struct irq_desc *desc)
 {
-	struct irq_chip *chip = irq_desc_get_chip(desc);
+	const struct irq_chip *chip = irq_desc_get_chip(desc);
 	int ext_num = (uintptr_t)irq_desc_get_handler_data(desc);
 	int hwirq;
 
diff --git a/drivers/irqchip/irq-starfive-jhb100-intc.c b/drivers/irqchip/irq-starfive-jhb100-intc.c
index 838885b02f34..680676f97fbb 100644
--- a/drivers/irqchip/irq-starfive-jhb100-intc.c
+++ b/drivers/irqchip/irq-starfive-jhb100-intc.c
@@ -172,7 +172,7 @@ static const struct irq_domain_ops starfive_intc_domain_ops = {
 static void starfive_intc_irq_handler(struct irq_desc *desc)
 {
 	struct starfive_irq_chip *irqc = irq_data_get_irq_handler_data(&desc->irq_data);
-	struct irq_chip *chip = irq_desc_get_chip(desc);
+	const struct irq_chip *chip = irq_desc_get_chip(desc);
 	unsigned long value;
 	int hwirq;
 
diff --git a/drivers/irqchip/irq-stm32-exti.c b/drivers/irqchip/irq-stm32-exti.c
index 5fdf335acb46..3b4804b967cd 100644
--- a/drivers/irqchip/irq-stm32-exti.c
+++ b/drivers/irqchip/irq-stm32-exti.c
@@ -116,7 +116,7 @@ static unsigned long stm32_exti_pending(struct irq_chip_generic *gc)
 static void stm32_irq_handler(struct irq_desc *desc)
 {
 	struct irq_domain *domain = irq_desc_get_handler_data(desc);
-	struct irq_chip *chip = irq_desc_get_chip(desc);
+	const struct irq_chip *chip = irq_desc_get_chip(desc);
 	unsigned int nbanks = domain->gc->num_chips;
 	struct irq_chip_generic *gc;
 	unsigned long pending;
diff --git a/drivers/irqchip/irq-sunxi-nmi.c b/drivers/irqchip/irq-sunxi-nmi.c
index fe32dfdc2dd0..c210e9d36501 100644
--- a/drivers/irqchip/irq-sunxi-nmi.c
+++ b/drivers/irqchip/irq-sunxi-nmi.c
@@ -95,7 +95,7 @@ static inline u32 sunxi_sc_nmi_read(struct irq_chip_generic *gc, u32 off)
 static void sunxi_sc_nmi_handle_irq(struct irq_desc *desc)
 {
 	struct irq_domain *domain = irq_desc_get_handler_data(desc);
-	struct irq_chip *chip = irq_desc_get_chip(desc);
+	const struct irq_chip *chip = irq_desc_get_chip(desc);
 
 	chained_irq_enter(chip, desc);
 	generic_handle_domain_irq(domain, 0);
diff --git a/drivers/irqchip/irq-ts4800.c b/drivers/irqchip/irq-ts4800.c
index 2e4013c6834d..f9050efed5eb 100644
--- a/drivers/irqchip/irq-ts4800.c
+++ b/drivers/irqchip/irq-ts4800.c
@@ -81,7 +81,7 @@ static const struct irq_domain_ops ts4800_ic_ops = {
 static void ts4800_ic_chained_handle_irq(struct irq_desc *desc)
 {
 	struct ts4800_irq_data *data = irq_desc_get_handler_data(desc);
-	struct irq_chip *chip = irq_desc_get_chip(desc);
+	const struct irq_chip *chip = irq_desc_get_chip(desc);
 	u16 status = readw(data->base + IRQ_STATUS);
 
 	chained_irq_enter(chip, desc);
diff --git a/drivers/irqchip/irq-versatile-fpga.c b/drivers/irqchip/irq-versatile-fpga.c
index 034ce6afe170..a61dd4adfdd6 100644
--- a/drivers/irqchip/irq-versatile-fpga.c
+++ b/drivers/irqchip/irq-versatile-fpga.c
@@ -81,7 +81,7 @@ static const struct irq_chip fpga_chip = {
 
 static void fpga_irq_handle(struct irq_desc *desc)
 {
-	struct irq_chip *chip = irq_desc_get_chip(desc);
+	const struct irq_chip *chip = irq_desc_get_chip(desc);
 	struct fpga_irq_data *f = irq_desc_get_handler_data(desc);
 	u32 status;
 
diff --git a/drivers/irqchip/irq-vic.c b/drivers/irqchip/irq-vic.c
index e38104c5064e..e63d1c2ecc47 100644
--- a/drivers/irqchip/irq-vic.c
+++ b/drivers/irqchip/irq-vic.c
@@ -221,7 +221,7 @@ static int handle_one_vic(struct vic_device *vic, struct pt_regs *regs)
 static void vic_handle_irq_cascaded(struct irq_desc *desc)
 {
 	u32 stat, hwirq;
-	struct irq_chip *host_chip = irq_desc_get_chip(desc);
+	const struct irq_chip *host_chip = irq_desc_get_chip(desc);
 	struct vic_device *vic = irq_desc_get_handler_data(desc);
 
 	chained_irq_enter(host_chip, desc);
diff --git a/drivers/irqchip/irq-vt8500.c b/drivers/irqchip/irq-vt8500.c
index b159e17ed1df..e420bae1801c 100644
--- a/drivers/irqchip/irq-vt8500.c
+++ b/drivers/irqchip/irq-vt8500.c
@@ -189,7 +189,7 @@ static void __exception_irq_entry vt8500_handle_irq(struct pt_regs *regs)
 static void vt8500_handle_irq_chained(struct irq_desc *desc)
 {
 	struct irq_domain *d = irq_desc_get_handler_data(desc);
-	struct irq_chip *chip = irq_desc_get_chip(desc);
+	const struct irq_chip *chip = irq_desc_get_chip(desc);
 	struct vt8500_irq_data *intc = d->host_data;
 
 	chained_irq_enter(chip, desc);
diff --git a/drivers/irqchip/irq-xilinx-intc.c b/drivers/irqchip/irq-xilinx-intc.c
index bba6f6dc405e..35b27bdb372c 100644
--- a/drivers/irqchip/irq-xilinx-intc.c
+++ b/drivers/irqchip/irq-xilinx-intc.c
@@ -136,7 +136,7 @@ static const struct irq_domain_ops xintc_irq_domain_ops = {
 
 static void xil_intc_irq_handler(struct irq_desc *desc)
 {
-	struct irq_chip *chip = irq_desc_get_chip(desc);
+	const struct irq_chip *chip = irq_desc_get_chip(desc);
 	struct xintc_irq_chip *irqc;
 
 	irqc = irq_data_get_irq_handler_data(&desc->irq_data);
diff --git a/drivers/irqchip/qcom-irq-combiner.c b/drivers/irqchip/qcom-irq-combiner.c
index 09819007d08e..70102a4e744f 100644
--- a/drivers/irqchip/qcom-irq-combiner.c
+++ b/drivers/irqchip/qcom-irq-combiner.c
@@ -47,7 +47,7 @@ static inline int irq_nr(u32 reg, u32 bit)
 static void combiner_handle_irq(struct irq_desc *desc)
 {
 	struct combiner *combiner = irq_desc_get_handler_data(desc);
-	struct irq_chip *chip = irq_desc_get_chip(desc);
+	const struct irq_chip *chip = irq_desc_get_chip(desc);
 	u32 reg;
 
 	chained_irq_enter(chip, desc);
diff --git a/drivers/mfd/fsl-imx25-tsadc.c b/drivers/mfd/fsl-imx25-tsadc.c
index 467b1a23faeb..343fa9dd1794 100644
--- a/drivers/mfd/fsl-imx25-tsadc.c
+++ b/drivers/mfd/fsl-imx25-tsadc.c
@@ -26,7 +26,7 @@ static const struct regmap_config mx25_tsadc_regmap_config = {
 static void mx25_tsadc_irq_handler(struct irq_desc *desc)
 {
 	struct mx25_tsadc *tsadc = irq_desc_get_handler_data(desc);
-	struct irq_chip *chip = irq_desc_get_chip(desc);
+	const struct irq_chip *chip = irq_desc_get_chip(desc);
 	u32 status;
 
 	chained_irq_enter(chip, desc);
diff --git a/drivers/misc/rp1/rp1_pci.c b/drivers/misc/rp1/rp1_pci.c
index 81685e3f3296..eb4abbc7a846 100644
--- a/drivers/misc/rp1/rp1_pci.c
+++ b/drivers/misc/rp1/rp1_pci.c
@@ -101,7 +101,7 @@ static void rp1_chained_handle_irq(struct irq_desc *desc)
 {
 	unsigned int hwirq = desc->irq_data.hwirq & RP1_HW_IRQ_MASK;
 	struct rp1_dev *rp1 = irq_desc_get_handler_data(desc);
-	struct irq_chip *chip = irq_desc_get_chip(desc);
+	const struct irq_chip *chip = irq_desc_get_chip(desc);
 	unsigned int virq;
 
 	chained_irq_enter(chip, desc);
diff --git a/drivers/pci/controller/dwc/pci-dra7xx.c b/drivers/pci/controller/dwc/pci-dra7xx.c
index 3fc889944f02..f9f7bb059353 100644
--- a/drivers/pci/controller/dwc/pci-dra7xx.c
+++ b/drivers/pci/controller/dwc/pci-dra7xx.c
@@ -252,7 +252,7 @@ static void dra7xx_pcie_handle_msi_irq(struct dw_pcie_rp *pp)
 
 static void dra7xx_pcie_msi_irq_handler(struct irq_desc *desc)
 {
-	struct irq_chip *chip = irq_desc_get_chip(desc);
+	const struct irq_chip *chip = irq_desc_get_chip(desc);
 	struct dra7xx_pcie *dra7xx;
 	struct dw_pcie_rp *pp;
 	struct dw_pcie *pci;
diff --git a/drivers/pci/controller/dwc/pci-keystone.c b/drivers/pci/controller/dwc/pci-keystone.c
index 278d2dba1db0..a1ba3a0cfc6e 100644
--- a/drivers/pci/controller/dwc/pci-keystone.c
+++ b/drivers/pci/controller/dwc/pci-keystone.c
@@ -610,7 +610,7 @@ static void ks_pcie_msi_irq_handler(struct irq_desc *desc)
 	struct dw_pcie *pci = ks_pcie->pci;
 	struct dw_pcie_rp *pp = &pci->pp;
 	struct device *dev = pci->dev;
-	struct irq_chip *chip = irq_desc_get_chip(desc);
+	const struct irq_chip *chip = irq_desc_get_chip(desc);
 	u32 vector, reg, pos;
 
 	dev_dbg(dev, "%s, irq %d\n", __func__, irq);
@@ -653,7 +653,7 @@ static void ks_pcie_intx_irq_handler(struct irq_desc *desc)
 	struct dw_pcie *pci = ks_pcie->pci;
 	struct device *dev = pci->dev;
 	u32 irq_offset = irq - ks_pcie->intx_host_irqs[0];
-	struct irq_chip *chip = irq_desc_get_chip(desc);
+	const struct irq_chip *chip = irq_desc_get_chip(desc);
 
 	dev_dbg(dev, ": Handling INTX irq %d\n", irq);
 
diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
index cffb34f6f3a9..708adc61a0c6 100644
--- a/drivers/pci/controller/dwc/pcie-designware-host.c
+++ b/drivers/pci/controller/dwc/pcie-designware-host.c
@@ -89,7 +89,7 @@ void dw_handle_msi_irq(struct dw_pcie_rp *pp)
 /* Chained MSI interrupt service routine */
 static void dw_chained_msi_isr(struct irq_desc *desc)
 {
-	struct irq_chip *chip = irq_desc_get_chip(desc);
+	const struct irq_chip *chip = irq_desc_get_chip(desc);
 	struct dw_pcie_rp *pp;
 
 	chained_irq_enter(chip, desc);
diff --git a/drivers/pci/controller/dwc/pcie-dw-rockchip.c b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
index 731d93663cca..c68dc9a5ed38 100644
--- a/drivers/pci/controller/dwc/pcie-dw-rockchip.c
+++ b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
@@ -135,7 +135,7 @@ static void rockchip_pcie_writel_apb(struct rockchip_pcie *rockchip, u32 val,
 
 static void rockchip_pcie_intx_handler(struct irq_desc *desc)
 {
-	struct irq_chip *chip = irq_desc_get_chip(desc);
+	const struct irq_chip *chip = irq_desc_get_chip(desc);
 	struct rockchip_pcie *rockchip = irq_desc_get_handler_data(desc);
 	unsigned long reg, hwirq;
 
diff --git a/drivers/pci/controller/dwc/pcie-keembay.c b/drivers/pci/controller/dwc/pcie-keembay.c
index 2459c4d66b88..4d1d900a5706 100644
--- a/drivers/pci/controller/dwc/pcie-keembay.c
+++ b/drivers/pci/controller/dwc/pcie-keembay.c
@@ -233,7 +233,7 @@ static int keembay_pcie_pll_init(struct keembay_pcie *pcie)
 static void keembay_pcie_msi_irq_handler(struct irq_desc *desc)
 {
 	struct keembay_pcie *pcie = irq_desc_get_handler_data(desc);
-	struct irq_chip *chip = irq_desc_get_chip(desc);
+	const struct irq_chip *chip = irq_desc_get_chip(desc);
 	u32 val, mask, status;
 	struct dw_pcie_rp *pp;
 
diff --git a/drivers/pci/controller/dwc/pcie-sophgo.c b/drivers/pci/controller/dwc/pcie-sophgo.c
index 044088898819..2c78799d21cb 100644
--- a/drivers/pci/controller/dwc/pcie-sophgo.c
+++ b/drivers/pci/controller/dwc/pcie-sophgo.c
@@ -44,7 +44,7 @@ static void sophgo_pcie_writel_app(struct sophgo_pcie *sophgo, u32 val, u32 reg)
 static void sophgo_pcie_intx_handler(struct irq_desc *desc)
 {
 	struct dw_pcie_rp *pp = irq_desc_get_handler_data(desc);
-	struct irq_chip *chip = irq_desc_get_chip(desc);
+	const struct irq_chip *chip = irq_desc_get_chip(desc);
 	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
 	struct sophgo_pcie *sophgo = to_sophgo_pcie(pci);
 	unsigned long hwirq, reg;
diff --git a/drivers/pci/controller/dwc/pcie-uniphier.c b/drivers/pci/controller/dwc/pcie-uniphier.c
index 297e7a3d9b36..a9e0f333cfb7 100644
--- a/drivers/pci/controller/dwc/pcie-uniphier.c
+++ b/drivers/pci/controller/dwc/pcie-uniphier.c
@@ -228,7 +228,7 @@ static void uniphier_pcie_irq_handler(struct irq_desc *desc)
 	struct dw_pcie_rp *pp = irq_desc_get_handler_data(desc);
 	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
 	struct uniphier_pcie *pcie = to_uniphier_pcie(pci);
-	struct irq_chip *chip = irq_desc_get_chip(desc);
+	const struct irq_chip *chip = irq_desc_get_chip(desc);
 	unsigned long reg;
 	u32 val, bit;
 
diff --git a/drivers/pci/controller/mobiveil/pcie-mobiveil-host.c b/drivers/pci/controller/mobiveil/pcie-mobiveil-host.c
index dbc72c73fd0a..21a0fcf04bf3 100644
--- a/drivers/pci/controller/mobiveil/pcie-mobiveil-host.c
+++ b/drivers/pci/controller/mobiveil/pcie-mobiveil-host.c
@@ -82,7 +82,7 @@ static struct pci_ops mobiveil_pcie_ops = {
 
 static void mobiveil_pcie_isr(struct irq_desc *desc)
 {
-	struct irq_chip *chip = irq_desc_get_chip(desc);
+	const struct irq_chip *chip = irq_desc_get_chip(desc);
 	struct mobiveil_pcie *pcie = irq_desc_get_handler_data(desc);
 	struct device *dev = &pcie->pdev->dev;
 	struct mobiveil_root_port *rp = &pcie->rp;
diff --git a/drivers/pci/controller/pci-ftpci100.c b/drivers/pci/controller/pci-ftpci100.c
index 28e43831c0f1..a784a7e6f0bd 100644
--- a/drivers/pci/controller/pci-ftpci100.c
+++ b/drivers/pci/controller/pci-ftpci100.c
@@ -289,7 +289,7 @@ static void faraday_pci_unmask_irq(struct irq_data *d)
 static void faraday_pci_irq_handler(struct irq_desc *desc)
 {
 	struct faraday_pci *p = irq_desc_get_handler_data(desc);
-	struct irq_chip *irqchip = irq_desc_get_chip(desc);
+	const struct irq_chip *irqchip = irq_desc_get_chip(desc);
 	unsigned int irq_stat, reg, i;
 
 	faraday_raw_pci_read_config(p, 0, 0, FARADAY_PCI_CTRL2, 4, &reg);
diff --git a/drivers/pci/controller/pci-mvebu.c b/drivers/pci/controller/pci-mvebu.c
index d6eb65b8cd7f..f901db23edff 100644
--- a/drivers/pci/controller/pci-mvebu.c
+++ b/drivers/pci/controller/pci-mvebu.c
@@ -1092,7 +1092,7 @@ static int mvebu_pcie_init_irq_domain(struct mvebu_pcie_port *port)
 static void mvebu_pcie_irq_handler(struct irq_desc *desc)
 {
 	struct mvebu_pcie_port *port = irq_desc_get_handler_data(desc);
-	struct irq_chip *chip = irq_desc_get_chip(desc);
+	const struct irq_chip *chip = irq_desc_get_chip(desc);
 	struct device *dev = &port->pcie->pdev->dev;
 	u32 cause, unmask, status;
 	int i;
diff --git a/drivers/pci/controller/pci-tegra.c b/drivers/pci/controller/pci-tegra.c
index 512309763d1f..b25fb7b890bb 100644
--- a/drivers/pci/controller/pci-tegra.c
+++ b/drivers/pci/controller/pci-tegra.c
@@ -1534,7 +1534,7 @@ static void tegra_pcie_pme_turnoff(struct tegra_pcie_port *port)
 static void tegra_pcie_msi_irq(struct irq_desc *desc)
 {
 	struct tegra_pcie *pcie = irq_desc_get_handler_data(desc);
-	struct irq_chip *chip = irq_desc_get_chip(desc);
+	const struct irq_chip *chip = irq_desc_get_chip(desc);
 	struct tegra_msi *msi = &pcie->msi;
 	struct device *dev = pcie->dev;
 	unsigned int i;
diff --git a/drivers/pci/controller/pci-xgene-msi.c b/drivers/pci/controller/pci-xgene-msi.c
index 654639bccd10..33e7dc12ae67 100644
--- a/drivers/pci/controller/pci-xgene-msi.c
+++ b/drivers/pci/controller/pci-xgene-msi.c
@@ -245,7 +245,7 @@ static int xgene_msi_init_allocator(struct device *dev)
 static void xgene_msi_isr(struct irq_desc *desc)
 {
 	unsigned int *irqp = irq_desc_get_handler_data(desc);
-	struct irq_chip *chip = irq_desc_get_chip(desc);
+	const struct irq_chip *chip = irq_desc_get_chip(desc);
 	struct xgene_msi *xgene_msi = xgene_msi_ctrl;
 	unsigned long grp_pending;
 	int msir_idx;
diff --git a/drivers/pci/controller/pcie-altera-msi.c b/drivers/pci/controller/pcie-altera-msi.c
index ea2ca2e70f20..ea60ea80b1c5 100644
--- a/drivers/pci/controller/pcie-altera-msi.c
+++ b/drivers/pci/controller/pcie-altera-msi.c
@@ -51,7 +51,7 @@ static inline u32 msi_readl(struct altera_msi *msi, const u32 reg)
 
 static void altera_msi_isr(struct irq_desc *desc)
 {
-	struct irq_chip *chip = irq_desc_get_chip(desc);
+	const struct irq_chip *chip = irq_desc_get_chip(desc);
 	struct altera_msi *msi;
 	unsigned long status;
 	u32 bit;
diff --git a/drivers/pci/controller/pcie-altera.c b/drivers/pci/controller/pcie-altera.c
index 76f3823d9613..a2936b52064c 100644
--- a/drivers/pci/controller/pcie-altera.c
+++ b/drivers/pci/controller/pcie-altera.c
@@ -798,7 +798,7 @@ static const struct irq_domain_ops intx_domain_ops = {
 
 static void altera_pcie_isr(struct irq_desc *desc)
 {
-	struct irq_chip *chip = irq_desc_get_chip(desc);
+	const struct irq_chip *chip = irq_desc_get_chip(desc);
 	struct altera_pcie *pcie;
 	struct device *dev;
 	unsigned long status;
@@ -825,7 +825,7 @@ static void altera_pcie_isr(struct irq_desc *desc)
 
 static void aglx_isr(struct irq_desc *desc)
 {
-	struct irq_chip *chip = irq_desc_get_chip(desc);
+	const struct irq_chip *chip = irq_desc_get_chip(desc);
 	struct altera_pcie *pcie;
 	struct device *dev;
 	u32 status;
diff --git a/drivers/pci/controller/pcie-apple.c b/drivers/pci/controller/pcie-apple.c
index 2d92fc79f6dd..56068a9ab790 100644
--- a/drivers/pci/controller/pcie-apple.c
+++ b/drivers/pci/controller/pcie-apple.c
@@ -382,7 +382,7 @@ static const struct irq_domain_ops apple_port_irq_domain_ops = {
 static void apple_port_irq_handler(struct irq_desc *desc)
 {
 	struct apple_pcie_port *port = irq_desc_get_handler_data(desc);
-	struct irq_chip *chip = irq_desc_get_chip(desc);
+	const struct irq_chip *chip = irq_desc_get_chip(desc);
 	unsigned long stat;
 	int i;
 
diff --git a/drivers/pci/controller/pcie-brcmstb.c b/drivers/pci/controller/pcie-brcmstb.c
index 08a0e7091ced..935cd50d505c 100644
--- a/drivers/pci/controller/pcie-brcmstb.c
+++ b/drivers/pci/controller/pcie-brcmstb.c
@@ -546,7 +546,7 @@ static const struct msi_parent_ops brcm_msi_parent_ops = {
 
 static void brcm_pcie_msi_isr(struct irq_desc *desc)
 {
-	struct irq_chip *chip = irq_desc_get_chip(desc);
+	const struct irq_chip *chip = irq_desc_get_chip(desc);
 	unsigned long status;
 	struct brcm_msi *msi;
 	struct device *dev;
diff --git a/drivers/pci/controller/pcie-iproc-msi.c b/drivers/pci/controller/pcie-iproc-msi.c
index 9ba242ab9596..9df2ed1c36cd 100644
--- a/drivers/pci/controller/pcie-iproc-msi.c
+++ b/drivers/pci/controller/pcie-iproc-msi.c
@@ -322,7 +322,7 @@ static inline u32 decode_msi_hwirq(struct iproc_msi *msi, u32 eq, u32 head)
 
 static void iproc_msi_handler(struct irq_desc *desc)
 {
-	struct irq_chip *chip = irq_desc_get_chip(desc);
+	const struct irq_chip *chip = irq_desc_get_chip(desc);
 	struct iproc_msi_grp *grp;
 	struct iproc_msi *msi;
 	u32 eq, head, tail, nr_events;
diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
index 66c33a09dd95..2ecfa3b3f671 100644
--- a/drivers/pci/controller/pcie-mediatek-gen3.c
+++ b/drivers/pci/controller/pcie-mediatek-gen3.c
@@ -880,7 +880,7 @@ static void mtk_pcie_msi_handler(struct mtk_gen3_pcie *pcie, int set_idx)
 static void mtk_pcie_irq_handler(struct irq_desc *desc)
 {
 	struct mtk_gen3_pcie *pcie = irq_desc_get_handler_data(desc);
-	struct irq_chip *irqchip = irq_desc_get_chip(desc);
+	const struct irq_chip *irqchip = irq_desc_get_chip(desc);
 	unsigned long status;
 	irq_hw_number_t irq_bit = PCIE_INTX_SHIFT;
 
diff --git a/drivers/pci/controller/pcie-mediatek.c b/drivers/pci/controller/pcie-mediatek.c
index 75722524fe74..8e07e4057cc3 100644
--- a/drivers/pci/controller/pcie-mediatek.c
+++ b/drivers/pci/controller/pcie-mediatek.c
@@ -597,7 +597,7 @@ static int mtk_pcie_init_irq_domain(struct mtk_pcie_port *port,
 static void mtk_pcie_intr_handler(struct irq_desc *desc)
 {
 	struct mtk_pcie_port *port = irq_desc_get_handler_data(desc);
-	struct irq_chip *irqchip = irq_desc_get_chip(desc);
+	const struct irq_chip *irqchip = irq_desc_get_chip(desc);
 	unsigned long status;
 	u32 bit = INTX_SHIFT;
 
diff --git a/drivers/pci/controller/pcie-rockchip-host.c b/drivers/pci/controller/pcie-rockchip-host.c
index ee1822ca01db..1bc13a2664d9 100644
--- a/drivers/pci/controller/pcie-rockchip-host.c
+++ b/drivers/pci/controller/pcie-rockchip-host.c
@@ -506,7 +506,7 @@ static irqreturn_t rockchip_pcie_client_irq_handler(int irq, void *arg)
 
 static void rockchip_pcie_intx_handler(struct irq_desc *desc)
 {
-	struct irq_chip *chip = irq_desc_get_chip(desc);
+	const struct irq_chip *chip = irq_desc_get_chip(desc);
 	struct rockchip_pcie *rockchip = irq_desc_get_handler_data(desc);
 	struct device *dev = rockchip->dev;
 	u32 reg;
diff --git a/drivers/pci/controller/pcie-rzg3s-host.c b/drivers/pci/controller/pcie-rzg3s-host.c
index d86e7516dcc2..04a0dd975027 100644
--- a/drivers/pci/controller/pcie-rzg3s-host.c
+++ b/drivers/pci/controller/pcie-rzg3s-host.c
@@ -523,7 +523,7 @@ static struct pci_ops rzg3s_pcie_root_ops = {
 static void rzg3s_pcie_intx_irq_handler(struct irq_desc *desc)
 {
 	struct rzg3s_pcie_host *host = irq_desc_get_handler_data(desc);
-	struct irq_chip *chip = irq_desc_get_chip(desc);
+	const struct irq_chip *chip = irq_desc_get_chip(desc);
 	unsigned int irq = irq_desc_get_irq(desc);
 	u32 intx = irq - host->intx_irqs[0];
 
diff --git a/drivers/pci/controller/pcie-xilinx-cpm.c b/drivers/pci/controller/pcie-xilinx-cpm.c
index d38f27e20761..79ed5248373a 100644
--- a/drivers/pci/controller/pcie-xilinx-cpm.c
+++ b/drivers/pci/controller/pcie-xilinx-cpm.c
@@ -217,7 +217,7 @@ static const struct irq_domain_ops intx_domain_ops = {
 static void xilinx_cpm_pcie_intx_flow(struct irq_desc *desc)
 {
 	struct xilinx_cpm_pcie *port = irq_desc_get_handler_data(desc);
-	struct irq_chip *chip = irq_desc_get_chip(desc);
+	const struct irq_chip *chip = irq_desc_get_chip(desc);
 	unsigned long val;
 	int i;
 
@@ -279,7 +279,7 @@ static const struct irq_domain_ops event_domain_ops = {
 static void xilinx_cpm_pcie_event_flow(struct irq_desc *desc)
 {
 	struct xilinx_cpm_pcie *port = irq_desc_get_handler_data(desc);
-	struct irq_chip *chip = irq_desc_get_chip(desc);
+	const struct irq_chip *chip = irq_desc_get_chip(desc);
 	const struct xilinx_cpm_variant *variant = port->variant;
 	unsigned long val;
 	int i;
diff --git a/drivers/pci/controller/pcie-xilinx-nwl.c b/drivers/pci/controller/pcie-xilinx-nwl.c
index 7db2c96c6cec..93e912ad32b8 100644
--- a/drivers/pci/controller/pcie-xilinx-nwl.c
+++ b/drivers/pci/controller/pcie-xilinx-nwl.c
@@ -315,7 +315,7 @@ static irqreturn_t nwl_pcie_misc_handler(int irq, void *data)
 
 static void nwl_pcie_leg_handler(struct irq_desc *desc)
 {
-	struct irq_chip *chip = irq_desc_get_chip(desc);
+	const struct irq_chip *chip = irq_desc_get_chip(desc);
 	struct nwl_pcie *pcie;
 	unsigned long status;
 	u32 bit;
@@ -348,7 +348,7 @@ static void nwl_pcie_handle_msi_irq(struct nwl_pcie *pcie, u32 status_reg)
 
 static void nwl_pcie_msi_handler_high(struct irq_desc *desc)
 {
-	struct irq_chip *chip = irq_desc_get_chip(desc);
+	const struct irq_chip *chip = irq_desc_get_chip(desc);
 	struct nwl_pcie *pcie = irq_desc_get_handler_data(desc);
 
 	chained_irq_enter(chip, desc);
@@ -358,7 +358,7 @@ static void nwl_pcie_msi_handler_high(struct irq_desc *desc)
 
 static void nwl_pcie_msi_handler_low(struct irq_desc *desc)
 {
-	struct irq_chip *chip = irq_desc_get_chip(desc);
+	const struct irq_chip *chip = irq_desc_get_chip(desc);
 	struct nwl_pcie *pcie = irq_desc_get_handler_data(desc);
 
 	chained_irq_enter(chip, desc);
diff --git a/drivers/pci/controller/plda/pcie-plda-host.c b/drivers/pci/controller/plda/pcie-plda-host.c
index 3c2f68383010..667ba604b67a 100644
--- a/drivers/pci/controller/plda/pcie-plda-host.c
+++ b/drivers/pci/controller/plda/pcie-plda-host.c
@@ -32,7 +32,7 @@ EXPORT_SYMBOL_GPL(plda_pcie_map_bus);
 static void plda_handle_msi(struct irq_desc *desc)
 {
 	struct plda_pcie_rp *port = irq_desc_get_handler_data(desc);
-	struct irq_chip *chip = irq_desc_get_chip(desc);
+	const struct irq_chip *chip = irq_desc_get_chip(desc);
 	struct device *dev = port->dev;
 	struct plda_msi *msi = &port->msi;
 	void __iomem *bridge_base_addr = port->bridge_addr;
@@ -176,7 +176,7 @@ static int plda_allocate_msi_domains(struct plda_pcie_rp *port)
 static void plda_handle_intx(struct irq_desc *desc)
 {
 	struct plda_pcie_rp *port = irq_desc_get_handler_data(desc);
-	struct irq_chip *chip = irq_desc_get_chip(desc);
+	const struct irq_chip *chip = irq_desc_get_chip(desc);
 	struct device *dev = port->dev;
 	void __iomem *bridge_base_addr = port->bridge_addr;
 	unsigned long status;
@@ -289,7 +289,7 @@ static void plda_handle_event(struct irq_desc *desc)
 	struct plda_pcie_rp *port = irq_desc_get_handler_data(desc);
 	unsigned long events;
 	u32 bit;
-	struct irq_chip *chip = irq_desc_get_chip(desc);
+	const struct irq_chip *chip = irq_desc_get_chip(desc);
 
 	chained_irq_enter(chip, desc);
 
diff --git a/drivers/pinctrl/actions/pinctrl-owl.c b/drivers/pinctrl/actions/pinctrl-owl.c
index 1f0ef4727ba7..7663fb844664 100644
--- a/drivers/pinctrl/actions/pinctrl-owl.c
+++ b/drivers/pinctrl/actions/pinctrl-owl.c
@@ -847,7 +847,7 @@ static const struct irq_chip owl_gpio_irqchip = {
 static void owl_gpio_irq_handler(struct irq_desc *desc)
 {
 	struct owl_pinctrl *pctrl = irq_desc_get_handler_data(desc);
-	struct irq_chip *chip = irq_desc_get_chip(desc);
+	const struct irq_chip *chip = irq_desc_get_chip(desc);
 	struct irq_domain *domain = pctrl->chip.irq.domain;
 	unsigned int parent = irq_desc_get_irq(desc);
 	const struct owl_gpio_port *port;
diff --git a/drivers/pinctrl/bcm/pinctrl-bcm2835.c b/drivers/pinctrl/bcm/pinctrl-bcm2835.c
index e7b35019a5a7..eed59b25195f 100644
--- a/drivers/pinctrl/bcm/pinctrl-bcm2835.c
+++ b/drivers/pinctrl/bcm/pinctrl-bcm2835.c
@@ -443,7 +443,7 @@ static void bcm2835_gpio_irq_handler(struct irq_desc *desc)
 {
 	struct gpio_chip *chip = irq_desc_get_handler_data(desc);
 	struct bcm2835_pinctrl *pc = gpiochip_get_data(chip);
-	struct irq_chip *host_chip = irq_desc_get_chip(desc);
+	const struct irq_chip *host_chip = irq_desc_get_chip(desc);
 	int irq = irq_desc_get_irq(desc);
 	int group = 0;
 	int i;
diff --git a/drivers/pinctrl/bcm/pinctrl-iproc-gpio.c b/drivers/pinctrl/bcm/pinctrl-iproc-gpio.c
index 8c353676f2af..eddb56269c34 100644
--- a/drivers/pinctrl/bcm/pinctrl-iproc-gpio.c
+++ b/drivers/pinctrl/bcm/pinctrl-iproc-gpio.c
@@ -166,7 +166,7 @@ static void iproc_gpio_irq_handler(struct irq_desc *desc)
 {
 	struct gpio_chip *gc = irq_desc_get_handler_data(desc);
 	struct iproc_gpio *chip = gpiochip_get_data(gc);
-	struct irq_chip *irq_chip = irq_desc_get_chip(desc);
+	const struct irq_chip *irq_chip = irq_desc_get_chip(desc);
 	int i, bit;
 
 	chained_irq_enter(irq_chip, desc);
diff --git a/drivers/pinctrl/intel/pinctrl-baytrail.c b/drivers/pinctrl/intel/pinctrl-baytrail.c
index b733ec31ad9d..4053e962fe7a 100644
--- a/drivers/pinctrl/intel/pinctrl-baytrail.c
+++ b/drivers/pinctrl/intel/pinctrl-baytrail.c
@@ -1370,7 +1370,7 @@ static void byt_gpio_irq_handler(struct irq_desc *desc)
 {
 	struct irq_data *data = irq_desc_get_irq_data(desc);
 	struct intel_pinctrl *vg = gpiochip_get_data(irq_desc_get_handler_data(desc));
-	struct irq_chip *chip = irq_data_get_irq_chip(data);
+	const struct irq_chip *chip = irq_data_get_irq_chip(data);
 	u32 base, pin;
 	void __iomem *reg;
 	unsigned long pending;
diff --git a/drivers/pinctrl/intel/pinctrl-cherryview.c b/drivers/pinctrl/intel/pinctrl-cherryview.c
index a33eca5eafc4..533db0d31b28 100644
--- a/drivers/pinctrl/intel/pinctrl-cherryview.c
+++ b/drivers/pinctrl/intel/pinctrl-cherryview.c
@@ -1395,7 +1395,7 @@ static void chv_gpio_irq_handler(struct irq_desc *desc)
 	struct device *dev = pctrl->dev;
 	const struct intel_community *community = &pctrl->communities[0];
 	struct intel_community_context *cctx = &pctrl->context.communities[0];
-	struct irq_chip *chip = irq_desc_get_chip(desc);
+	const struct irq_chip *chip = irq_desc_get_chip(desc);
 	unsigned long pending;
 	u32 intr_line;
 
diff --git a/drivers/pinctrl/intel/pinctrl-lynxpoint.c b/drivers/pinctrl/intel/pinctrl-lynxpoint.c
index 299ee4f22bdc..9f24274bd51c 100644
--- a/drivers/pinctrl/intel/pinctrl-lynxpoint.c
+++ b/drivers/pinctrl/intel/pinctrl-lynxpoint.c
@@ -554,7 +554,7 @@ static void lp_gpio_irq_handler(struct irq_desc *desc)
 	struct irq_data *data = irq_desc_get_irq_data(desc);
 	struct gpio_chip *gc = irq_desc_get_handler_data(desc);
 	struct intel_pinctrl *lg = gpiochip_get_data(gc);
-	struct irq_chip *chip = irq_data_get_irq_chip(data);
+	const struct irq_chip *chip = irq_data_get_irq_chip(data);
 	void __iomem *reg, *ena;
 	unsigned long pending;
 	u32 base, pin;
diff --git a/drivers/pinctrl/mediatek/mtk-eint.c b/drivers/pinctrl/mediatek/mtk-eint.c
index 47ac92ea98c2..2f9ddb05a9f2 100644
--- a/drivers/pinctrl/mediatek/mtk-eint.c
+++ b/drivers/pinctrl/mediatek/mtk-eint.c
@@ -354,7 +354,7 @@ mtk_eint_debounce_process(struct mtk_eint *eint, int index)
 
 static void mtk_eint_irq_handler(struct irq_desc *desc)
 {
-	struct irq_chip *chip = irq_desc_get_chip(desc);
+	const struct irq_chip *chip = irq_desc_get_chip(desc);
 	struct mtk_eint *eint = irq_desc_get_handler_data(desc);
 	unsigned int i, j, port, status, shift, mask, eint_num;
 	void __iomem *reg;
diff --git a/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c b/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
index 81dfbd5e7f07..bbfcd2ce2050 100644
--- a/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
+++ b/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
@@ -669,7 +669,7 @@ static int armada_37xx_edge_both_irq_swap_pol(struct armada_37xx_pinctrl *info,
 static void armada_37xx_irq_handler(struct irq_desc *desc)
 {
 	struct gpio_chip *gc = irq_desc_get_handler_data(desc);
-	struct irq_chip *chip = irq_desc_get_chip(desc);
+	const struct irq_chip *chip = irq_desc_get_chip(desc);
 	struct armada_37xx_pinctrl *info = gpiochip_get_data(gc);
 	struct irq_domain *d = gc->irq.domain;
 	int i;
diff --git a/drivers/pinctrl/nuvoton/pinctrl-ma35.c b/drivers/pinctrl/nuvoton/pinctrl-ma35.c
index f01344201628..9386694f2400 100644
--- a/drivers/pinctrl/nuvoton/pinctrl-ma35.c
+++ b/drivers/pinctrl/nuvoton/pinctrl-ma35.c
@@ -488,7 +488,7 @@ static void ma35_irq_demux_intgroup(struct irq_desc *desc)
 {
 	struct ma35_pin_bank *bank = gpiochip_get_data(irq_desc_get_handler_data(desc));
 	struct irq_domain *irqdomain = bank->chip.irq.domain;
-	struct irq_chip *irqchip = irq_desc_get_chip(desc);
+	const struct irq_chip *irqchip = irq_desc_get_chip(desc);
 	unsigned long isr;
 	int offset;
 
diff --git a/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c b/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
index 13ed87d5d30c..ea808f1e220b 100644
--- a/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
+++ b/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
@@ -204,7 +204,7 @@ static int npcmgpio_gpio_request(struct gpio_chip *chip, unsigned int offset)
 static void npcmgpio_irq_handler(struct irq_desc *desc)
 {
 	struct gpio_chip *gc;
-	struct irq_chip *chip;
+	const struct irq_chip *chip;
 	struct npcm7xx_gpio *bank;
 	unsigned long sts, en, bit;
 
diff --git a/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c b/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
index 0aae1a253459..e58cb5373156 100644
--- a/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
+++ b/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
@@ -206,7 +206,7 @@ static void npcmgpio_irq_handler(struct irq_desc *desc)
 {
 	unsigned long sts, en, bit;
 	struct npcm8xx_gpio *bank;
-	struct irq_chip *chip;
+	const struct irq_chip *chip;
 	struct gpio_chip *gc;
 
 	gc = irq_desc_get_handler_data(desc);
diff --git a/drivers/pinctrl/nuvoton/pinctrl-wpcm450.c b/drivers/pinctrl/nuvoton/pinctrl-wpcm450.c
index d624a4d302a8..b78fde44c280 100644
--- a/drivers/pinctrl/nuvoton/pinctrl-wpcm450.c
+++ b/drivers/pinctrl/nuvoton/pinctrl-wpcm450.c
@@ -308,7 +308,7 @@ static void wpcm450_gpio_irqhandler(struct irq_desc *desc)
 {
 	struct wpcm450_gpio *gpio = gpiochip_get_data(irq_desc_get_handler_data(desc));
 	struct wpcm450_pinctrl *pctrl = gpio->pctrl;
-	struct irq_chip *chip = irq_desc_get_chip(desc);
+	const struct irq_chip *chip = irq_desc_get_chip(desc);
 	unsigned long pending;
 	unsigned long flags;
 	unsigned long ours;
diff --git a/drivers/pinctrl/pinctrl-apple-gpio.c b/drivers/pinctrl/pinctrl-apple-gpio.c
index 6305b96aaa73..3cba5378e546 100644
--- a/drivers/pinctrl/pinctrl-apple-gpio.c
+++ b/drivers/pinctrl/pinctrl-apple-gpio.c
@@ -341,7 +341,7 @@ static int apple_gpio_irq_set_type(struct irq_data *data, unsigned int type)
 
 static void apple_gpio_irq_handler(struct irq_desc *desc)
 {
-	struct irq_chip *chip = irq_desc_get_chip(desc);
+	const struct irq_chip *chip = irq_desc_get_chip(desc);
 	u8 *grpp = irq_desc_get_handler_data(desc);
 	struct apple_gpio_pinctrl *pctl;
 	unsigned int pinh, pinl;
diff --git a/drivers/pinctrl/pinctrl-at91-pio4.c b/drivers/pinctrl/pinctrl-at91-pio4.c
index 41cbb46ac589..76de638345ae 100644
--- a/drivers/pinctrl/pinctrl-at91-pio4.c
+++ b/drivers/pinctrl/pinctrl-at91-pio4.c
@@ -278,7 +278,7 @@ static void atmel_gpio_irq_handler(struct irq_desc *desc)
 {
 	unsigned int irq = irq_desc_get_irq(desc);
 	struct atmel_pioctrl *atmel_pioctrl = irq_desc_get_handler_data(desc);
-	struct irq_chip *chip = irq_desc_get_chip(desc);
+	const struct irq_chip *chip = irq_desc_get_chip(desc);
 	unsigned long isr;
 	int n, bank = -1;
 
diff --git a/drivers/pinctrl/pinctrl-at91.c b/drivers/pinctrl/pinctrl-at91.c
index 0a57ed51d4c9..bcce217f427b 100644
--- a/drivers/pinctrl/pinctrl-at91.c
+++ b/drivers/pinctrl/pinctrl-at91.c
@@ -1690,7 +1690,7 @@ static int at91_gpio_resume(struct device *dev)
 
 static void gpio_irq_handler(struct irq_desc *desc)
 {
-	struct irq_chip *chip = irq_desc_get_chip(desc);
+	const struct irq_chip *chip = irq_desc_get_chip(desc);
 	struct gpio_chip *gpio_chip = irq_desc_get_handler_data(desc);
 	struct at91_gpio_chip *at91_gpio = gpiochip_get_data(gpio_chip);
 	void __iomem	*pio = at91_gpio->regbase;
diff --git a/drivers/pinctrl/pinctrl-equilibrium.c b/drivers/pinctrl/pinctrl-equilibrium.c
index 349eb944b4ac..3c39607df77d 100644
--- a/drivers/pinctrl/pinctrl-equilibrium.c
+++ b/drivers/pinctrl/pinctrl-equilibrium.c
@@ -159,7 +159,7 @@ static void eqbr_irq_handler(struct irq_desc *desc)
 {
 	struct gpio_chip *gc = irq_desc_get_handler_data(desc);
 	struct eqbr_gpio_ctrl *gctrl = gpiochip_get_data(gc);
-	struct irq_chip *ic = irq_desc_get_chip(desc);
+	const struct irq_chip *ic = irq_desc_get_chip(desc);
 	unsigned long pins, offset;
 
 	chained_irq_enter(ic, desc);
diff --git a/drivers/pinctrl/pinctrl-ingenic.c b/drivers/pinctrl/pinctrl-ingenic.c
index 29d7f4e54bc7..70c701b3c78b 100644
--- a/drivers/pinctrl/pinctrl-ingenic.c
+++ b/drivers/pinctrl/pinctrl-ingenic.c
@@ -3780,7 +3780,7 @@ static void ingenic_gpio_irq_handler(struct irq_desc *desc)
 {
 	struct gpio_chip *gc = irq_desc_get_handler_data(desc);
 	struct ingenic_gpio_chip *jzgc = gpiochip_get_data(gc);
-	struct irq_chip *irq_chip = irq_data_get_irq_chip(&desc->irq_data);
+	const struct irq_chip *irq_chip = irq_data_get_irq_chip(&desc->irq_data);
 	unsigned long flag, i;
 
 	chained_irq_enter(irq_chip, desc);
diff --git a/drivers/pinctrl/pinctrl-keembay.c b/drivers/pinctrl/pinctrl-keembay.c
index 3241d3ae6219..4bacae3f0c9b 100644
--- a/drivers/pinctrl/pinctrl-keembay.c
+++ b/drivers/pinctrl/pinctrl-keembay.c
@@ -1247,7 +1247,7 @@ static void keembay_gpio_irq_handler(struct irq_desc *desc)
 	struct gpio_chip *gc = irq_desc_get_handler_data(desc);
 	unsigned int kmb_irq = irq_desc_get_irq(desc);
 	unsigned long reg, clump = 0, bit = 0;
-	struct irq_chip *parent_chip;
+	const struct irq_chip *parent_chip;
 	struct keembay_pinctrl *kpc;
 	unsigned int src, pin, val;
 
diff --git a/drivers/pinctrl/pinctrl-microchip-sgpio.c b/drivers/pinctrl/pinctrl-microchip-sgpio.c
index 7a6cb5f502b0..5d28c6abb3ff 100644
--- a/drivers/pinctrl/pinctrl-microchip-sgpio.c
+++ b/drivers/pinctrl/pinctrl-microchip-sgpio.c
@@ -757,7 +757,7 @@ static const struct irq_chip microchip_sgpio_irqchip = {
 
 static void sgpio_irq_handler(struct irq_desc *desc)
 {
-	struct irq_chip *parent_chip = irq_desc_get_chip(desc);
+	const struct irq_chip *parent_chip = irq_desc_get_chip(desc);
 	struct gpio_chip *chip = irq_desc_get_handler_data(desc);
 	struct sgpio_bank *bank = gpiochip_get_data(chip);
 	struct sgpio_priv *priv = bank->priv;
diff --git a/drivers/pinctrl/pinctrl-ocelot.c b/drivers/pinctrl/pinctrl-ocelot.c
index 0fe0527863b8..ad436505a985 100644
--- a/drivers/pinctrl/pinctrl-ocelot.c
+++ b/drivers/pinctrl/pinctrl-ocelot.c
@@ -2197,7 +2197,7 @@ static void ocelot_irq_mask(struct irq_data *data)
 static void ocelot_irq_work(struct work_struct *work)
 {
 	struct ocelot_irq_work *w = container_of(work, struct ocelot_irq_work, irq_work);
-	struct irq_chip *parent_chip = irq_desc_get_chip(w->irq_desc);
+	const struct irq_chip *parent_chip = irq_desc_get_chip(w->irq_desc);
 	struct gpio_chip *chip = irq_desc_get_chip_data(w->irq_desc);
 	struct irq_data *data = irq_desc_get_irq_data(w->irq_desc);
 	unsigned int gpio = irqd_to_hwirq(data);
@@ -2329,7 +2329,7 @@ static int ocelot_irq_set_type(struct irq_data *data, unsigned int type)
 
 static void ocelot_irq_handler(struct irq_desc *desc)
 {
-	struct irq_chip *parent_chip = irq_desc_get_chip(desc);
+	const struct irq_chip *parent_chip = irq_desc_get_chip(desc);
 	struct gpio_chip *chip = irq_desc_get_handler_data(desc);
 	struct ocelot_pinctrl *info = gpiochip_get_data(chip);
 	unsigned int id_reg = OCELOT_GPIO_INTR_IDENT * info->stride;
diff --git a/drivers/pinctrl/pinctrl-pic32.c b/drivers/pinctrl/pinctrl-pic32.c
index 07a24e17d35b..db497d4274f0 100644
--- a/drivers/pinctrl/pinctrl-pic32.c
+++ b/drivers/pinctrl/pinctrl-pic32.c
@@ -2093,7 +2093,7 @@ static void pic32_gpio_irq_handler(struct irq_desc *desc)
 {
 	struct gpio_chip *gc = irq_desc_get_handler_data(desc);
 	struct pic32_gpio_bank *bank = gpiochip_get_data(gc);
-	struct irq_chip *chip = irq_desc_get_chip(desc);
+	const struct irq_chip *chip = irq_desc_get_chip(desc);
 	unsigned long pending;
 	unsigned int pin;
 	u32 stat;
diff --git a/drivers/pinctrl/pinctrl-pistachio.c b/drivers/pinctrl/pinctrl-pistachio.c
index 0b33b01dbaad..b4f6ab457521 100644
--- a/drivers/pinctrl/pinctrl-pistachio.c
+++ b/drivers/pinctrl/pinctrl-pistachio.c
@@ -1306,7 +1306,7 @@ static void pistachio_gpio_irq_handler(struct irq_desc *desc)
 {
 	struct gpio_chip *gc = irq_desc_get_handler_data(desc);
 	struct pistachio_gpio_bank *bank = gpiochip_get_data(gc);
-	struct irq_chip *chip = irq_desc_get_chip(desc);
+	const struct irq_chip *chip = irq_desc_get_chip(desc);
 	unsigned long pending;
 	unsigned int pin;
 
diff --git a/drivers/pinctrl/pinctrl-rp1.c b/drivers/pinctrl/pinctrl-rp1.c
index fc4ed68ea5ac..7ffecd3fe086 100644
--- a/drivers/pinctrl/pinctrl-rp1.c
+++ b/drivers/pinctrl/pinctrl-rp1.c
@@ -861,7 +861,7 @@ static const struct gpio_chip rp1_gpio_chip = {
 static void rp1_gpio_irq_handler(struct irq_desc *desc)
 {
 	struct gpio_chip *chip = irq_desc_get_handler_data(desc);
-	struct irq_chip *host_chip = irq_desc_get_chip(desc);
+	const struct irq_chip *host_chip = irq_desc_get_chip(desc);
 	struct rp1_pinctrl *pc = gpiochip_get_data(chip);
 	const struct rp1_iobank_desc *bank;
 	int irq = irq_desc_get_irq(desc);
diff --git a/drivers/pinctrl/pinctrl-single.c b/drivers/pinctrl/pinctrl-single.c
index 4d5f85b7e6bb..ebd4b8a5412a 100644
--- a/drivers/pinctrl/pinctrl-single.c
+++ b/drivers/pinctrl/pinctrl-single.c
@@ -1530,7 +1530,7 @@ static irqreturn_t pcs_irq_handler(int irq, void *d)
 static void pcs_irq_chain_handler(struct irq_desc *desc)
 {
 	struct pcs_soc_data *pcs_soc = irq_desc_get_handler_data(desc);
-	struct irq_chip *chip;
+	const struct irq_chip *chip;
 
 	chip = irq_desc_get_chip(desc);
 	chained_irq_enter(chip, desc);
diff --git a/drivers/pinctrl/pinctrl-st.c b/drivers/pinctrl/pinctrl-st.c
index 8ce88e591f47..ba9ab0d6be20 100644
--- a/drivers/pinctrl/pinctrl-st.c
+++ b/drivers/pinctrl/pinctrl-st.c
@@ -1438,7 +1438,7 @@ static void __gpio_irq_handler(struct st_gpio_bank *bank)
 static void st_gpio_irq_handler(struct irq_desc *desc)
 {
 	/* interrupt dedicated per bank */
-	struct irq_chip *chip = irq_desc_get_chip(desc);
+	const struct irq_chip *chip = irq_desc_get_chip(desc);
 	struct gpio_chip *gc = irq_desc_get_handler_data(desc);
 	struct st_gpio_bank *bank = gpiochip_get_data(gc);
 
@@ -1449,7 +1449,7 @@ static void st_gpio_irq_handler(struct irq_desc *desc)
 
 static void st_gpio_irqmux_handler(struct irq_desc *desc)
 {
-	struct irq_chip *chip = irq_desc_get_chip(desc);
+	const struct irq_chip *chip = irq_desc_get_chip(desc);
 	struct st_pinctrl *info = irq_desc_get_handler_data(desc);
 	unsigned long status;
 	int n;
diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
index 45b3a2763eb8..77dc2d7f0d9b 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm.c
@@ -1321,7 +1321,7 @@ static void msm_gpio_irq_handler(struct irq_desc *desc)
 	struct gpio_chip *gc = irq_desc_get_handler_data(desc);
 	const struct msm_pingroup *g;
 	struct msm_pinctrl *pctrl = gpiochip_get_data(gc);
-	struct irq_chip *chip = irq_desc_get_chip(desc);
+	const struct irq_chip *chip = irq_desc_get_chip(desc);
 	int handled = 0;
 	u32 val;
 	int i;
diff --git a/drivers/pinctrl/samsung/pinctrl-exynos.c b/drivers/pinctrl/samsung/pinctrl-exynos.c
index e8b2d47ebe45..159fa313291e 100644
--- a/drivers/pinctrl/samsung/pinctrl-exynos.c
+++ b/drivers/pinctrl/samsung/pinctrl-exynos.c
@@ -57,7 +57,7 @@ static inline struct exynos_irq_chip *to_exynos_irq_chip(const struct irq_chip *
 
 static void exynos_irq_mask(struct irq_data *irqd)
 {
-	struct irq_chip *chip = irq_data_get_irq_chip(irqd);
+	const struct irq_chip *chip = irq_data_get_irq_chip(irqd);
 	struct exynos_irq_chip *our_chip = to_exynos_irq_chip(chip);
 	struct samsung_pin_bank *bank = irq_data_get_irq_chip_data(irqd);
 	unsigned long reg_mask;
@@ -88,7 +88,7 @@ static void exynos_irq_mask(struct irq_data *irqd)
 
 static void exynos_irq_ack(struct irq_data *irqd)
 {
-	struct irq_chip *chip = irq_data_get_irq_chip(irqd);
+	const struct irq_chip *chip = irq_data_get_irq_chip(irqd);
 	struct exynos_irq_chip *our_chip = to_exynos_irq_chip(chip);
 	struct samsung_pin_bank *bank = irq_data_get_irq_chip_data(irqd);
 	unsigned long reg_pend;
@@ -111,7 +111,7 @@ static void exynos_irq_ack(struct irq_data *irqd)
 
 static void exynos_irq_unmask(struct irq_data *irqd)
 {
-	struct irq_chip *chip = irq_data_get_irq_chip(irqd);
+	const struct irq_chip *chip = irq_data_get_irq_chip(irqd);
 	struct exynos_irq_chip *our_chip = to_exynos_irq_chip(chip);
 	struct samsung_pin_bank *bank = irq_data_get_irq_chip_data(irqd);
 	unsigned long reg_mask;
@@ -153,7 +153,7 @@ static void exynos_irq_unmask(struct irq_data *irqd)
 
 static int exynos_irq_set_type(struct irq_data *irqd, unsigned int type)
 {
-	struct irq_chip *chip = irq_data_get_irq_chip(irqd);
+	const struct irq_chip *chip = irq_data_get_irq_chip(irqd);
 	struct exynos_irq_chip *our_chip = to_exynos_irq_chip(chip);
 	struct samsung_pin_bank *bank = irq_data_get_irq_chip_data(irqd);
 	unsigned int shift = EXYNOS_EINT_CON_LEN * irqd->hwirq;
@@ -697,7 +697,7 @@ static void exynos_irq_eint0_15(struct irq_desc *desc)
 {
 	struct exynos_weint_data *eintd = irq_desc_get_handler_data(desc);
 	struct samsung_pin_bank *bank = eintd->bank;
-	struct irq_chip *chip = irq_desc_get_chip(desc);
+	const struct irq_chip *chip = irq_desc_get_chip(desc);
 
 	chained_irq_enter(chip, desc);
 
@@ -721,7 +721,7 @@ static inline void exynos_irq_demux_eint(unsigned int pend,
 /* interrupt handler for wakeup interrupt 16 */
 static void exynos_irq_demux_eint16_31(struct irq_desc *desc)
 {
-	struct irq_chip *chip = irq_desc_get_chip(desc);
+	const struct irq_chip *chip = irq_desc_get_chip(desc);
 	struct exynos_muxed_weint_data *eintd = irq_desc_get_handler_data(desc);
 	unsigned int pend;
 	unsigned int mask;
diff --git a/drivers/pinctrl/samsung/pinctrl-s3c64xx.c b/drivers/pinctrl/samsung/pinctrl-s3c64xx.c
index 68715c09baa9..5ce8f32767c2 100644
--- a/drivers/pinctrl/samsung/pinctrl-s3c64xx.c
+++ b/drivers/pinctrl/samsung/pinctrl-s3c64xx.c
@@ -417,7 +417,7 @@ static const struct irq_domain_ops s3c64xx_gpio_irqd_ops = {
 
 static void s3c64xx_eint_gpio_irq(struct irq_desc *desc)
 {
-	struct irq_chip *chip = irq_desc_get_chip(desc);
+	const struct irq_chip *chip = irq_desc_get_chip(desc);
 	struct s3c64xx_eint_gpio_data *data = irq_desc_get_handler_data(desc);
 	struct samsung_pinctrl_drv_data *drvdata = data->drvdata;
 
@@ -604,7 +604,7 @@ static struct irq_chip s3c64xx_eint0_irq_chip = {
 
 static inline void s3c64xx_irq_demux_eint(struct irq_desc *desc, u32 range)
 {
-	struct irq_chip *chip = irq_desc_get_chip(desc);
+	const struct irq_chip *chip = irq_desc_get_chip(desc);
 	struct s3c64xx_eint0_data *data = irq_desc_get_handler_data(desc);
 	struct samsung_pinctrl_drv_data *drvdata = data->drvdata;
 	unsigned int pend, mask;
diff --git a/drivers/pinctrl/spear/pinctrl-plgpio.c b/drivers/pinctrl/spear/pinctrl-plgpio.c
index 1ec22010a3f9..0c185739d326 100644
--- a/drivers/pinctrl/spear/pinctrl-plgpio.c
+++ b/drivers/pinctrl/spear/pinctrl-plgpio.c
@@ -372,7 +372,7 @@ static void plgpio_irq_handler(struct irq_desc *desc)
 {
 	struct gpio_chip *gc = irq_desc_get_handler_data(desc);
 	struct plgpio *plgpio = gpiochip_get_data(gc);
-	struct irq_chip *irqchip = irq_desc_get_chip(desc);
+	const struct irq_chip *irqchip = irq_desc_get_chip(desc);
 	int regs_count, count, pin, offset, i = 0;
 	u32 pending;
 	unsigned long pendingl;
diff --git a/drivers/pinctrl/starfive/pinctrl-starfive-jh7100.c b/drivers/pinctrl/starfive/pinctrl-starfive-jh7100.c
index 25cb98d9c54e..4e9193300485 100644
--- a/drivers/pinctrl/starfive/pinctrl-starfive-jh7100.c
+++ b/drivers/pinctrl/starfive/pinctrl-starfive-jh7100.c
@@ -1175,7 +1175,7 @@ static const struct irq_chip starfive_irq_chip = {
 static void starfive_gpio_irq_handler(struct irq_desc *desc)
 {
 	struct starfive_pinctrl *sfp = starfive_from_irq_desc(desc);
-	struct irq_chip *chip = irq_desc_get_chip(desc);
+	const struct irq_chip *chip = irq_desc_get_chip(desc);
 	unsigned long mis;
 	unsigned int pin;
 
diff --git a/drivers/pinctrl/starfive/pinctrl-starfive-jh7110-aon.c b/drivers/pinctrl/starfive/pinctrl-starfive-jh7110-aon.c
index 3433b3c91692..7ee8e465e93d 100644
--- a/drivers/pinctrl/starfive/pinctrl-starfive-jh7110-aon.c
+++ b/drivers/pinctrl/starfive/pinctrl-starfive-jh7110-aon.c
@@ -95,7 +95,7 @@ static int jh7110_aon_get_padcfg_base(struct jh7110_pinctrl *sfp,
 static void jh7110_aon_irq_handler(struct irq_desc *desc)
 {
 	struct jh7110_pinctrl *sfp = jh7110_from_irq_desc(desc);
-	struct irq_chip *chip = irq_desc_get_chip(desc);
+	const struct irq_chip *chip = irq_desc_get_chip(desc);
 	unsigned long mis;
 	unsigned int pin;
 
diff --git a/drivers/pinctrl/starfive/pinctrl-starfive-jh7110-sys.c b/drivers/pinctrl/starfive/pinctrl-starfive-jh7110-sys.c
index 44f84e4c29bf..100dcd8a787f 100644
--- a/drivers/pinctrl/starfive/pinctrl-starfive-jh7110-sys.c
+++ b/drivers/pinctrl/starfive/pinctrl-starfive-jh7110-sys.c
@@ -359,7 +359,7 @@ static int jh7110_sys_get_padcfg_base(struct jh7110_pinctrl *sfp,
 static void jh7110_sys_irq_handler(struct irq_desc *desc)
 {
 	struct jh7110_pinctrl *sfp = jh7110_from_irq_desc(desc);
-	struct irq_chip *chip = irq_desc_get_chip(desc);
+	const struct irq_chip *chip = irq_desc_get_chip(desc);
 	unsigned long mis;
 	unsigned int pin;
 
diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
index 25489beeb312..7ca5e1d2c4f6 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
@@ -1306,7 +1306,7 @@ static const struct irq_domain_ops sunxi_pinctrl_irq_domain_ops = {
 static void sunxi_pinctrl_irq_handler(struct irq_desc *desc)
 {
 	unsigned int irq = irq_desc_get_irq(desc);
-	struct irq_chip *chip = irq_desc_get_chip(desc);
+	const struct irq_chip *chip = irq_desc_get_chip(desc);
 	struct sunxi_pinctrl *pctl = irq_desc_get_handler_data(desc);
 	unsigned long bank, reg, val;
 
diff --git a/drivers/sh/intc/core.c b/drivers/sh/intc/core.c
index aa68fe190865..3a52a3dfd748 100644
--- a/drivers/sh/intc/core.c
+++ b/drivers/sh/intc/core.c
@@ -404,7 +404,7 @@ static int intc_suspend(void *data)
 		/* enable wakeup irqs belonging to this intc controller */
 		for_each_active_irq(irq) {
 			struct irq_data *data;
-			struct irq_chip *chip;
+			const struct irq_chip *chip;
 
 			data = irq_get_irq_data(irq);
 			chip = irq_data_get_irq_chip(data);
@@ -429,7 +429,7 @@ static void intc_resume(void *data)
 
 		for_each_active_irq(irq) {
 			struct irq_data *data;
-			struct irq_chip *chip;
+			const struct irq_chip *chip;
 
 			data = irq_get_irq_data(irq);
 			chip = irq_data_get_irq_chip(data);
diff --git a/drivers/sh/intc/internals.h b/drivers/sh/intc/internals.h
index 9b6cd1bebb4e..ce68367d49d8 100644
--- a/drivers/sh/intc/internals.h
+++ b/drivers/sh/intc/internals.h
@@ -90,7 +90,7 @@ enum {	MODE_ENABLE_REG = 0, /* Bit(s) set -> interrupt enabled */
 
 static inline struct intc_desc_int *get_intc_desc(unsigned int irq)
 {
-	struct irq_chip *chip = irq_get_chip(irq);
+	const struct irq_chip *chip = irq_get_chip(irq);
 
 	return container_of(chip, struct intc_desc_int, chip);
 }
diff --git a/drivers/sh/intc/virq.c b/drivers/sh/intc/virq.c
index 291798526519..b59f7c1b2533 100644
--- a/drivers/sh/intc/virq.c
+++ b/drivers/sh/intc/virq.c
@@ -111,7 +111,7 @@ static void intc_virq_handler(struct irq_desc *desc)
 {
 	unsigned int irq = irq_desc_get_irq(desc);
 	struct irq_data *data = irq_desc_get_irq_data(desc);
-	struct irq_chip *chip = irq_data_get_irq_chip(data);
+	const struct irq_chip *chip = irq_data_get_irq_chip(data);
 	struct intc_virq_list *entry, *vlist = irq_data_get_irq_handler_data(data);
 	struct intc_desc_int *d = get_intc_desc(irq);
 
diff --git a/drivers/soc/fsl/qe/qe_ic.c b/drivers/soc/fsl/qe/qe_ic.c
index 943911053af6..317dfed7a568 100644
--- a/drivers/soc/fsl/qe/qe_ic.c
+++ b/drivers/soc/fsl/qe/qe_ic.c
@@ -362,7 +362,7 @@ static void qe_ic_cascade_low(struct irq_desc *desc)
 {
 	struct qe_ic *qe_ic = irq_desc_get_handler_data(desc);
 	unsigned int cascade_irq = qe_ic_get_low_irq(qe_ic);
-	struct irq_chip *chip = irq_desc_get_chip(desc);
+	const struct irq_chip *chip = irq_desc_get_chip(desc);
 
 	if (cascade_irq != 0)
 		generic_handle_irq(cascade_irq);
@@ -375,7 +375,7 @@ static void qe_ic_cascade_high(struct irq_desc *desc)
 {
 	struct qe_ic *qe_ic = irq_desc_get_handler_data(desc);
 	unsigned int cascade_irq = qe_ic_get_high_irq(qe_ic);
-	struct irq_chip *chip = irq_desc_get_chip(desc);
+	const struct irq_chip *chip = irq_desc_get_chip(desc);
 
 	if (cascade_irq != 0)
 		generic_handle_irq(cascade_irq);
@@ -388,7 +388,7 @@ static void qe_ic_cascade_muxed_mpic(struct irq_desc *desc)
 {
 	struct qe_ic *qe_ic = irq_desc_get_handler_data(desc);
 	unsigned int cascade_irq;
-	struct irq_chip *chip = irq_desc_get_chip(desc);
+	const struct irq_chip *chip = irq_desc_get_chip(desc);
 
 	cascade_irq = qe_ic_get_high_irq(qe_ic);
 	if (cascade_irq == 0)
diff --git a/drivers/spmi/spmi-mtk-pmif.c b/drivers/spmi/spmi-mtk-pmif.c
index 1048420b5afb..d9b3eae7d7f1 100644
--- a/drivers/spmi/spmi-mtk-pmif.c
+++ b/drivers/spmi/spmi-mtk-pmif.c
@@ -474,7 +474,7 @@ static int pmif_spmi_write_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
 static void mtk_spmi_handle_chained_irq(struct irq_desc *desc)
 {
 	struct pmif_bus *pbus = irq_desc_get_handler_data(desc);
-	struct irq_chip *chip = irq_desc_get_chip(desc);
+	const struct irq_chip *chip = irq_desc_get_chip(desc);
 	struct pmif *arb = to_mtk_pmif(pbus->ctrl);
 	u8 regidx_min, regidx_max;
 	bool irq_handled = false;
diff --git a/drivers/spmi/spmi-pmic-arb.c b/drivers/spmi/spmi-pmic-arb.c
index 69f8d456324a..9e5a4fcad410 100644
--- a/drivers/spmi/spmi-pmic-arb.c
+++ b/drivers/spmi/spmi-pmic-arb.c
@@ -700,7 +700,7 @@ static void pmic_arb_chained_irq(struct irq_desc *desc)
 	struct spmi_pmic_arb_bus *bus = irq_desc_get_handler_data(desc);
 	struct spmi_pmic_arb *pmic_arb = bus->pmic_arb;
 	const struct pmic_arb_ver_ops *ver_ops = pmic_arb->ver_ops;
-	struct irq_chip *chip = irq_desc_get_chip(desc);
+	const struct irq_chip *chip = irq_desc_get_chip(desc);
 	int first = bus->min_apid;
 	int last = bus->max_apid;
 	/*
diff --git a/kernel/irq/chip.c b/kernel/irq/chip.c
index 04e478a2adaa..957e4264bf46 100644
--- a/kernel/irq/chip.c
+++ b/kernel/irq/chip.c
@@ -451,7 +451,7 @@ void unmask_irq(struct irq_desc *desc)
 
 void unmask_threaded_irq(struct irq_desc *desc)
 {
-	struct irq_chip *chip = desc->irq_data.chip;
+	const struct irq_chip *chip = irq_desc_get_chip(desc);
 
 	if (chip->flags & IRQCHIP_EOI_THREADED)
 		chip->irq_eoi(&desc->irq_data);
@@ -738,7 +738,7 @@ static inline void cond_eoi_irq(const struct irq_chip *chip, struct irq_data *da
  */
 void handle_fasteoi_irq(struct irq_desc *desc)
 {
-	struct irq_chip *chip = desc->irq_data.chip;
+	const struct irq_chip *chip = irq_desc_get_chip(desc);
 
 	guard(raw_spinlock)(&desc->lock);
 
@@ -790,7 +790,7 @@ EXPORT_SYMBOL_GPL(handle_fasteoi_irq);
  */
 void handle_fasteoi_nmi(struct irq_desc *desc)
 {
-	struct irq_chip *chip = irq_desc_get_chip(desc);
+	const struct irq_chip *chip = irq_desc_get_chip(desc);
 	struct irqaction *action = desc->action;
 	unsigned int irq = irq_desc_get_irq(desc);
 	irqreturn_t res;
@@ -869,7 +869,7 @@ EXPORT_SYMBOL(handle_edge_irq);
  */
 void handle_percpu_irq(struct irq_desc *desc)
 {
-	struct irq_chip *chip = irq_desc_get_chip(desc);
+	const struct irq_chip *chip = irq_desc_get_chip(desc);
 
 	/*
 	 * PER CPU interrupts are not serialized. Do not touch
@@ -902,7 +902,7 @@ void handle_percpu_irq(struct irq_desc *desc)
  */
 void handle_percpu_devid_irq(struct irq_desc *desc)
 {
-	struct irq_chip *chip = irq_desc_get_chip(desc);
+	const struct irq_chip *chip = irq_desc_get_chip(desc);
 	unsigned int irq = irq_desc_get_irq(desc);
 	unsigned int cpu = smp_processor_id();
 	struct irqaction *action;
@@ -1090,7 +1090,7 @@ void irq_cpu_online(void)
 
 	for_each_active_irq(irq) {
 		struct irq_desc *desc = irq_to_desc(irq);
-		struct irq_chip *chip;
+		const struct irq_chip *chip;
 
 		if (!desc)
 			continue;
@@ -1116,7 +1116,7 @@ void irq_cpu_offline(void)
 
 	for_each_active_irq(irq) {
 		struct irq_desc *desc = irq_to_desc(irq);
-		struct irq_chip *chip;
+		const struct irq_chip *chip;
 
 		if (!desc)
 			continue;
@@ -1145,7 +1145,7 @@ void irq_cpu_offline(void)
  */
 void handle_fasteoi_ack_irq(struct irq_desc *desc)
 {
-	struct irq_chip *chip = desc->irq_data.chip;
+	const struct irq_chip *chip = irq_desc_get_chip(desc);
 
 	guard(raw_spinlock)(&desc->lock);
 
@@ -1183,7 +1183,7 @@ EXPORT_SYMBOL_GPL(handle_fasteoi_ack_irq);
  */
 void handle_fasteoi_mask_irq(struct irq_desc *desc)
 {
-	struct irq_chip *chip = desc->irq_data.chip;
+	const struct irq_chip *chip = irq_desc_get_chip(desc);
 
 	guard(raw_spinlock)(&desc->lock);
 	mask_ack_irq(desc);
diff --git a/kernel/irq/cpuhotplug.c b/kernel/irq/cpuhotplug.c
index cd5689e383b0..b51ab7d4d45e 100644
--- a/kernel/irq/cpuhotplug.c
+++ b/kernel/irq/cpuhotplug.c
@@ -53,7 +53,7 @@ static inline bool irq_needs_fixup(struct irq_data *d)
 static bool migrate_one_irq(struct irq_desc *desc)
 {
 	struct irq_data *d = irq_desc_get_irq_data(desc);
-	struct irq_chip *chip = irq_data_get_irq_chip(d);
+	const struct irq_chip *chip = irq_data_get_irq_chip(d);
 	bool maskchip = !irq_can_move_pcntxt(d) && !irqd_irq_masked(d);
 	const struct cpumask *affinity;
 	bool brokeaff = false;
diff --git a/kernel/irq/debugfs.c b/kernel/irq/debugfs.c
index 5c5ebaee35f2..4d456d10cf53 100644
--- a/kernel/irq/debugfs.c
+++ b/kernel/irq/debugfs.c
@@ -59,7 +59,7 @@ static const struct irq_bit_descr irqchip_flags[] = {
 static void
 irq_debug_show_chip(struct seq_file *m, struct irq_data *data, int ind)
 {
-	struct irq_chip *chip = data->chip;
+	const struct irq_chip *chip = irq_data_get_irq_chip(data);
 
 	if (!chip) {
 		seq_printf(m, "chip: None\n");
diff --git a/kernel/irq/ipi.c b/kernel/irq/ipi.c
index 961d4af76af3..a6e950dd3759 100644
--- a/kernel/irq/ipi.c
+++ b/kernel/irq/ipi.c
@@ -227,7 +227,7 @@ static int ipi_send_verify(struct irq_chip *chip, struct irq_data *data,
 int __ipi_send_single(struct irq_desc *desc, unsigned int cpu)
 {
 	struct irq_data *data = irq_desc_get_irq_data(desc);
-	struct irq_chip *chip = irq_data_get_irq_chip(data);
+	const struct irq_chip *chip = irq_data_get_irq_chip(data);
 
 #ifdef DEBUG
 	/*
@@ -269,7 +269,7 @@ int __ipi_send_single(struct irq_desc *desc, unsigned int cpu)
 int __ipi_send_mask(struct irq_desc *desc, const struct cpumask *dest)
 {
 	struct irq_data *data = irq_desc_get_irq_data(desc);
-	struct irq_chip *chip = irq_data_get_irq_chip(data);
+	const struct irq_chip *chip = irq_data_get_irq_chip(data);
 	unsigned int cpu;
 
 #ifdef DEBUG
diff --git a/kernel/irq/kexec.c b/kernel/irq/kexec.c
index 1a3deffe6b5b..63d724d1b3df 100644
--- a/kernel/irq/kexec.c
+++ b/kernel/irq/kexec.c
@@ -13,7 +13,7 @@ void machine_kexec_mask_interrupts(void)
 	unsigned int i;
 
 	for_each_irq_desc(i, desc) {
-		struct irq_chip *chip;
+		const struct irq_chip *chip;
 		int check_eoi = 1;
 
 		chip = irq_desc_get_chip(desc);
diff --git a/kernel/irq/manage.c b/kernel/irq/manage.c
index 1aa5e465bec8..92fb069730cd 100644
--- a/kernel/irq/manage.c
+++ b/kernel/irq/manage.c
@@ -216,7 +216,7 @@ static void irq_set_thread_affinity(struct irq_desc *desc)
 static void irq_validate_effective_affinity(struct irq_data *data)
 {
 	const struct cpumask *m = irq_data_get_effective_affinity_mask(data);
-	struct irq_chip *chip = irq_data_get_irq_chip(data);
+	const struct irq_chip *chip = irq_data_get_irq_chip(data);
 
 	if (!cpumask_empty(m))
 		return;
@@ -233,7 +233,7 @@ int irq_do_set_affinity(struct irq_data *data, const struct cpumask *mask, bool
 {
 	struct cpumask *tmp_mask = this_cpu_ptr(&__tmp_mask);
 	struct irq_desc *desc = irq_data_to_desc(data);
-	struct irq_chip *chip = irq_data_get_irq_chip(data);
+	const struct irq_chip *chip = irq_data_get_irq_chip(data);
 	const struct cpumask  *prog_mask;
 	int ret;
 
@@ -376,7 +376,7 @@ void irq_affinity_schedule_notify_work(struct irq_desc *desc)
 int irq_set_affinity_locked(struct irq_data *data, const struct cpumask *mask,
 			    bool force)
 {
-	struct irq_chip *chip = irq_data_get_irq_chip(data);
+	const struct irq_chip *chip = irq_data_get_irq_chip(data);
 	struct irq_desc *desc = irq_data_to_desc(data);
 	int ret = 0;
 
@@ -924,7 +924,7 @@ bool can_request_irq(unsigned int irq, unsigned long irqflags)
 
 int __irq_set_trigger(struct irq_desc *desc, unsigned long flags)
 {
-	struct irq_chip *chip = desc->irq_data.chip;
+	const struct irq_chip *chip = irq_desc_get_chip(desc);
 	int ret, unmask = 0;
 
 	if (!chip || !chip->irq_set_type) {
@@ -2683,7 +2683,7 @@ void teardown_percpu_nmi(unsigned int irq)
 
 static int __irq_get_irqchip_state(struct irq_data *data, enum irqchip_irq_state which, bool *state)
 {
-	struct irq_chip *chip;
+	const struct irq_chip *chip;
 	int err = -EINVAL;
 
 	do {
diff --git a/kernel/irq/migration.c b/kernel/irq/migration.c
index f2b2929986ff..bca5e0f639c4 100644
--- a/kernel/irq/migration.c
+++ b/kernel/irq/migration.c
@@ -49,7 +49,7 @@ void irq_move_masked_irq(struct irq_data *idata)
 {
 	struct irq_desc *desc = irq_data_to_desc(idata);
 	struct irq_data *data = &desc->irq_data;
-	struct irq_chip *chip = data->chip;
+	const struct irq_chip *chip = irq_data_get_irq_chip(data);
 
 	if (likely(!irqd_is_setaffinity_pending(data)))
 		return;
-- 
2.54.0

