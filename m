From: Tobias Klauser <tklauser@nuerscht.ch>
Date: Sun, 20 Mar 2005 12:49:24 +0000
Subject: [KJ] [UPDATE PATCH 10/19] drivers/scsi/eata: Use the DMA_32BIT_MASK
Message-Id: <20050320124924.GJ3491@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============7743794173782339=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050220170503.GK14375@helium.tklauser.home>
In-Reply-To: <20050220170503.GK14375@helium.tklauser.home>
To: kernel-janitors@lists.osdl.org
Cc: linux-eata@i-connect.net, linux-scsi@vger.kernel.org

--===============7743794173782339==
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

--- linux-2.6.11.orig/drivers/scsi/eata.c	2005-03-02 12:50:38.000000000 +0100
+++ linux-2.6.11/drivers/scsi/eata.c	2005-03-20 13:27:54.000000000 +0100
@@ -490,6 +490,7 @@
 #include <linux/init.h>
 #include <linux/ctype.h>
 #include <linux/spinlock.h>
+#include <linux/dma-mapping.h>
 #include <asm/byteorder.h>
 #include <asm/dma.h>
 #include <asm/io.h>
@@ -1430,7 +1431,7 @@ static int port_detect(unsigned long por
 
 	if (ha->pdev) {
 		pci_set_master(ha->pdev);
-		if (pci_set_dma_mask(ha->pdev, 0xffffffff))
+		if (pci_set_dma_mask(ha->pdev, DMA_32BIT_MASK))
 			printk("%s: warning, pci_set_dma_mask failed.\n",
 			       ha->board_name);
 	}

--===============7743794173782339==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============7743794173782339==--
