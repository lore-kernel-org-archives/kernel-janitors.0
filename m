From: Scott Feldman <sfeldma@pobox.com>
Date: Tue, 21 Sep 2004 06:53:06 +0000
Subject: [Kernel-janitors] [PATCH -mm 7/9] pci_find_device to pci_get_device
Message-Id: <1095749585.3790.95.camel@sfeldma-mobl2.dsl-verizon.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============2200759469289979=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============2200759469289979==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Use pci_get_device instead of pci_find_device as pci device returned
from pci_find_device can disappear at any momemt in time.

Signed-off-by: Scott Feldman <sfeldma@pobox.com>

diff -Naurp linux-2.6.9-rc2-mm1/drivers/net/tg3.c linux-2.6.9-rc2-mm1-dsf/drivers/net/tg3.c
--- linux-2.6.9-rc2-mm1/drivers/net/tg3.c	2004-09-20 22:36:25.000865840 -0700
+++ linux-2.6.9-rc2-mm1-dsf/drivers/net/tg3.c	2004-09-20 22:39:02.362943168 -0700
@@ -7325,6 +7325,7 @@ static int __devinit tg3_get_invariants(
 	u32 pci_state_reg, grc_misc_cfg;
 	u32 val;
 	u16 pci_cmd;
+	struct pci_dev *pdev;
 	int err;
 
 #ifdef CONFIG_SPARC64
@@ -7338,17 +7339,19 @@ static int __devinit tg3_get_invariants(
 	 * every mailbox register write to force the writes to be
 	 * posted to the chip in order.
 	 */
-	if (pci_find_device(PCI_VENDOR_ID_INTEL,
-			    PCI_DEVICE_ID_INTEL_82801AA_8, NULL) ||
-	    pci_find_device(PCI_VENDOR_ID_INTEL,
-			    PCI_DEVICE_ID_INTEL_82801AB_8, NULL) ||
-	    pci_find_device(PCI_VENDOR_ID_INTEL,
-			    PCI_DEVICE_ID_INTEL_82801BA_11, NULL) ||
-	    pci_find_device(PCI_VENDOR_ID_INTEL,
-			    PCI_DEVICE_ID_INTEL_82801BA_6, NULL) ||
-	    pci_find_device(PCI_VENDOR_ID_AMD,
-			    PCI_DEVICE_ID_AMD_FE_GATE_700C, NULL))
+	if ((pdev = pci_get_device(PCI_VENDOR_ID_INTEL,
+			    PCI_DEVICE_ID_INTEL_82801AA_8, NULL)) ||
+	    (pdev = pci_get_device(PCI_VENDOR_ID_INTEL,
+			    PCI_DEVICE_ID_INTEL_82801AB_8, NULL)) ||
+	    (pdev = pci_get_device(PCI_VENDOR_ID_INTEL,
+			    PCI_DEVICE_ID_INTEL_82801BA_11, NULL)) ||
+	    (pdev = pci_get_device(PCI_VENDOR_ID_INTEL,
+			    PCI_DEVICE_ID_INTEL_82801BA_6, NULL)) ||
+	    (pdev = pci_get_device(PCI_VENDOR_ID_AMD,
+			    PCI_DEVICE_ID_AMD_FE_GATE_700C, NULL))) {
 		tp->tg3_flags |= TG3_FLAG_MBOX_WRITE_REORDER;
+		pci_dev_put(pdev);
+	}
 
 	/* Force memory write invalidate off.  If we leave it on,
 	 * then on 5700_BX chips we have to enable a workaround.



--===============2200759469289979==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============2200759469289979==--
