From: Hanna Linder <hannal@us.ibm.com>
Date: Fri, 08 Oct 2004 22:35:28 +0000
Subject: [KJ] [RFT 2.6] pci_iommu.c replace pci_find_device with
Message-Id: <84740000.1097274928@w-hlinder.beaverton.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============87098182223998744=="
List-Id: <kernel-janitors.vger.kernel.org>
To: lkml <linux-kernel@vger.kernel.org>, kernel-janitors <kernel-janitors@lists.osdl.org>
Cc: greg@kroah.com, hannal@us.ibm.com, davem@davemloft.net, ecd@skynet.be, jj@sunsite.ms.mff.cuni.cz, anton@samba.org

--===============87098182223998744==
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

As pci_find_device is going away I've replaced it with pci_get_device.
If someone with a Sparc64 system could test it I would appreciate it.
Thanks.

Hanna Linder
IBM Linux Technology Center

Signed-off-by: Hanna Linder <hannal@us.ibm.com>
---
diff -Nrup linux-2.6.9-rc3-mm3cln/arch/sparc64/kernel/pci_iommu.c linux-2.6.9-rc3-mm3patch3/arch/sparc64/kernel/pci_iommu.c
--- linux-2.6.9-rc3-mm3cln/arch/sparc64/kernel/pci_iommu.c	2004-09-29 20:03:56.000000000 -0700
+++ linux-2.6.9-rc3-mm3patch3/arch/sparc64/kernel/pci_iommu.c	2004-10-08 15:23:37.585502792 -0700
@@ -814,7 +814,7 @@ static void ali_sound_dma_hack(struct pc
 	/* ALI sound chips generate 31-bits of DMA, a special register
 	 * determines what bit 31 is emitted as.
 	 */
-	ali_isa_bridge = pci_find_device(PCI_VENDOR_ID_AL,
+	ali_isa_bridge = pci_get_device(PCI_VENDOR_ID_AL,
 					 PCI_DEVICE_ID_AL_M1533,
 					 NULL);
 
@@ -824,6 +824,7 @@ static void ali_sound_dma_hack(struct pc
 	else
 		val &= ~0x01;
 	pci_write_config_byte(ali_isa_bridge, 0x7e, val);
+	pci_dev_put(ali_isa_bridge);
 }
 
 int pci_dma_supported(struct pci_dev *pdev, u64 device_mask)


--===============87098182223998744==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============87098182223998744==--
