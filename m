From: Henry <haris@mpa.gr>
Date: Sat, 28 May 2005 00:16:51 +0000
Subject: [KJ] [PATCH] drivers/scsi/gdth.c Use the DMA_32BIT_MASK constant
Message-Id: <200505280316.51652.haris@mpa.gr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============39083690411789473=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============39083690411789473==
Content-Disposition: inline
Content-Type: text/plain;
  charset="iso-8859-7"
Content-Transfer-Encoding: 7bit

Hi, this is my first patch for linux kernel. Don't know if its correct, please check. Its based on an item on the 
TODO list


Signed-off-by: Kouzinopoulos Haris <haris at mpa.gr>

--- linux/drivers/scsi/gdth.c	2005-05-28 02:38:23.000000000 +0300
+++ linux/drivers/scsi/gdth.c.patch	2005-05-28 03:02:33.000000000 +0300
@@ -388,6 +388,7 @@
 #include <linux/proc_fs.h>
 #include <linux/time.h>
 #include <linux/timer.h>
+#include <linux/dma-mapping.h>
 #ifdef GDTH_RTC
 #include <linux/mc146818rtc.h>
 #endif
@@ -4529,15 +4530,15 @@ static int __init gdth_detect(Scsi_Host_
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
+                if (!pci_set_dma_mask(pcistr[ctr].pdev, DMA_32BIT_MASK)) {
                     printk("GDT-PCI %d: 64-bit DMA enabled\n", hanum);
-                } else if (pci_set_dma_mask(pcistr[ctr].pdev, 0xffffffff)) {
+                } else if (pci_set_dma_mask(pcistr[ctr].pdev, DMA_32BIT_MASK)) {
                     printk(KERN_WARNING "GDT-PCI %d: Unable to set 64/32-bit DMA\n", hanum);
                     err = TRUE;
                 }

--===============39083690411789473==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============39083690411789473==--
