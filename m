From: Tobias Klauser <tklauser@nuerscht.ch>
Date: Sat, 19 Mar 2005 21:47:44 +0000
Subject: [KJ] [UPDATE PATCH 16/16]
Message-Id: <20050319214744.GP3306@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============14419370203212312=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============14419370203212312==
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

--- linux-2.6.11.orig/drivers/net/wireless/prism54/islpci_hotplug.c	2005-03-02 12:50:28.000000000 +0100
+++ linux-2.6.11/drivers/net/wireless/prism54/islpci_hotplug.c	2005-03-19 20:33:01.000000000 +0100
@@ -21,6 +21,7 @@
 #include <linux/version.h>
 #include <linux/module.h>
 #include <linux/pci.h>
+#include <linux/dma-mapping.h>
 #include <linux/delay.h>
 #include <linux/init.h> /* For __init, __exit */
 
@@ -125,7 +126,7 @@ prism54_probe(struct pci_dev *pdev, cons
 	}
 
 	/* enable PCI DMA */
-	if (pci_set_dma_mask(pdev, 0xffffffff)) {
+	if (pci_set_dma_mask(pdev, DMA_32BIT_MASK)) {
 		printk(KERN_ERR "%s: 32-bit PCI DMA not supported", DRV_NAME);
 		goto do_pci_disable_device;
         }

--===============14419370203212312==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============14419370203212312==--
