From: Tobias Klauser <tklauser@nuerscht.ch>
Date: Sat, 19 Mar 2005 21:39:40 +0000
Subject: [KJ] [UPDATE PATCH 10/16] drivers/net/tlan: Use the DMA_32BIT_MASK
Message-Id: <20050319213940.GJ3306@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============82758909766025779=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============82758909766025779==
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

--- linux-2.6.11.orig/drivers/net/tlan.c	2005-03-02 12:50:28.000000000 +0100
+++ linux-2.6.11/drivers/net/tlan.c	2005-03-19 20:33:01.000000000 +0100
@@ -171,6 +171,7 @@
 #include <linux/ioport.h>
 #include <linux/eisa.h>
 #include <linux/pci.h>
+#include <linux/dma-mapping.h>
 #include <linux/netdevice.h>
 #include <linux/etherdevice.h>
 #include <linux/delay.h>
@@ -555,7 +556,7 @@ static int __devinit TLan_probe1(struct 
 
 		priv->adapter = &board_info[ent->driver_data];
 
-		rc = pci_set_dma_mask(pdev, 0xFFFFFFFF);
+		rc = pci_set_dma_mask(pdev, DMA_32BIT_MASK);
 		if (rc) {
 			printk(KERN_ERR "TLAN: No suitable PCI mapping available.\n");
 			goto err_out_free_dev;

--===============82758909766025779==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============82758909766025779==--
