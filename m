From: Tobias Klauser <tklauser@nuerscht.ch>
Date: Sat, 19 Mar 2005 19:43:47 +0000
Subject: [KJ] [UPDATE PATCH 3/16] drivers/net/e100: Use the DMA_32BIT_MASK
Message-Id: <20050319194347.GC3306@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============70867414746351343=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============70867414746351343==
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

--- linux-2.6.11.orig/drivers/net/e100.c	2005-03-02 12:50:29.000000000 +0100
+++ linux-2.6.11/drivers/net/e100.c	2005-03-19 20:33:01.000000000 +0100
@@ -143,6 +143,7 @@
 #include <linux/delay.h>
 #include <linux/init.h>
 #include <linux/pci.h>
+#include <linux/dma-mapping.h>
 #include <linux/netdevice.h>
 #include <linux/etherdevice.h>
 #include <linux/mii.h>
@@ -2201,7 +2202,7 @@ static int __devinit e100_probe(struct p
 		goto err_out_disable_pdev;
 	}
 
-	if((err = pci_set_dma_mask(pdev, 0xFFFFFFFFULL))) {
+	if((err = pci_set_dma_mask(pdev, DMA_32BIT_MASK))) {
 		DPRINTK(PROBE, ERR, "No usable DMA configuration, aborting.\n");
 		goto err_out_free_res;
 	}

--===============70867414746351343==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============70867414746351343==--
