From: Tobias Klauser <tklauser@nuerscht.ch>
Date: Fri, 18 Mar 2005 17:38:53 +0000
Subject: [KJ] [UPDATE PATCH] drivers/message/fusion/mptbase.c: Use the
Message-Id: <20050318173853.GG3356@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============45967218982186586=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============45967218982186586==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The previous patch did not compile cleanly on all architectures so
here's a fixed one.

Use the DMA_{64,32}BIT_MASK constants from dma-mapping.h when calling
pci_set_dma_mask() or pci_set_consistent_dma_mask()
This patch includes dma-mapping.h explicitly because it caused errors
on some architectures otherwise.
See http://marc.theaimsgroup.com/?t=108001993000001&r=1&w=2 for details

Signed-off-by: Tobias Klauser <tklauser@nuerscht.ch>

--- linux-2.6.11.orig/drivers/message/fusion/mptbase.c	2005-03-02 12:50:40.000000000 +0100
+++ linux-2.6.11/drivers/message/fusion/mptbase.c	2005-03-18 16:05:18.000000000 +0100
@@ -101,6 +101,7 @@
 #include <linux/blkdev.h>
 #include <linux/delay.h>
 #include <linux/interrupt.h>		/* needed for in_interrupt() proto */
+#include <linux/dma-mapping.h>
 #include <asm/io.h>
 #ifdef CONFIG_MTRR
 #include <asm/mtrr.h>
@@ -1084,7 +1085,6 @@ mptbase_probe(struct pci_dev *pdev, cons
 	u32		 psize;
 	int		 ii;
 	int		 r = -ENODEV;
-	u64		 mask = 0xffffffffffffffffULL;
 	u8		 revision;
 	u8		 pcixcmd;
 	static int	 mpt_ids = 0;
@@ -1097,15 +1097,15 @@ mptbase_probe(struct pci_dev *pdev, cons
 	
 	dinitprintk((KERN_WARNING MYNAM ": mpt_adapter_install\n"));
 	
-	if (!pci_set_dma_mask(pdev, mask)) {
+	if (!pci_set_dma_mask(pdev, DMA_64BIT_MASK)) {
 		dprintk((KERN_INFO MYNAM
 			": 64 BIT PCI BUS DMA ADDRESSING SUPPORTED\n"));
-	} else if (pci_set_dma_mask(pdev, (u64) 0xffffffff)) {
+	} else if (pci_set_dma_mask(pdev, DMA_32BIT_MASK)) {
 		printk(KERN_WARNING MYNAM ": 32 BIT PCI BUS DMA ADDRESSING NOT SUPPORTED\n");
 		return r;
 	}
 
-	if (!pci_set_consistent_dma_mask(pdev, mask))
+	if (!pci_set_consistent_dma_mask(pdev, DMA_64BIT_MASK))
 		dprintk((KERN_INFO MYNAM
 			": Using 64 bit consistent mask\n"));
 	else

--===============45967218982186586==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============45967218982186586==--
