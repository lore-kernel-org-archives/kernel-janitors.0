From: Tobias Klauser <tklauser@nuerscht.ch>
Date: Sat, 19 Mar 2005 21:41:31 +0000
Subject: [KJ] [UPDATE PATCH 11/16] drivers/net/tokenring/lanstreamer: Use
Message-Id: <20050319214131.GK3306@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============12339336078497087=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============12339336078497087==
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

--- linux-2.6.11.orig/drivers/net/tokenring/lanstreamer.c	2005-03-02 12:50:28.000000000 +0100
+++ linux-2.6.11/drivers/net/tokenring/lanstreamer.c	2005-03-19 20:33:01.000000000 +0100
@@ -118,6 +118,7 @@
 #include <linux/stddef.h>
 #include <linux/init.h>
 #include <linux/pci.h>
+#include <linux/dma-mapping.h>
 #include <linux/spinlock.h>
 #include <linux/version.h>
 #include <linux/bitops.h>
@@ -257,7 +258,7 @@ static int __devinit streamer_init_one(s
 #endif
 #endif
 
-	rc = pci_set_dma_mask(pdev, 0xFFFFFFFFULL);
+	rc = pci_set_dma_mask(pdev, DMA_32BIT_MASK);
 	if (rc) {
 		printk(KERN_ERR "%s: No suitable PCI mapping available.\n",
 				dev->name);

--===============12339336078497087==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============12339336078497087==--
