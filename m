From: Tobias Klauser <tklauser@nuerscht.ch>
Date: Mon, 04 Apr 2005 16:10:18 +0000
Subject: [KJ] [PATCH] net/sis900: Use the DMA_32BIT_MASK constant
Message-Id: <20050404161018.GA6657@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============78507344885476549=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============78507344885476549==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Use the DMA_32BIT_MASK constant from dma-mapping.h when calling
pci_set_dma_mask() or pci_set_consistent_dma_mask() instead of custom
macros.
This patch includes dma-mapping.h explicitly because it caused errors
on some architectures otherwise.
See http://marc.theaimsgroup.com/?t=108001993000001&r=1&w=2 for details

Signed-off-by: Tobias Klauser <tklauser@nuerscht.ch>

diff -urpN linux-2.6.11.orig/drivers/net/sis900.c linux-2.6.11/drivers/net/sis900.c
--- linux-2.6.11.orig/drivers/net/sis900.c	2005-03-02 12:50:29.000000000 +0100
+++ linux-2.6.11/drivers/net/sis900.c	2005-03-30 15:16:51.000000000 +0200
@@ -66,6 +66,7 @@
 #include <linux/ethtool.h>
 #include <linux/crc32.h>
 #include <linux/bitops.h>
+#include <linux/dma-mapping.h>
 
 #include <asm/processor.h>      /* Processor type for cache alignment. */
 #include <asm/io.h>
@@ -87,8 +88,6 @@ static int sis900_debug;
 
 /* Time in jiffies before concluding the transmitter is hung. */
 #define TX_TIMEOUT  (4*HZ)
-/* SiS 900 is capable of 32 bits BM DMA */
-#define SIS900_DMA_MASK 0xffffffff
 
 enum {
 	SIS_900 = 0,
@@ -400,7 +399,7 @@ static int __devinit sis900_probe(struct
 	ret = pci_enable_device(pci_dev);
 	if(ret) return ret;
 	
-	i = pci_set_dma_mask(pci_dev, SIS900_DMA_MASK);
+	i = pci_set_dma_mask(pci_dev, DMA_32BIT_MASK);
 	if(i){
 		printk(KERN_ERR "sis900.c: architecture does not support"
 			"32bit PCI busmaster DMA\n");

--===============78507344885476549==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============78507344885476549==--
