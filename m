From: Amit Gud <amitg@calsoftinc.com>
Date: Mon, 14 Feb 2005 06:01:49 +0000
Subject: [KJ] [PATCH 7/18] drivers/media/ remove pci_find_{device, subsys}
Message-Id: <200502141119.51099.amitg@calsoftinc.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============23894791388649228=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============23894791388649228==
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Remove deprecated pci_find_device and pci_find_subsys


AG
--
May the source be with you


Signed-off-by: Amit Gud <gud@eth.net>


diff -uprN orig/drivers/media/radio/radio-maestro.c linux-2.6.11-rc3/drivers/media/radio/radio-maestro.c
--- orig/drivers/media/radio/radio-maestro.c	2005-02-11 15:19:47.000000000 +0530
+++ linux-2.6.11-rc3/drivers/media/radio/radio-maestro.c	2005-02-14 02:17:13.000000000 +0530
@@ -265,11 +265,11 @@ static int __init maestro_radio_init(voi
 {
 	register __u16 found=0;
 	struct pci_dev *pcidev = NULL;
-	while(!found && (pcidev = pci_find_device(PCI_VENDOR_ESS, 
+	while(!found && (pcidev = pci_get_device(PCI_VENDOR_ESS, 
 						  PCI_DEVICE_ID_ESS_ESS1968,
 						  pcidev)))
 		found |= radio_install(pcidev);
-	while(!found && (pcidev = pci_find_device(PCI_VENDOR_ESS,
+	while(!found && (pcidev = pci_get_device(PCI_VENDOR_ESS,
 						  PCI_DEVICE_ID_ESS_ESS1978, 
 						  pcidev)))
 		found |= radio_install(pcidev);
diff -uprN orig/drivers/media/video/bttv-cards.c linux-2.6.11-rc3/drivers/media/video/bttv-cards.c
--- orig/drivers/media/video/bttv-cards.c	2005-02-11 15:19:47.000000000 +0530
+++ linux-2.6.11-rc3/drivers/media/video/bttv-cards.c	2005-02-14 02:17:22.000000000 +0530
@@ -4124,7 +4124,7 @@ void __devinit bttv_check_chipset(void)
 	if (UNSET != latency)
 		printk(KERN_INFO "bttv: pci latency fixup [%d]\n",latency);
 
-	while ((dev = pci_find_device(PCI_VENDOR_ID_INTEL,
+	while ((dev = pci_get_device(PCI_VENDOR_ID_INTEL,
 				      PCI_DEVICE_ID_INTEL_82441, dev))) {
                 unsigned char b;
 		pci_read_config_byte(dev, 0x53, &b);
diff -uprN orig/drivers/media/video/stradis.c linux-2.6.11-rc3/drivers/media/video/stradis.c
--- orig/drivers/media/video/stradis.c	2005-02-11 15:19:47.000000000 +0530
+++ linux-2.6.11-rc3/drivers/media/video/stradis.c	2005-02-14 02:17:28.000000000 +0530
@@ -2227,7 +2227,7 @@ static int __init stradis_init (void)
 
 	saa_num = 0;
 
-	while ((dev = pci_find_device(PCI_VENDOR_ID_PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7146, dev))) {
+	while ((dev = pci_get_device(PCI_VENDOR_ID_PHILIPS, PCI_DEVICE_ID_PHILIPS_SAA7146, dev))) {
 		if (!dev->subsystem_vendor)
 			printk(KERN_INFO "stradis%d: rev1 decoder\n", saa_num);
 		else
diff -uprN orig/drivers/media/video/zoran_card.c linux-2.6.11-rc3/drivers/media/video/zoran_card.c
--- orig/drivers/media/video/zoran_card.c	2005-02-11 15:19:47.000000000 +0530
+++ linux-2.6.11-rc3/drivers/media/video/zoran_card.c	2005-02-14 02:17:33.000000000 +0530
@@ -1195,7 +1195,7 @@ find_zr36057 (void)
 	zoran_num = 0;
 	while (zoran_num < BUZ_MAX &&
 	       (dev =
-		pci_find_device(PCI_VENDOR_ID_ZORAN,
+		pci_get_device(PCI_VENDOR_ID_ZORAN,
 				PCI_DEVICE_ID_ZORAN_36057, dev)) != NULL) {
 		card_num = card[zoran_num];
 		zr = &zoran[zoran_num];
diff -uprN orig/drivers/media/video/zr36120.c linux-2.6.11-rc3/drivers/media/video/zr36120.c
--- orig/drivers/media/video/zr36120.c	2005-02-11 15:19:47.000000000 +0530
+++ linux-2.6.11-rc3/drivers/media/video/zr36120.c	2005-02-14 02:17:40.000000000 +0530
@@ -1841,7 +1841,7 @@ int __init find_zoran(void)
 	unsigned char revision;
 	int zoran_num=0;
 
-	while ((dev = pci_find_device(PCI_VENDOR_ID_ZORAN,PCI_DEVICE_ID_ZORAN_36120, dev)))
+	while ((dev = pci_get_device(PCI_VENDOR_ID_ZORAN,PCI_DEVICE_ID_ZORAN_36120, dev)))
 	{
 		/* Ok, a ZR36120/ZR36125 found! */
 		ztv = &zorans[zoran_num];


--===============23894791388649228==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============23894791388649228==--
