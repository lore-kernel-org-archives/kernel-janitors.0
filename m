From: Tobias Klauser <tklauser@nuerscht.ch>
Date: Sun, 20 Mar 2005 12:32:40 +0000
Subject: [KJ] [UPDATE PATCH 01/19] drivers/scsi/a100u2w: Use the
Message-Id: <20050320123240.GA3491@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============53779795834301169=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050220164913.GA14375@helium.tklauser.home>
In-Reply-To: <20050220164913.GA14375@helium.tklauser.home>
To: kernel-janitors@lists.osdl.org
Cc: linux-scsi@vger.kernel.org

--===============53779795834301169==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The previous patch did not compile cleanly on all architectures so
here's a fixed one.

Use the DMA_32BIT_MASK constant from dma-mapping.h when calling
pci_set_dma_mask() or pci_set_consistent_dma_mask()
This patch includes dma-mapping.h explicitly because it caused errors
on some architectures otherwise.
See http://marc.theaimsgroup.com/?t=108001993000001&r=1&w=2 for details

Signed-off-by: Tobias Klauser <tklauser@nuerscht.ch>

--- linux-2.6.11.orig/drivers/scsi/a100u2w.c	2005-03-02 12:50:38.000000000 +0100
+++ linux-2.6.11/drivers/scsi/a100u2w.c	2005-03-20 13:27:54.000000000 +0100
@@ -89,6 +89,7 @@
 #include <linux/string.h>
 #include <linux/ioport.h>
 #include <linux/slab.h>
+#include <linux/dma-mapping.h>
 
 #include <asm/io.h>
 #include <asm/irq.h>
@@ -1052,7 +1053,7 @@ static int __devinit inia100_probe_one(s
 
 	if (pci_enable_device(pdev))
 		goto out;
-	if (pci_set_dma_mask(pdev, 0xffffffffULL)) {
+	if (pci_set_dma_mask(pdev, DMA_32BIT_MASK)) {
 		printk(KERN_WARNING "Unable to set 32bit DMA "
 				    "on inia100 adapter, ignoring.\n");
 		goto out_disable_device;

--===============53779795834301169==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============53779795834301169==--
