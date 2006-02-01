From: Eric Sesterhenn / snakebyte <snakebyte@gmx.de>
Date: Wed, 01 Feb 2006 00:28:11 +0000
Subject: [KJ] [Patch] BUG_ON() Conversion in drivers/parisc/
Message-Id: <1138753691.9742.14.camel@alice>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============56101761082446=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1138753677.9742.10.camel@alice>
In-Reply-To: <1138753677.9742.10.camel@alice>
To: kernel-janitors@vger.kernel.org

--===============56101761082446==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi,

this changes if() BUG(); constructs to BUG_ON() which is
cleaner, contains unlikely() and can better optimized away.

Signed-off-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.16-rc1-git4/drivers/parisc/sba_iommu.c.orig	2006-01-31 21:36:12.000000000 +0100
+++ linux-2.6.16-rc1-git4/drivers/parisc/sba_iommu.c	2006-01-31 21:36:59.000000000 +0100
@@ -1722,9 +1722,7 @@ printk("sba_hw_init(): mem_boot 0x%x 0x%
 		sba_dev->chip_resv.start = PCI_F_EXTEND | 0xfef00000UL;
 		sba_dev->chip_resv.end   = PCI_F_EXTEND | (0xff000000UL - 1) ;
 		err = request_resource(&iomem_resource, &(sba_dev->chip_resv));
-		if (err < 0) {
-			BUG();
-		}
+		BUG_ON(err < 0);
 
 	} else if (IS_PLUTO(sba_dev->iodc)) {
 		int err;
@@ -2155,8 +2153,7 @@ void sba_directed_lmmio(struct parisc_de
 	int i;
 	int rope = (pci_hba->hw_path & (ROPES_PER_IOC-1));  /* rope # */
 
-	if ((t!=HPHW_IOA) && (t!=HPHW_BCPORT))
-		BUG();
+	BUG_ON((t!=HPHW_IOA) && (t!=HPHW_BCPORT));
 
 	r->start = r->end = 0;
 
@@ -2198,8 +2195,7 @@ void sba_distributed_lmmio(struct parisc
 	int base, size;
 	int rope = (pci_hba->hw_path & (ROPES_PER_IOC-1));  /* rope # */
 
-	if ((t!=HPHW_IOA) && (t!=HPHW_BCPORT))
-		BUG();
+	BUG_ON((t!=HPHW_IOA) && (t!=HPHW_BCPORT));
 
 	r->start = r->end = 0;
 
--- linux-2.6.16-rc1-git4/drivers/parisc/superio.c.orig	2006-01-31 21:37:17.000000000 +0100
+++ linux-2.6.16-rc1-git4/drivers/parisc/superio.c	2006-01-31 21:38:31.000000000 +0100
@@ -154,8 +154,8 @@ superio_init(struct pci_dev *pcidev)
         if (sio->suckyio_irq_enabled)                                       
 		return;
 
-	if (!pdev) BUG();
-	if (!sio->usb_pdev) BUG();
+	BUG_ON(!pdev);
+	BUG_ON(!sio->usb_pdev);
 
 	/* use the IRQ iosapic found for USB INT D... */
 	pdev->irq = sio->usb_pdev->irq;
@@ -471,8 +471,7 @@ superio_probe(struct pci_dev *dev, const
 		dev->subsystem_vendor, dev->subsystem_device,
 		dev->class);
 
-	if (!sio->suckyio_irq_enabled)
-		BUG(); /* Enabled by PCI_FIXUP_FINAL */
+	BUG_ON(!sio->suckyio_irq_enabled);	/* Enabled by PCI_FIXUP_FINAL */
 
 	if (dev->device == PCI_DEVICE_ID_NS_87560_LIO) {	/* Function 1 */
 		superio_parport_init();



--===============56101761082446==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============56101761082446==--
