From: Scott Feldman <sfeldma@pobox.com>
Date: Tue, 21 Sep 2004 06:53:08 +0000
Subject: [Kernel-janitors] [PATCH -mm 8/9] pci_find_device to pci_get_device
Message-Id: <1095749588.3790.97.camel@sfeldma-mobl2.dsl-verizon.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============46612823336349507=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============46612823336349507==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Use pci_get_device instead of pci_find_device as pci device returned
from pci_find_device can disappear at any momemt in time.

Signed-off-by: Scott Feldman <sfeldma@pobox.com>

diff -Naurp linux-2.6.9-rc2-mm1/drivers/net/tulip/tulip_core.c linux-2.6.9-rc2-mm1-dsf/drivers/net/tulip/tulip_core.c
--- linux-2.6.9-rc2-mm1/drivers/net/tulip/tulip_core.c	2004-09-20 22:36:25.021862648 -0700
+++ linux-2.6.9-rc2-mm1-dsf/drivers/net/tulip/tulip_core.c	2004-09-20 23:03:01.000000000 -0700
@@ -1234,6 +1234,7 @@ static int __devinit tulip_init_one (str
 	const char *chip_name = tulip_tbl[chip_idx].chip_name;
 	unsigned int eeprom_missing = 0;
 	unsigned int force_csr0 = 0;
+	struct pci_dev *dev_cs;
 
 #ifndef MODULE
 	static int did_version;		/* Already printed version info. */
@@ -1279,14 +1280,16 @@ static int __devinit tulip_init_one (str
 	   thankfully it's an old 486 chipset.
 	*/
 
-	if (pci_find_device(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_82424, NULL)) {
+	if ((dev_cs = pci_find_device(PCI_VENDOR_ID_INTEL, PCI_DEVICE_ID_INTEL_82424, NULL))) {
 		csr0 = MRL | MRM | (8 << BurstLenShift) | (1 << CALShift);
 		force_csr0 = 1;
+		pci_dev_put(dev_cs);
 	}
 	/* The dreaded SiS496 486 chipset. Same workaround as above. */
-	if (pci_find_device(PCI_VENDOR_ID_SI, PCI_DEVICE_ID_SI_496, NULL)) {
+	if ((dev_cs = pci_find_device(PCI_VENDOR_ID_SI, PCI_DEVICE_ID_SI_496, NULL))) {
 		csr0 = MRL | MRM | (8 << BurstLenShift) | (1 << CALShift);
 		force_csr0 = 1;
+		pci_dev_put(dev_cs);
 	}
 
 	/* bugfix: the ASIX must have a burst limit or horrible things happen. */



--===============46612823336349507==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============46612823336349507==--
