From: Scott Feldman <sfeldma@pobox.com>
Date: Sun, 03 Oct 2004 06:20:34 +0000
Subject: [Kernel-janitors] [PATCH 6/6] janitor: net/tulip: pci_find_device
Message-Id: <1096784434.3819.166.camel@sfeldma-mobl2.dsl-verizon.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============98969099350390133=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============98969099350390133==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Replace pci_find_device with pci_dev_present.  Compile tested.

Signed-off-by: Scott Feldman <sfeldma@pobox.com>

--- linux-2.6.9-rc3/drivers/net/tulip/tulip_core.c	2004-08-14 03:55:34.000000000 -0700
+++ linux-2.6.9-rc3-dsf/drivers/net/tulip/tulip_core.c	2004-10-02 22:01:22.000000000 -0700
@@ -1236,6 +1236,11 @@ static int __devinit tulip_init_one (str
 	struct tulip_private *tp;
 	/* See note below on the multiport cards. */
 	static unsigned char last_phys_addr[6] = {0x00, 'L', 'i', 'n', 'u', 'x'};
+	static struct pci_device_id early_486_chipsets[] = {
+		{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_82424) },
+		{ PCI_DEVICE(PCI_VENDOR_ID_SI, PCI_DEVICE_ID_SI_496) },
+		{ },
+	};
 	static int last_irq;
 	static int multiport_cnt;	/* For four-port boards w/one EEPROM */
 	u8 chip_rev;
@@ -1289,17 +1294,15 @@ static int __devinit tulip_init_one (str
 	 *	without the workarounds being on.
 	 */
 
-	/* Intel Saturn. Switch to 8 long words burst, 8 long word cache aligned
-	   Aries might need this too. The Saturn errata are not pretty reading but
-	   thankfully it's an old 486 chipset.
+	/* 1. Intel Saturn. Switch to 8 long words burst, 8 long word cache
+	      aligned.  Aries might need this too. The Saturn errata are not 
+	      pretty reading but thankfully it's an old 486 chipset.
+
+	   2. The dreaded SiS496 486 chipset. Same workaround as Intel
+	      Saturn.
 	*/
 
-	if (pci_find_device(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_82424, NULL)) {
-		csr0 = MRL | MRM | (8 << BurstLenShift) | (1 << CALShift);
-		force_csr0 = 1;
-	}
-	/* The dreaded SiS496 486 chipset. Same workaround as above. */
-	if (pci_find_device(PCI_VENDOR_ID_SI, PCI_DEVICE_ID_SI_496, NULL)) {
+	if (pci_dev_present(early_486_chipsets)) {
 		csr0 = MRL | MRM | (8 << BurstLenShift) | (1 << CALShift);
 		force_csr0 = 1;
 	}



--===============98969099350390133==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============98969099350390133==--
