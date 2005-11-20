From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Sun, 20 Nov 2005 07:15:37 +0000
Subject: [KJ] [PATCH] drivers/scsi/gdth.c: use DMA_{32,64}BIT_MASK
Message-Id: <20051120071537.GA17439@mipter.zuzino.mipt.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============72449995882998786=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============72449995882998786==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Looks like header should be placed _before_ #else.

--- linux-kj.orig/drivers/scsi/gdth.c
+++ linux-kj/drivers/scsi/gdth.c
@@ -400,6 +400,7 @@
 #include <linux/spinlock.h>
 #if LINUX_VERSION_CODE >= KERNEL_VERSION(2,6,0)
 #include <linux/blkdev.h>
+#include <linux/dma-mapping.h>
 #else
 #include <linux/blk.h>
 #include "sd.h"
@@ -4527,15 +4528,15 @@ static int __init gdth_detect(struct scs
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


--===============72449995882998786==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============72449995882998786==--
