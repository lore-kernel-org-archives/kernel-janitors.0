From: Hanna Linder <hannal@us.ibm.com>
Date: Thu, 07 Oct 2004 23:40:48 +0000
Subject: [Kernel-janitors] [PATCH 2.6][11/12] prpmc750.c replace
Message-Id: <35580000.1097192448@w-hlinder.beaverton.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============20500018377655893=="
List-Id: <kernel-janitors.vger.kernel.org>
To: lkml <linux-kernel@vger.kernel.org>
Cc: kernel-janitors <kernel-janitors@lists.osdl.org>, greg@kroah.com, hannal@us.ibm.com, paulus@samba.org, benh@kernel.crashing.org

--===============20500018377655893==
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


As pci_find_device is going away I've replaced it with pci_get_device.
If someone with a PPC system could test it I would appreciate it.

Thanks.

Hanna Linder
IBM Linux Technology Center

Signed-off-by: Hanna Linder <hannal@us.ibm.com>

---
diff -Nrup linux-2.6.9-rc3-mm3cln/arch/ppc/platforms/prpmc750.c linux-2.6.9-rc3-mm3patch2/arch/ppc/platforms/prpmc750.c
--- linux-2.6.9-rc3-mm3cln/arch/ppc/platforms/prpmc750.c	2004-09-29 20:05:27.000000000 -0700
+++ linux-2.6.9-rc3-mm3patch2/arch/ppc/platforms/prpmc750.c	2004-10-07 16:27:24.605503808 -0700
@@ -109,7 +109,7 @@ static void __init prpmc750_pcibios_fixu
 	 * resource subsystem doesn't fixup the
 	 * PCI mem resources on the CL5446.
 	 */
-	if ((dev = pci_find_device(PCI_VENDOR_ID_CIRRUS,
+	if ((dev = pci_get_device(PCI_VENDOR_ID_CIRRUS,
 				   PCI_DEVICE_ID_CIRRUS_5446, 0))) {
 		dev->resource[0].start += PRPMC750_PCI_PHY_MEM_OFFSET;
 		dev->resource[0].end += PRPMC750_PCI_PHY_MEM_OFFSET;
@@ -121,6 +121,7 @@ static void __init prpmc750_pcibios_fixu
 		outb(0x0f, 0x3c4);
 		/* Set proper DRAM config */
 		outb(0xdf, 0x3c5);
+		pci_dev_put(dev);
 	}
 }
 


--===============20500018377655893==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============20500018377655893==--
