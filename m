From: Tobias Klauser <tklauser@nuerscht.ch>
Date: Sun, 20 Feb 2005 16:49:13 +0000
Subject: [KJ] [PATCH 01/19] drivers/scsi/a100u2w: Use the DMA_{64,
Message-Id: <20050220164913.GA14375@helium.tklauser.home>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============79768042074496548=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@lists.osdl.org
Cc: linux-scsi@vger.kernel.org

--===============79768042074496548==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello,

Description: Use the DMA_{64,32}BIT_MASK constants from dma-mapping.h
when calling pci_set_dma_mask() or pci_set_consistent_dma_mask()
See http://marc.theaimsgroup.com/?t=108001993000001&r=1&w=2 for details

Signed-off-by: Tobias Klauser <tklauser@nuerscht.ch>

--- linux-2.6.11-rc4.orig/drivers/scsi/a100u2w.c	2005-02-13 17:13:07.000000000 +0100
+++ linux-2.6.11-rc4/drivers/scsi/a100u2w.c	2005-02-16 21:31:35.000000000 +0100
@@ -1052,7 +1052,7 @@ static int __devinit inia100_probe_one(s
 
 	if (pci_enable_device(pdev))
 		goto out;
-	if (pci_set_dma_mask(pdev, 0xffffffffULL)) {
+	if (pci_set_dma_mask(pdev, DMA_32BIT_MASK)) {
 		printk(KERN_WARNING "Unable to set 32bit DMA "
 				    "on inia100 adapter, ignoring.\n");
 		goto out_disable_device;

--===============79768042074496548==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============79768042074496548==--
