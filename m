From: Scott Feldman <sfeldma@pobox.com>
Date: Sun, 03 Oct 2004 06:20:11 +0000
Subject: [Kernel-janitors] [PATCH 5/6] janitor: net/tg3: pci_find_device to
Message-Id: <1096784411.3819.163.camel@sfeldma-mobl2.dsl-verizon.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============45802399054418985=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============45802399054418985==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Replace pci_find_device with pci_dev_present.  Compile tested.

Signed-off-by: Scott Feldman <sfeldma@pobox.com>

--- linux-2.6.9-rc3/drivers/net/tg3.c	2004-10-02 21:17:24.000000000 -0700
+++ linux-2.6.9-rc3-dsf/drivers/net/tg3.c	2004-10-02 21:51:00.000000000 -0700
@@ -7314,6 +7314,19 @@ static int __devinit tg3_is_sun_570X(str
 
 static int __devinit tg3_get_invariants(struct tg3 *tp)
 {
+	static struct pci_device_id write_reorder_chipsets[] = {
+		{ PCI_DEVICE(PCI_VENDOR_ID_INTEL,
+		             PCI_DEVICE_ID_INTEL_82801AA_8) },
+		{ PCI_DEVICE(PCI_VENDOR_ID_INTEL,
+		             PCI_DEVICE_ID_INTEL_82801AB_8) },
+		{ PCI_DEVICE(PCI_VENDOR_ID_INTEL,
+		             PCI_DEVICE_ID_INTEL_82801BA_11) },
+		{ PCI_DEVICE(PCI_VENDOR_ID_INTEL,
+		             PCI_DEVICE_ID_INTEL_82801BA_6) },
+		{ PCI_DEVICE(PCI_VENDOR_ID_AMD,
+		             PCI_DEVICE_ID_AMD_FE_GATE_700C) },
+		{ },
+	};
 	u32 misc_ctrl_reg;
 	u32 cacheline_sz_reg;
 	u32 pci_state_reg, grc_misc_cfg;
@@ -7332,16 +7345,7 @@ static int __devinit tg3_get_invariants(
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
+	if (pci_dev_present(write_reorder_chipsets))
 		tp->tg3_flags |= TG3_FLAG_MBOX_WRITE_REORDER;
 
 	/* Force memory write invalidate off.  If we leave it on,



--===============45802399054418985==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============45802399054418985==--
