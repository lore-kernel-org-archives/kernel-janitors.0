From: Tobias Klauser <tklauser@nuerscht.ch>
Date: Sat, 19 Mar 2005 21:34:54 +0000
Subject: [KJ] [UPDATE PATCH 7/16] drivers/net/sk98lin/skge: Use the DMA_{64,
Message-Id: <20050319213454.GG3306@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============32045783263236194=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============32045783263236194==
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

--- linux-2.6.11.orig/drivers/net/sk98lin/skge.c	2005-03-02 12:50:28.000000000 +0100
+++ linux-2.6.11/drivers/net/sk98lin/skge.c	2005-03-19 20:33:01.000000000 +0100
@@ -112,6 +112,7 @@
 #include	<linux/moduleparam.h>
 #include	<linux/init.h>
 #include 	<linux/proc_fs.h>
+#include	<linux/dma-mapping.h>
 
 #include	"h/skdrv1st.h"
 #include	"h/skdrv2nd.h"
@@ -4912,8 +4913,8 @@ static int __devinit skge_probe_one(stru
 		goto out;
  
 	/* Configure DMA attributes. */
-	if (pci_set_dma_mask(pdev, (u64) 0xffffffffffffffffULL) &&
-	    pci_set_dma_mask(pdev, (u64) 0xffffffff))
+	if (pci_set_dma_mask(pdev, DMA_64BIT_MASK) &&
+	    pci_set_dma_mask(pdev, DMA_32BIT_MASK))
 		goto out_disable_device;
 
 

--===============32045783263236194==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============32045783263236194==--
