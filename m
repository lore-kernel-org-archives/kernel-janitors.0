From: Hanna Linder <hannal@us.ibm.com>
Date: Wed, 06 Oct 2004 23:42:42 +0000
Subject: [Kernel-janitors] [PATCH 2.6] [3/12] k2.c replace pci_find_device
Message-Id: <57450000.1097106162@w-hlinder.beaverton.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============053627507859347112=="
List-Id: <kernel-janitors.vger.kernel.org>
To: lkml <linux-kernel@vger.kernel.org>
Cc: kernel-janitors <kernel-janitors@lists.osdl.org>, greg@kroah.com, hannal@us.ibm.com, paulus@samba.org

--===============053627507859347112==
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


As pci_find_device is going away I have replaced this call with pci_get_device.
If someone with a PPC system could verify it I would appreciate it.

Hanna Linder
IBM Linux Technology Center

Signed-off-by: Hanna Linder <hannal@us.ibm.com>

----
diff -Nrup linux-2.6.9-rc3-mm2cln/arch/ppc/platforms/k2.c linux-2.6.9-rc3-mm2patch/arch/ppc/platforms/k2.c
--- linux-2.6.9-rc3-mm2cln/arch/ppc/platforms/k2.c	2004-09-29 20:03:45.000000000 -0700
+++ linux-2.6.9-rc3-mm2patch/arch/ppc/platforms/k2.c	2004-10-06 16:33:25.278918216 -0700
@@ -116,7 +116,7 @@ void k2_pcibios_fixup(void)
 	/*
 	 * Enable DMA support on hdc
 	 */
-	ide_dev = pci_find_device(PCI_VENDOR_ID_AL,
+	ide_dev = pci_get_device(PCI_VENDOR_ID_AL,
 				  PCI_DEVICE_ID_AL_M5229, NULL);
 
 	if (ide_dev) {
@@ -126,6 +126,7 @@ void k2_pcibios_fixup(void)
 		ide_dma_base = pci_resource_start(ide_dev, 4);
 		outb(0x00, ide_dma_base + 0x2);
 		outb(0x20, ide_dma_base + 0xa);
+		pci_dev_put(ide_dev);
 	}
 #endif
 }




--===============053627507859347112==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============053627507859347112==--
