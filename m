From: Amit Gud <amitg@calsoftinc.com>
Date: Mon, 14 Feb 2005 06:44:37 +0000
Subject: [KJ] [PATCH 17/18] sound/pci/ remove pci_find_{device, subsys}
Message-Id: <200502141202.39179.amitg@calsoftinc.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============79953156917419488=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============79953156917419488==
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Remove deprecated pci_find_device and pci_find_subsys

Do consider applying.

Signed-off-by: Amit Gud <gud@eth.net>

diff -uprN orig/sound/pci/ali5451/ali5451.c linux-2.6.11-rc3/sound/pci/ali5451/ali5451.c
--- orig/sound/pci/ali5451/ali5451.c	2005-02-11 15:20:12.000000000 +0530
+++ linux-2.6.11-rc3/sound/pci/ali5451/ali5451.c	2005-02-14 05:37:04.000000000 +0530
@@ -314,7 +314,7 @@ static void ali_read_cfg(unsigned int ve
 	int i,j;
 
 
-        pci_dev = pci_find_device(vendor, deviceid, pci_dev);
+        pci_dev = pci_get_device(vendor, deviceid, pci_dev);
         if (pci_dev == NULL)
                 return ;
 
@@ -2152,7 +2152,7 @@ static int __devinit snd_ali_create(snd_
 	codec->chregs.data.ainten = 0x00;
 
 	/* M1533: southbridge */
-       	pci_dev = pci_find_device(0x10b9, 0x1533, NULL);
+       	pci_dev = pci_get_device(0x10b9, 0x1533, NULL);
 	codec->pci_m1533 = pci_dev;
 	if (! codec->pci_m1533) {
 		snd_printk(KERN_ERR "ali5451: cannot find ALi 1533 chip.\n");
@@ -2160,7 +2160,7 @@ static int __devinit snd_ali_create(snd_
 		return -ENODEV;
 	}
 	/* M7101: power management */
-       	pci_dev = pci_find_device(0x10b9, 0x7101, NULL);
+       	pci_dev = pci_get_device(0x10b9, 0x7101, NULL);
 	codec->pci_m7101 = pci_dev;
 	if (! codec->pci_m7101 && codec->revision == ALI_5451_V02) {
 		snd_printk(KERN_ERR "ali5451: cannot find ALi 7101 chip.\n");
diff -uprN orig/sound/pci/au88x0/au88x0.c linux-2.6.11-rc3/sound/pci/au88x0/au88x0.c
--- orig/sound/pci/au88x0/au88x0.c	2005-02-11 15:20:12.000000000 +0530
+++ linux-2.6.11-rc3/sound/pci/au88x0/au88x0.c	2005-02-14 05:37:41.000000000 +0530
@@ -84,14 +84,14 @@ static void __devinit snd_vortex_workaro
 	/* autodetect if workarounds are required */
 	if (fix == 255) {
 		/* VIA KT133 */
-		via = pci_find_device(PCI_VENDOR_ID_VIA, PCI_DEVICE_ID_VIA_8365_1, NULL);
+		via = pci_get_device(PCI_VENDOR_ID_VIA, PCI_DEVICE_ID_VIA_8365_1, NULL);
 		/* VIA Apollo */
 		if (via == NULL) {
-			via = pci_find_device(PCI_VENDOR_ID_VIA, PCI_DEVICE_ID_VIA_82C598_1, NULL);
+			via = pci_get_device(PCI_VENDOR_ID_VIA, PCI_DEVICE_ID_VIA_82C598_1, NULL);
 		}
 		/* AMD Irongate */
 		if (via == NULL) {
-			via = pci_find_device(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_FE_GATE_7007, NULL);
+			via = pci_get_device(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_FE_GATE_7007, NULL);
 		}
 		if (via) {
 			printk(KERN_INFO CARD_NAME ": Activating latency workaround...\n");
@@ -101,11 +101,11 @@ static void __devinit snd_vortex_workaro
 	} else {
 		if (fix & 0x1)
 			vortex_fix_latency(vortex);
-		if ((fix & 0x2) && (via = pci_find_device(PCI_VENDOR_ID_VIA, PCI_DEVICE_ID_VIA_8365_1, NULL)))
+		if ((fix & 0x2) && (via = pci_get_device(PCI_VENDOR_ID_VIA, PCI_DEVICE_ID_VIA_8365_1, NULL)))
 			vortex_fix_agp_bridge(via);
-		if ((fix & 0x4) && (via = pci_find_device(PCI_VENDOR_ID_VIA, PCI_DEVICE_ID_VIA_82C598_1, NULL)))
+		if ((fix & 0x4) && (via = pci_get_device(PCI_VENDOR_ID_VIA, PCI_DEVICE_ID_VIA_82C598_1, NULL)))
 			vortex_fix_agp_bridge(via);
-		if ((fix & 0x8) && (via = pci_find_device(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_FE_GATE_7007, NULL)))
+		if ((fix & 0x8) && (via = pci_get_device(PCI_VENDOR_ID_AMD, PCI_DEVICE_ID_AMD_FE_GATE_7007, NULL)))
 			vortex_fix_agp_bridge(via);
 	}
 }
diff -uprN orig/sound/pci/cs46xx/cs46xx_lib.c linux-2.6.11-rc3/sound/pci/cs46xx/cs46xx_lib.c
--- orig/sound/pci/cs46xx/cs46xx_lib.c	2005-02-11 15:20:12.000000000 +0530
+++ linux-2.6.11-rc3/sound/pci/cs46xx/cs46xx_lib.c	2005-02-14 05:37:47.000000000 +0530
@@ -3582,7 +3582,7 @@ static void clkrun_init(cs46xx_t *chip)
 {
 	u8 pp;
 
-	chip->acpi_dev = pci_find_device(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_82371AB_3, NULL);
+	chip->acpi_dev = pci_get_device(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_82371AB_3, NULL);
 	if (chip->acpi_dev == NULL)
 		return;		/* Not a thinkpad thats for sure */
 
diff -uprN orig/sound/pci/via82xx.c linux-2.6.11-rc3/sound/pci/via82xx.c
--- orig/sound/pci/via82xx.c	2005-02-11 15:20:13.000000000 +0530
+++ linux-2.6.11-rc3/sound/pci/via82xx.c	2005-02-14 05:37:53.000000000 +0530
@@ -1880,7 +1880,7 @@ static int __devinit snd_via82xx_chip_in
 		 * DXS channels don't work properly with VRA if MC97 is disabled.
 		 */
 		struct pci_dev *pci;
-		pci = pci_find_device(0x1106, 0x3068, NULL); /* MC97 */
+		pci = pci_get_device(0x1106, 0x3068, NULL); /* MC97 */
 		if (pci) {
 			unsigned char data;
 			pci_read_config_byte(pci, 0x44, &data);


--===============79953156917419488==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============79953156917419488==--
