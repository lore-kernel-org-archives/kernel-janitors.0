From: Tobias Klauser <tklauser@nuerscht.ch>
Date: Sun, 20 Feb 2005 17:05:52 +0000
Subject: [KJ] [PATCH 11/19] drivers/scsi/gdth: Use the DMA_{64,
Message-Id: <20050220170552.GL14375@helium.tklauser.home>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============56352401222882076=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@lists.osdl.org
Cc: linux-scsi@vger.kernel.org

--===============56352401222882076==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello,

Description: Use the DMA_{64,32}BIT_MASK constants from dma-mapping.h
when calling pci_set_dma_mask() or pci_set_consistent_dma_mask()
See http://marc.theaimsgroup.com/?t=108001993000001&r=1&w=2 for details

Signed-off-by: Tobias Klauser <tklauser@nuerscht.ch>

--- linux-2.6.11-rc4.orig/drivers/scsi/gdth.c	2005-02-13 17:13:06.000000000 +0100
+++ linux-2.6.11-rc4/drivers/scsi/gdth.c	2005-02-16 21:22:37.000000000 +0100
@@ -4529,15 +4529,15 @@ int __init gdth_detect(Scsi_Host_Templat
             if (!(ha->cache_feat & ha->raw_feat & ha->screen_feat &GDT_64BIT)||
                 /* 64-bit DMA only supported from FW >= x.43 */
                 (!ha->dma64_support)) {
-                if (pci_set_dma_mask(pcistr[ctr].pdev, 0xffffffff)) {
+                if (pci_set_dma_mask(pcistr[ctr].pdev, DMA_32BIT_MASK)) {
                     printk(KERN_WARNING "GDT-PCI %d: Unable to set 32-bit DMA\n", hanum);
                     err = TRUE;
                 }
             } else {
                 shp->max_cmd_len = 16;
-                if (!pci_set_dma_mask(pcistr[ctr].pdev, 0xffffffffffffffffULL)) {
+                if (!pci_set_dma_mask(pcistr[ctr].pdev, DMA_64BIT_MASK)) {
                     printk("GDT-PCI %d: 64-bit DMA enabled\n", hanum);
-                } else if (pci_set_dma_mask(pcistr[ctr].pdev, 0xffffffff)) {
+                } else if (pci_set_dma_mask(pcistr[ctr].pdev, DMA_32BIT_MASK)) {
                     printk(KERN_WARNING "GDT-PCI %d: Unable to set 64/32-bit DMA\n", hanum);
                     err = TRUE;
                 }

--===============56352401222882076==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============56352401222882076==--
