From: "Scott Thompson" <postfail@hushmail.com>
Date: Mon, 13 Aug 2007 04:00:38 +0000
Subject: [PATCH 1 of 5 ] /drivers/char ioremap balancing/ returncode check
Message-Id: <20070813040039.71A3DDA820@mailserver8.hushmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, dri-devel@lists.sourceforge.net

patchset against 2.6.23-rc2 and this set is an audit of 
/drivers/char/a* 
through drivers/char .   

this corrects missing ioremap return checks and balancing on 
iounmap calls..

Signed-off-by: Scott Thompson <postfail <at> hushmail.com>
----------------------------------------------------------
diff --git a/drivers/char/hpet.c b/drivers/char/hpet.c
index 77bf4aa..53d233e 100644
--- a/drivers/char/hpet.c
+++ b/drivers/char/hpet.c
@@ -936,6 +936,12 @@ static acpi_status hpet_resources(struct 
acpi_resource *res, void *data)
 		hdp->hd_phys_address = addr.minimum;
 		hdp->hd_address = ioremap(addr.minimum, addr.address_length);
 
+		if (!hdp->hd_address) {
+			printk(KERN_DEBUG "%s: ioremap failed\n",
+				__FUNCTION__);
+			return -ENOMEM;
+		}
+
 		if (hpet_is_known(hdp)) {
 			printk(KERN_DEBUG "%s: 0x%lx is busy\n",
 				__FUNCTION__, hdp->hd_phys_address);
@@ -953,6 +959,12 @@ static acpi_status hpet_resources(struct 
acpi_resource *res, void *data)
 		hdp->hd_address = ioremap(fixmem32->address,
 						HPET_RANGE_SIZE);
 
+		if (!hdp->hd_address) {
+			printk(KERN_DEBUG "%s: ioremap failed\n",
+				__FUNCTION__);
+			return -ENOMEM;
+		}
+
 		if (hpet_is_known(hdp)) {
 			printk(KERN_DEBUG "%s: 0x%lx is busy\n",
 				__FUNCTION__, hdp->hd_phys_address);
diff --git a/drivers/char/moxa.c b/drivers/char/moxa.c
index ed76f0a..094323d 100644
--- a/drivers/char/moxa.c
+++ b/drivers/char/moxa.c
@@ -447,6 +447,13 @@ static int __init moxa_init(void)
 	for (i = 0; i < numBoards; i++) {
 		moxa_boards[i].basemem = ioremap(moxa_boards[i].baseAddr,
 				0x4000);
+		if (!moxa_boards[i].basemem) { 
+			for (;i > 0;i--)
+				if (moxa_boards[i].basemem)
+					iounmap(moxa_boards[i].basemem);
+
+			return -ENOMEM; 
+		}
 	}
 
 	return retval;
diff --git a/drivers/char/sx.c b/drivers/char/sx.c
index 85a2328..30829ed 100644
--- a/drivers/char/sx.c
+++ b/drivers/char/sx.c
@@ -2627,6 +2627,12 @@ static void __devinit fix_sx_pci(struct 
pci_dev *pdev, struct sx_board *board)
 	pci_read_config_dword(pdev, PCI_BASE_ADDRESS_0, &hwbase);
 	hwbase &= PCI_BASE_ADDRESS_MEM_MASK;
 	rebase = ioremap(hwbase, 0x80);
+	if (!rebase) {
+		printk(KERN_DEBUG 
+			"sx:ioremap fail, unable to perform cntrl reg fix\n");
+		return;
+	}
+		
 	t = readl(rebase + CNTRL_REG_OFFSET);
 	if (t != CNTRL_REG_GOODVALUE) {
 		printk(KERN_DEBUG "sx: performing cntrl reg fix: %08x -> "
diff --git a/drivers/char/vr41xx_giu.c b/drivers/char/vr41xx_giu.c
index e5ed091..2381162 100644
--- a/drivers/char/vr41xx_giu.c
+++ b/drivers/char/vr41xx_giu.c
@@ -639,8 +639,10 @@ static int __devinit giu_probe(struct 
platform_device *dev)
 	}
 
 	irq = platform_get_irq(dev, 0);
-	if (irq < 0 || irq >= NR_IRQS)
+	if (irq < 0 || irq >= NR_IRQS) {
+		iounmap(giu_base);
 		return -EBUSY;
+	}
 
 	return cascade_irq(irq, giu_get_irq);
 }

